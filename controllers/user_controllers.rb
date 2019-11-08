
get '/sign_up_form' do
  erb :sign_up_form
end

post '/user_created' do
  create_user(params[:name], params[:email], params[:password])
  redirect '/login'
end

get '/users' do
  @all_users = find_all_users()
  erb :users
end

get '/user_details' do
  @user = find_single_user(session[:user_id])
  erb :user_details
end

get '/update_user' do
  @user = find_single_user(session[:user_id])
  erb :update_details_form
end

patch '/update_user' do
  update_user_details(params[:name], params[:email])
  redirect '/user_details'
end

get '/delete_user' do
  erb :delete_user_form
end

delete '/delete_user' do
  delete_user(session[:user_id])
  session[:user_id] = nil
  redirect '/'
end