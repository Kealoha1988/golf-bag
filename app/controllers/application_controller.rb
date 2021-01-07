require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :welcome
  end

  get '/user' do
    erb :'/user/new'
  end

  post '/user' do
    golfer = User.new(params[:user])
    
    erb :'user/index'
  end
end
