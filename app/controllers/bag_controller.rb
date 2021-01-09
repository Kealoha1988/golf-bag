class BagController < ApplicationController
  
  
  
  get '/bag/new' do
    if !logged_in?
      redirect '/'
    else

    erb :'bag/new'
    end
  end
  
 
  
  
  get '/bag' do
    if !logged_in?
      redirect '/'
    else
      @user = current_user
    @bags = current_user.bags
 
    erb :'bag/index'
    end
  end
  
  get "/bag/:id/edit" do
    if !logged_in?
      redirect '/login'
    else
    @bag = current_user.bags.find_by(params[:id])
    erb :'bag/edit'
    end
  end
  
  
  
  post '/bag/made' do
    new_bag = current_user.bags.build(params[:bag])
    new_bag.save
    erb :'bag/made'
  end
  
  get '/bag/:id' do
    @bag = Bag.find_by_id(params[:id])
    
    erb :'bag/show'
  end

  patch '/bag/:id' do
    
    @bag = Bag.find_by_id(params[:id])
    redirect '/bag' unless @bag
    if @bag.update(params[:bag])
        redirect "/bag/#{@bag.id}"
    else
        redirect "/bag/#{@bag.id}/edit"
    end 
  end

  delete '/bag/:id' do
  
    @bag = Bag.find_by_id(params[:id])
    if @bag
      @bag.destroy
      redirect "/bag"
    end
  end





end