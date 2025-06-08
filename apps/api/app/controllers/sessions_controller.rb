class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    token = generate_jwt_token(user)
    
    redirect_to "#{ENV['FRONTEND_URL']}/auth/callback?token=#{token}"
  end

  def destroy
    head :no_content
  end

  private

  def generate_jwt_token(user)
    payload = {
      user_id: user.id,
      exp: 30.days.from_now.to_i
    }
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end
end