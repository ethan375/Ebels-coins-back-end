class UserController < ApplicationController

  post '/register' do 
    payload_body = request.body.read
    payload = JSON.parse(payload_body).symbolize_keys
    # puts'---------------------------'
    # puts payload_body
    # puts '-------------------------'
    @user = User.new
    @user.username = payload[:username]
    @user.password = payload[:password]
    @user.save
    session[:username] = @user.username
    session[:logged_in] = true
    session[:user_id] = @user.id
    session[:message] = "logged in as #{@user.username}"
  end 

  post '/login' do
    @password = params[:password]
    @user = User.find_by(username: params[:username])
    success = nil
    if @user && @user.authenticate(@password)
      success = true
      session[:username] = @user.username
      session[:logged_in] = true
      session[:user_id] = @user.id
      session[:message] = "Logged in as #{@user.username}"
    else 
      success = false
      session[:message] = "Invalid username or password"
    end
    resp = {
      message: session[:message],
      success: success
    }.to_json
  end 

  get '/logout' do 
    session[:logged_in] = false
    session[:username] = nil
    session[:user_id] = nil
    session[:message] = "You are now logged out"
  end 

  get '/' do 
    "hey"
  end 
  
end 