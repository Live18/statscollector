class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:show, :edit, :update, :destroy, :set_starters]
  before_action :set_team_invite_coach, only: [:new_coach, :create_coach]
  before_action :set_team_invite_player, only: [:new_player, :create_player]
  before_action :is_coach?, only: [:show]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @coach_associations = UserAssociation.where(:team_id => @team, :role => "coach")
    @player_associations = UserAssociation.where(:team_id => @team, :role => "player")
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        #format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_coach
    @user = User.new
  end

  def new_player
    @user = User.new
  end

  def create_coach
    temp_password = SecureRandom.uuid
    @user = User.create(coach_params.merge(:password => temp_password))
    @coach_asociation = UserAssociation.create(:team_id => @team.id, :user_id => @user.id, :role => 'coach')
    UserMailer.with(team: @team, user: @user.id, :temp_password => temp_password).invitation_email.deliver_now
    redirect_to @team
  end

  def create_player
    temp_password = SecureRandom.uuid
    @user = User.create(player_params.merge(:password => temp_password))
    @player_asociation = UserAssociation.create(:team_id => @team.id, :user_id => @user.id, :role => 'player')
    UserMailer.with(team: @team, user: @user.id, :temp_password => temp_password).player_invitation_email.deliver_now
    redirect_to @team
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    def set_team_invite_coach
      @team = Team.find(params[:team_id])
    end

    def set_team_invite_player
      @team = Team.find(params[:team_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :logo, :mascot)
    end

    def coach_params
      params.require(:user).permit(:email)
    end

    def player_params
      params.require(:user).permit(:email)
    end

    def is_coach?
      @user_association = UserAssociation.find_by(:user_id => current_user.id, :team_id => @team.id)
      @is_coach = @user_association && @user_association.role === 'coach'
    end
end
