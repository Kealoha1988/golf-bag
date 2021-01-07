class BagController < ApplicationController

  
  get '/bag/new' do
    erb :'bag/new'
  end



  get '/bag' do
    @bags = Bag.all

    erb :'bag/index'
  end

  post '/bag/made' do
    erb :'bag/made'
  end

  post '/bag' do
    bag = Bag.new(params[:bag])
    bag.save
    erb :'bag/made'
  end

  delete '/bag/delete' do
  @bags[id].clear
end



end