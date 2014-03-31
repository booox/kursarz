class SessionsController < ApplicationController
  def github
    user = GithubAuthentication.from_omniauth(env["omniauth.auth"])
    session[:user] = user.uid

    redirect_to root_url, notice: "Hello, #{user.name}!"
  end

  def bitbucket
    user = BitbucketAuthentication.from_omniauth(env["omniauth.auth"])
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
