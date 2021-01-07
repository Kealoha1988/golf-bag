class BagController < ApplicationController

  
  
  get '/bag/new' do
    erb :'bag/new'
  end


  get '/bag' do
    @bags = Bag.all

    erb :'bag/index'
  end

  get "/bag/:id/edit" do
    @bag = Bag.find_by_id(params[:id])
    erb :'bag/edit'
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
  
  patch '/bag/:id' do
    @bag = Bag.find_by_id(params[:id])
    redirect '/bag' unless @bag
    if @bag.update(params[:bag])
        redirect "/bag/#{@bag.id}"
    else
        redirect "/bag/#{@bag.id}/edit"
    end

    delete '/bag/3' do
      "Hello World"
    end

    private

    def find_bag
      @bag = Bag.find_by_id(params[:id])
    end


end





end