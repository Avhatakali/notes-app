module SessionsHelper

  def log_in
    params[:session].as_json
  end

  def login_url
    'http://localhost:3000/auth/login'
  end
end
