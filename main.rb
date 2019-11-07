require 'sinatra'
require 'pry'
require 'pg'

if settings.development?
  require 'sinatra/reloader'
end

require_relative 'models/bills'
require_relative 'models/users'
require_relative 'controllers/user_controllers'
require_relative 'controllers/bills_controllers'

enable :sessions

get '/' do
  erb :index
end

get '/login' do
  erb :login_page
end

post '/login' do

  @user = find_user_by_name(params[:name])

  if BCrypt::Password.new(@user["password_digest"]) == params[:password]
    session[:user_id] = @user["id"]
    session[:login_failed] = false
    erb :user_home_page

  else
    session[:login_failed] = true
    erb :login_page
  end'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end