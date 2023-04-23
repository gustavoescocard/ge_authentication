class ApplicationController < ActionController::Base
  before_action :expire_session

  private

  def expire_session
    logout if session[:expires_at].presence && session[:expires_at] < Time.current
  end

  def login(user)
    session[:user_id] = user.id
    session[:expires_at] = Time.current + 60.seconds
  end

  def logout
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] 
  end
  helper_method :current_user
end
