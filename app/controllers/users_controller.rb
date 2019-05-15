conn = Faraday.new
response = conn.get 'http://localhost:3000/users'

class UsersController < ApplicationController

  def new
  end

  def create
    HTTParty.post('http://localhost:3000/signup', body: user_params)
  end

  private

  def user_params
    params.require(:user)
          .permit(:name, :username, :email, :password, :password_confirmation).as_json
  end
end
