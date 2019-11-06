def add_bill(user_id, date, description, amount, category)
  run_sql("INSERT INTO bills (user_id, date, description, amount, category) VALUES (#{user_id}, '#{date}', '#{description}', #{amount}, '#{category}');")
end

def find_bills_by_user_id(id)
  return run_sql("SELECT * FROM bills WHERE user_id = #{id};")
end

def find_single_bill(id)
  return run_sql("SELECT * FROM bills WHERE id = #{id};").first
end

def update_bill(id)
  run_sql("UPDATE bills SET date = '#{params[:date]}', description = '#{params[:description]}', amount = #{params[:amount]}, category = '#{params[:category]}' WHERE id = #{id};")
end

def delete_bill(id)
  run_sql("DELETE FROM bills WHERE id = #{id};")
end