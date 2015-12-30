require "./config/environment"
require "./app/models/user"

class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    if logged_in?
      @user = current_user
      @stories = @user.current_stories
      erb :"homepage/index"
    else
      @stories = Channel.basic_channels.map{|channel| channel.create_story}
      erb :"homepage/no_user"
    end
  end

  get '/login' do
    if logged_in?
      redirect to "/"
    else
      erb :"log/in"
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/'
    else
      erb :"log/failure"
    end
  end

  get '/logout' do
    if !logged_in?
      redirect to "/"
    else
      erb :"log/out"
    end
  end

  post '/logout' do
    if logged_in?
      session.clear
    end
    redirect to '/'
  end

  get '/signup' do

  end

  get '/add_remove' do

  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end
