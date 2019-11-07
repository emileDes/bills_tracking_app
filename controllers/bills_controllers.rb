get '/bills_tracker' do
  @user_bills = find_bills_by_user_id(session[:user_id])
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