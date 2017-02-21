class CallbacksController < ApplicationController
  def facebook
    omniauth_redirect
  end

  def twitter
    omniauth_redirect
  end

  private

  def omniauth_redirect
    data = request.env['omniauth.auth']
    @user = User.find_from_oauth(data)
    @user ||= User.create_from_oauth(data)
    @user.update_from_oauth(data) if @user.provider != data['provider']
    session[:user_id] = @user.id
    redirect_to home_path
  end
end
