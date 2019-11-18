class GamesController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_game, only: [:show, :edit, :update, :destroy, :set_starters, :complete]
  before_action :allow_admin, only: [:new, :create, :update, :edit, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @home_team = Team.find(@game.home_team)
    @away_team = Team.find(@game.away_team)
  end

  # GET /games/new
  def new
    @game = Game.new
    @teams = Team.all
  end

  # GET /games/1/edit
  def edit
  end

  def new_starters
    
  end

  def set_starters
    @game = Game.find(params[:game_id])
    @team = Team.find(@game[request.query_parameters['team']])
    @player_associations = UserAssociation.where(:team_id => @team.id, :role => "player")
    @scoreboard = Scoreboard.find_by(:game_id => @game.id)
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    respond_to do |format|
      if @game.save
        @scoreboard = Scoreboard.create(:game_id => @game.id)
        @game.update(:scoreboard_id => @scoreboard.id)
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def complete
    @home_team = Team.find(@game.home_team)
    @away_team = Team.find(@game.away_team)
    @complete_game = Game.find(@game.id)
    @scoreboard = Scoreboard.find_by(:game_id => @game.id)
    @all_home_players = UserAssociation.where(:team_id => @scoreboard.game.home_team, :role => "player")
    @all_away_players = UserAssociation.where(:team_id => @scoreboard.game.away_team, :role => "player")
    @home_team_stats = GameStat.where(:game_id => @scoreboard.game_id, :user_id => @all_home_players.pluck(:user_id))
    @away_team_stats = GameStat.where(:game_id => @scoreboard.game_id, :user_id => @all_away_players.pluck(:user_id))
    @home_final_score = @home_team_stats.pluck(:pts).reduce(0) {|result, current| result += current}
    @away_final_score = @away_team_stats.pluck(:pts).reduce(0) {|result, current| result += current}
    if @home_final_score > @away_final_score
      @home_team.wins += 1
      @away_team.losses += 1
    else
      @home_team.losses += 1
      @away_team.wins += 1
    end
    @home_team.save
    @away_team.save
    @complete_game.is_complete = true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id] || params[:game_id])
    end

    # def set_team
    #   coach_association = UserAssociation.find_by(:user_id => current_user.id, :role => "coach")
    #   #if coach_association.nil?
    #   #  redirect_to game_path(@game)
    #   #  return
    #   # end
    #   @team = Team.find(params[:id] || params[:team_id])
      
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:date, :home_team, :away_team, :scoreboard_id)
    end

    def allow_admin
      unless current_user.admin
        respond_to do |format|
          format.html { redirect_to games_url, notice: 'You don\'t have permission to do that.' }
          format.json { head :no_content } 
        end
      end
    end
end
