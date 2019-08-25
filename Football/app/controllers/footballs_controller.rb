require 'securerandom'

class FootballsController < ApplicationController
    def create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.urlsafe_base64 unless u.password != nil
      end
  
      session[:user_id] = @user.id
      redirect_to user_leagues_path(@user)
    end
  
    def index
    end
  
    private
  
    def auth
      request.env['omniauth.auth']
    end
end
