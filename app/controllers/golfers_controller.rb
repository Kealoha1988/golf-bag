class GolfersController < ApplicationController

  get '/golfers' do        #show all users
    @all_users = User.all
    erb :'golfers/index'
  end

  get '/golfers/:id' do    #show individual
    @user = User.all.find_by(id: params[:id])
    redirect_if_no_golfer
    erb :'golfers/show'
  end 


  private

  def redirect_if_no_golfer
    if @user.nil?
      redirect '/bouncer'
  end
end

end