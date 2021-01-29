class GolfersController < ApplicationController

  get '/golfers' do        #show all users
    @all_users = User.all
    erb :'golfers/index'
  end

  get '/golfers/:id' do    #show individual
    @user = User.all.find_by(id: params[:id])
    erb :'golfers/show'
  end 

end