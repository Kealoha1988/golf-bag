class UserController < ApplicationController


  post '/users' do   #saves new user sends to login
    @user = User.new
    @user.name = params[:name]
    @user.password = params[:password]
    if @user.save
      redirect '/login'
    else
      erb :'user/new'
    end
  end

  get '/user/:id' do    #show user edit form
    if logged_in?
    @user = current_user
    erb :'user/edit'
    else
      erb :"people/bouncer"
  end
end

  patch '/user/:id' do      #edit user
    @user = current_user
    redirect '/user' unless @user
    if @user.update(params[:user])
        redirect "/bag"
    else
        redirect "/"
    end 
  end


  delete '/user/:id' do    #delete user
    @user = current_user
    if @user
      @user.destroy
      redirect "/"
    end
  end

end