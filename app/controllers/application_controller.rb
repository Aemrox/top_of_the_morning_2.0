require "./config/environment"
require "./app/models/user"

class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  set :public_folder, File.join(root, "../../public")


  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    if logged_in?
      @user = current_user
      @stories = @user.current_stories
      if session[:added]
        @added = true
        session[:added] = false
      end
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
    erb :"signup/page"
  end

  post '/signup' do
    user = User.new(username: params[:username], password: params[:password])
		if (params[:username]!="") && user.save
      session[:user_id] = user.id
			redirect "/"
		else
			erb :"signup/failure"
		end
  end

  get '/add_remove' do
    if logged_in?
      @channels = current_user.channels
      @sites = Site.expandable
      erb :"user_actions/add_remove"
    else
      redirect to "/login"
    end
  end

  post '/add' do
    site = Site.find_by(name: params[:site])
    if site.validate(params[:modifier])
      current_user.channels << Channel.find_or_create_by(name: params[:modifier], site_id: site.id)
      session[:added] = true
      redirect to '/'
    else
      @sites = Site.expandable
      erb :"user_actions/add_fail"
    end
  end

  post '/remove' do
    channel = Channel.find_by(name: params[:channel])
    if channel
      current_user.channels.delete(channel)
      redirect '/'
    else
      erb :"user_actions/remove_fail"
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      if session[:user_id]
        User.find(session[:user_id])
      else
        false
      end
    end
  end
end
