class ScoreboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_scoreboard, only: [:show, :edit, :update, :destroy]
  before_action :set_game, only: [:show, :edit, :destroy, :set_game, :rosters_confirmed]
  before_action :is_coach?, only: [:show]

  # GET /scoreboards
  # GET /scoreboards.json
  def index
    @scoreboards = Scoreboard.all
  end

  # GET /scoreboards/1
  # GET /scoreboards/1.json
  def show
  end

  # GET /scoreboards/new
  def new
    @scoreboard = Scoreboard.new
  end

  # GET /scoreboards/1/edit
  def edit
  end

  # POST /scoreboards
  # POST /scoreboards.json
  def create
    @scoreboard = Scoreboard.new(scoreboard_params)

    respond_to do |format|
      if @scoreboard.save
        format.html { redirect_to @scoreboard, notice: 'Scoreboard was successfully created.' }
        format.json { render :show, status: :created, location: @scoreboard }
      else
        format.html { render :new }
        format.json { render json: @scoreboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scoreboards/1
  # PATCH/PUT /scoreboards/1.json
  def update
    @game = Game.find(@scoreboard.game_id)
    respond_to do |format|
      if @scoreboard.update(scoreboard_params)
        home_team_current_players = JSON.parse(@scoreboard.home_team_current_players)
        away_team_current_players = JSON.parse(@scoreboard.away_team_current_players)
        if !@scoreboard.roster_email_sent && (home_team_current_players.length == 5  && away_team_current_players.length == 5)
          UserMailer.with(team: @team, scoreboard: @scoreboard.id).confirmed_rosters_email.deliver_now
          @scoreboard.update(roster_email_sent: true)
        end
        redirect_back(fallback_location: root_path)
        return
      else
        if Team.find(@game.home_team).is_coach?(current_user)
          format.html { redirect_to game_set_starters_path(@scoreboard.game_id, :team => scoreboard_params["home_team_current_players"].length > 0 ? 'home_team' : 'away_team'), :flash => { :danger => 'You must have 5 players' }}
          format.json { render json: @scoreboard.errors, status: :unprocessable_entity }
        else
          format.html { redirect_to game_set_starters_path(@scoreboard.game_id, :team => scoreboard_params["away_team_current_players"].length > 0 ? 'home_team' : 'away_team'), :flash => { :danger => 'You must have 5 players' }}
          format.json { render json: @scoreboard.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /scoreboards/1
  # DELETE /scoreboards/1.json
  def destroy
    @scoreboard.destroy
    respond_to do |format|
      format.html { redirect_to scoreboards_url, notice: 'Scoreboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start_game
    @scoreboard = Scoreboard.find(params[:scoreboard_id])
    @game = Game.find(@scoreboard.game_id)
    @home_team = Team.find(@game.home_team)
    @away_team = Team.find(@game.away_team)
    @all_home_players = UserAssociation.where(:team_id => @home_team.id, :role => "player")
    @all_away_players = UserAssociation.where(:team_id => @away_team.id, :role => "player")
    @home_team_current_players = JSON.parse(@scoreboard.home_team_current_players)
    @away_team_current_players = JSON.parse(@scoreboard.away_team_current_players)
    @home_team_stats = GameStat.where(:game_id => @game.id, :user_id => @all_home_players.pluck(:user_id))
    @away_team_stats = GameStat.where(:game_id => @game.id, :user_id => @all_away_players.pluck(:user_id))
  end

  def add_points
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scoreboard
      @scoreboard = Scoreboard.find(params[:id])
    end

    def set_game
      @game = Game.find(params[:id] || params[:game_id])
    end

    def is_coach?
      @user_association = UserAssociation.find_by(:user_id => current_user.id, :team_id => @team.id)
      @is_coach = @user_association && @user_association.role === 'coach'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scoreboard_params
      params.require(:scoreboard).permit(:home_team_score, :away_team_score, :home_team_timeouts_remaining, :away_team_timeouts_remining, :period, :home_team_fouls, :away_team_fouls, :posession_arrow, :home_team_current_players => [], :away_team_current_players => [])
    end
end
