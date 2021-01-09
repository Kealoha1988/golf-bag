class UserController < ApplicationController

  get '/users/new' do
    erb :'users/new'
  end


  post '/users' do
    @user = User.new
    @user.name = params[:name]
    @user.password = params[:password]
    if @user.save
      redirect '/login'
    else
      erb :'users/new'
    end
  end

  get '/user' do
    @all_users = User.all
    erb :'user/index'
  end
  get '/user/:id' do
    @user = User.find_by(:id => params[:id])
    
    erb :'user/show'
  end

end