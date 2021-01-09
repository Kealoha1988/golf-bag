class PeopleController < ApplicationController

  get '/people' do
    @all_users = User.all
    erb :'people/index'
  end

  get '/people/:id' do 
    bouncer

    @user = User.all.find_by(:id => params[:id])
    erb :'people/show'
  end 

end