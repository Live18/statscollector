class UserMailer < ApplicationMailer
  default from: 'billwagner101@hotmail.com'

  def invitation_email
    @user = User.find(params[:user])
    @url = 'localhost3000/login'
    @temp_password = params[:temp_password]
    @team = params[:team]
    mail(to: @user.email, subject: "You've been invited to a team")
  end

  def player_invitation_email
    @user = User.find(params[:user])
    @url = 'localhost3000/login'
    @temp_password = params[:temp_password]
    @team = params[:team]
    mail(to: @user.email, subject: "You've been invited to a team")
  end

  def roster_reminder_email
    @user = User.find(params[:user])
    @url = "localhost3000/games/#{params[:game_id]}/setRoster"
    mail(to: @user.email, subject: "Please set your roster")
  end

  def confirmed_rosters_email
    @scoreboard = Scoreboard.find(params[:scoreboard])
    
    @home_team = Team.find(@scoreboard.game.home_team)
    @home_team_players = UserAssociation.where(:team_id => @home_team.id, :role => "player")

    @away_team = Team.find(@scoreboard.game.away_team)
    @away_team_players = UserAssociation.where(:team_id => @away_team.id, :role => "player")

    @team_coaches = UserAssociation.where(:team_id => [@home_team.id, @away_team.id], :role => 'coach')

    mail(to: @team_coaches.map { |coach| coach.user.email } , subject: 'Rosters are confirmed')
    
  end
end
