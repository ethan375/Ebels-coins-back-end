class UserController < ApplicationController

  post '/register' do 
    @user = User.new
    @username = params[:username]
    @password = params[:password]
    @user.save
    session[:logged_in] = true
    session[:user_id] = @user.id
    session[:username] = @user.username
    session[:message] = "You are logged in"
    resp = {
      message: session[:message]
    }.to_json
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
  
end 