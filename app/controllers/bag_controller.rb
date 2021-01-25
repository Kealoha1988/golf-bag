class BagController < ApplicationController
  
  
  
  get '/bags/new' do    #create new bag
    if !logged_in?
      redirect '/'
    else
      erb :'bags/new'
    end
  end
  
  
  get '/bags' do       #show user and bag
    if !logged_in?
      redirect '/'
    else
      current_user
      @bags = current_user.bags
      erb :'bags/index'
    end
  end
  
  
  
  post '/bags/made' do    #save bag
    new_bag = current_user.bags.build(params[:bag])
    if new_bag.save
      erb :'bags/made'
    else 
      redirect '/bags'
    end
  end
  

  
  get '/bags/:id' do    #show individual bag
    if logged_in?
      find_bag
      if_not_yours
      erb :'bags/show'
    else
      erb :"golfers/bouncer"
    end
  end
  
  get "/bags/:id/edit" do      #show edit form
    if !logged_in?
      redirect '/login'
    else
      find_bag
      if_not_yours
      erb :'bags/edit'
    end
  end


  patch '/bags/:id' do      #edit individual bag
    find_bag
    if_not_yours
    redirect '/bags' unless @bag
    if @bag.update(params[:bag])
        redirect "/bags/#{@bag.id}"
    else
        redirect "/bags/#{@bag.id}/edit"
    end 
  end

  delete '/bags/:id' do     #delete individual bag
    find_bag
    if @bag
      @bag.destroy
      redirect "/bags"
    end
  end





end