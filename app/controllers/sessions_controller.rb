class SessionsController < ApplicationController
  def create
    if params[:provider].eql? "github"
      user = GithubAuthentication.from_omniauth(env["omniauth.auth"])
    elsif params[:provider].eql? "bitbucket"
      user = BitbucketAuthentication.from_omniauth(env["omniauth.auth"])
    end
    
    session[:user] = user.uid

    redirect_to root_url, notice: "Hello, #{user.name}!"
  end

  def destroy
    session.delete(:user)
    redirect_to root_url, notice: "Logged out successfully!"
  end

  def failure
    redirect_to root_url, error: 'An error occured. Please try again later.'
  end
end
