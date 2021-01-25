class BagController < ApplicationController
  
  
  
  get '/bags/new' do    #create new bag
    redirect_if_not_logged_in
    erb :'bags/new'
  end
  
  
  get '/bags' do       #show user and bag
    redirect_if_not_logged_in
    current_user
    @bags = current_user.bags
    erb :'bags/index'
  end
  
  
  
  post '/bags/made' do    #save bag
    redirect_if_not_logged_in
    new_bag = current_user.bags.build(params[:bag])
    if new_bag.save
      erb :'bags/made'
    else 
      redirect '/bags'
    end
  end
  

  
  get '/bags/:id' do    #show individual bag
    redirect_if_not_logged_in
    current_user
    find_bag
    redirect_if_not_yours
    erb :'bags/show'
  end
  
  get "/bags/:id/edit" do      #show edit form
    redirect_if_not_logged_in
    current_user
    find_bag
    redirect_if_not_yours
    erb :'bags/edit'
  end


  patch '/bags/:id' do      #edit individual bag
    redirect_if_not_logged_in
    current_user
    find_bag
    redirect_if_not_yours
    redirect '/bags' unless @bag
    if @bag.update(params[:bag])
        redirect "/bags/#{@bag.id}"
    else
        redirect "/bags/#{@bag.id}/edit"
    end 
  end

  delete '/bags/:id' do     #delete individual bag
    redirect_if_not_logged_in
    current_user
    find_bag
    redirect_if_not_yours
    if @bag
      @bag.destroy
      redirect "/bags"
    end
  end

end