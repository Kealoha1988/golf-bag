class UsersController < ApplicationController

  get '/welcome' do 
    redirect_if_not_logged_in
    @name = current_user.name
    erb :'users/welcome'
  end


  post '/users' do   #saves new user sends to login
    @user = User.new
    @user.name = params[:name]
    @user.password = params[:password]
    if @user.save
      login(params[:name], params[:password])
      @name = params[:name]
      erb :'users/welcome'
    else
      erb :'/'
    end
  end

  get '/users/:id/edit' do    #show user edit form
    redirect_if_not_logged_in
    current_user
    redirect_if_not_you
    erb :'users/edit'
  end

  patch '/users/:id/edit' do      #edit user
    redirect_if_not_logged_in
    current_user
    redirect_if_not_you
    if @user.update(params[:user])
        redirect "/bags"
    else
        redirect "/"
    end 
  end


  delete '/users/:id' do    #delete user
    redirect_if_not_logged_in
    current_user
    redirect_if_not_you
    if @user
      @user.bags.each{|b| b.delete}
      @user.destroy
      redirect "/"
    end
  end

end