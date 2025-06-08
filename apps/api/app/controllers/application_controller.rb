class ApplicationController < ActionController::API
  before_action :authenticate_user!

  private

  def authenticate_user!
    @current_user = User.find(decoded_token[:user_id]) if decoded_token
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
  rescue JWT::DecodeError, ActiveRecord::RecordNotFound
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  def decoded_token
    return @decoded_token if defined?(@decoded_token)
    
    token = request.headers['Authorization']&.split(' ')&.last
    return unless token

    @decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: 'HS256')[0].with_indifferent_access
  rescue JWT::DecodeError
    nil
  end

  def current_user
    @current_user
  end
end
