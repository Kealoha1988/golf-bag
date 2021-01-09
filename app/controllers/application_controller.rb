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

  get '/user/new' do
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
     User.find_by(:id => session[:user_id]) if session[:user_id]
    end

    def if_not_yours
      redirect '/bag' unless @bag.owner == current_user
    end




  end

end
