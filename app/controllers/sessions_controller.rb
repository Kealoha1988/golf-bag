class SessionsController < ApplicationController

get '/login' do 
  erb :'sessions/login'
end



post '/' do  #sets session 
  login(params[:name], params[:password])
  redirect '/welcome'
end

get '/logout' do
  logout!
  redirect '/'
end



end