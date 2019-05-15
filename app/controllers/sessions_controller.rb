class SessionsController < ApplicationController
  def new
  end

  def create
    response =  HTTParty.post(login_url, body: log_in)
    flash[:success] = "Welcome to the Sample App!"
    auth_token = @auth_token ||= response["auth_token"]
    session[:auth_token] = auth_token
    redirect_to notes_path
  end

  def destroy
  end
end
