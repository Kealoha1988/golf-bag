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

  get '/user/new' do    #show signin form
    erb :'user/new'
  end


  get '/bouncer' do
   erb :'people/bouncer'
  end
  
  helpers do

    def logged_in?
      !!current_user
    end

    
    def login(name, password) 
      #Check if user.name exists, if true make session, if false redirect to login
      #Is user who they claim to be
      user = User.find_by(:name => name)
        if user && user.authenticate(password)
        session[:user_id] = user.id
      else
        redirect '/login'
      end
    end

    def logout!
      session.clear
    end

    def current_user
     @user = User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def find_bag
      @bag = Bag.find_by_id(params[:id])
    end

    def if_not_yours
      if @bag.user != current_user
        redirect '/bags'
      end
    end

  end


end
