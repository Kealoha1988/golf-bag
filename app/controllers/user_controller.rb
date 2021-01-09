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

end