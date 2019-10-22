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
end
