class BagController < ApplicationController

  
  
  get '/bag/new' do
    erb :'bag/new'
  end


  get '/bag' do
    @bags = Bag.all

    erb :'bag/index'
  end
  


  post '/bag/made' do
    bag = Bag.new(params[:bag])
    bag.save
    erb :'bag/made'
  end
  
  get '/bag/:id' do
    @bag = Bag.find_by_id(params[:id])
  
    erb :'bag/show'
  end




end