class BagController < ApplicationController
  
  
  
  get '/bag/new' do    #create new bag
    if !logged_in?
      redirect '/'
    else

    erb :'bag/new'
    end
  end
  
  
  get '/bag' do       #show user and bag
    if !logged_in?
      redirect '/'
    else
      @user = current_user
    @bags = current_user.bags
 
    erb :'bag/index'
    end
  end
  
  get "/bag/:id/edit" do      #show edit form
    if !logged_in?
      redirect '/login'
    else
    @bag = current_user.bags.find_by(params[:id])
    erb :'bag/edit'
    end
  end
  
  
  
  post '/bag/made' do    #save bag
    new_bag = current_user.bags.build(params[:bag])
    new_bag.save
    erb :'bag/made'
  end
  
  get '/bag/:id' do    #show individual bag
    if logged_in?
    @bag = Bag.find_by_id(params[:id])
    erb :'bag/show'
    else
      erb :"people/bouncer"
    end
  end

  patch '/bag/:id' do      #edit individual bag
    @bag = Bag.find_by_id(params[:id])
    redirect '/bag' unless @bag
    if @bag.update(params[:bag])
        redirect "/bag/#{@bag.id}"
    else
        redirect "/bag/#{@bag.id}/edit"
    end 
  end

  delete '/bag/:id' do     #delete individual bag
    @bag = Bag.find_by_id(params[:id])
    if @bag
      @bag.destroy
      redirect "/bag"
    end
  end





end