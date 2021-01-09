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

  get '/user/:id' do
    @user = current_user
    erb :'user/edit'
  end

  patch '/user/:id' do
    @user = current_user
    redirect '/user' unless @user
    if @user.update(params[:user])
        redirect "/user/#{@user.id}"
    else
        redirect "/"
    end 
  end


  delete '/user/:id' do
  
    @user = current_user
    if @user
      @user.destroy
      redirect "/"
    end
  end

end