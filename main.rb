require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'

require_relative 'models/users'
require_relative 'models/bills'
require_relative 'controllers/user_controllers'

enable :sessions

get '/' do
  erb :index
end

get '/login' do
  erb :login_page
end

post '/login' do

  @user = find_user_by_name(params[:name])
# binding.pry
  if BCrypt::Password.new(@user["password_digest"]) == params[:password]
    session[:user_id] = @user["id"]
    session[:login_failed] = false
    erb :user_home_page

  else
    session[:login_failed] = true
    erb :login_page
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/bills_tracker' do
  @user_bills = find_bills_by_user_id(session[:user_id])
  # binding.pry
  erb :bills_tracker 
end

post '/add_bill' do
  add_bill(session[:user_id], params[:date], params[:description], params[:amount], params[:category])
  redirect '/bills_tracker'
end

get '/bill_details' do
  @single_bill = find_single_bill(params[:id])
  erb :bill_details
end

get '/update_bill' do
  @single_bill = find_single_bill(params[:id])
  erb:update_bill
end

patch '/update_bill' do
  update_bill(params[:id])
  redirect "/bill_details?id=#{params[:id]}"
end

delete '/delete_bill' do
  delete_bill(params[:id])
  redirect 'bills_tracker'
end