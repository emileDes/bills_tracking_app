require 'bcrypt'

def run_sql(sql)
  conn = PG.connect(dbname: "billtrackingapp")
  records = conn.exec(sql)
  conn.close
  return records
end

def create_user(name, email, password)
  password_digest = BCrypt::Password.create(password)
  sql = "INSERT INTO users (name, email, password_digest) VALUES ('#{name}', '#{email}', '#{password_digest}');"
  run_sql(sql)
end

def find_all_users()
  return run_sql("SELECT * FROM users;")
end

def find_single_user(id)
  return run_sql("SELECT * FROM users WHERE id = #{id};").first
end

def find_user_by_name(name)
  
  return run_sql("SELECT * FROM users WHERE name = '#{name}';").first
end

def update_user_details(name, email)
  return run_sql("UPDATE users SET name = '#{name}', email = '#{email}' where id = #{ session[:user_id] };")
end

def delete_user(id)
  return run_sql("DELETE FROM users WHERE id = '#{ id }'")
end