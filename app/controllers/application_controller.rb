require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do 
    erb :'welcome'
  end

  get '/users/new' do    #show signin form
    erb :'users/new'
  end


  get '/bouncer' do
   erb :'bouncer'
  end




  helpers do

    def current_user
     @user = User.find_by_id(session[:user_id]) if session[:user_id]
    end

    
    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/bouncer'
      end
    end

    
    def login(name, password) 
      #Check if user.name exists, if true make session, if false redirect to login
      #Is user who they claim to be
      user = User.find_by(name: name)
        if user && user.authenticate(password)
        session[:user_id] = user.id
      else
        redirect '/login'
      end
    end

    def logout!
      session.clear
    end


    def find_bag
      @bag = Bag.find_by_id(params[:id])
    end


    def redirect_if_not_you
      if @user.nil? || @user != User.find_by_id(params[:id])
        redirect '/bouncer'
      end
    end


    def redirect_if_not_yours
      if @bag.nil? || @bag.user.nil? || @bag.user != current_user
        redirect '/bouncer'
      end
    end


  end
end
