class UsersController < ApplicationController


  get '/users/new' do    #show signin form
    erb :'users/new'
  end

  get '/welcome' do 
    redirect_if_not_logged_in
    @name = current_user.name
    erb :'users/welcome'
  end




  post '/users' do   #saves new user sends to login
    @user = User.new
    @user.name = params[:name]
    @user.password = params[:password]
    if !params[:name].nil? && !params[:password].nil? && @user.save
      session[:user_id] = @user.id
      @name = params[:name]
      redirect '/welcome'
    else
      redirect '/'
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