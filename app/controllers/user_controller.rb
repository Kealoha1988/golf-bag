class UserController < ApplicationController


  post '/users' do
    @user = User.new
    @user.name = params[:name]
    @user.password = params[:password]
    if @user.save
      redirect '/login'
    else
      erb :'user/new'
    end
  end

  get '/user/:id' do
    if logged_in?
    @user = current_user
    erb :'user/edit'
    else
      erb :"people/bouncer"
  end
end

  patch '/user/:id' do
    @user = current_user
    redirect '/user' unless @user
    if @user.update(params[:user])
        redirect "/bag"
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