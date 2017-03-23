#
# MySQL TEST
#

  HOST = '172.0.0.1'
  USER = 'mruby_test'
  PASSWORD = 'mruby_test'
  DATABASE = 'mruby_test'
  PORT = 3306

assert("MySQL is a module") do
  assert_equal(Module, MySQL.class)
end

assert("MySQL::Database is a class") do
  assert_equal(Class, MySQL::Database.class)
end

assert("MySQL::Database::ResultSet is a class") do
  assert_equal(Class, MySQL::Database::ResultSet.class)
end

assert("MySQL::Database.new require least 4 arguments") do
  assert_raise(ArgumentError) { MySQL::Database.new HOST }
  assert_raise(ArgumentError) { MySQL::Database.new HOST, USER }
  assert_raise(ArgumentError) { MySQL::Database.new HOST, USER, PASSWORD }
end

assert("MySQL::Databse.new, MySQL::Database#close") do
  db = MySQL::Database.new HOST, USER, PASSWORD, DATABASE
  assert_equal(MySQL::Database, db.class)
  db.close
end

assert("MySQL::Database.new accept optional port number") do
  db = MySQL::Database.new HOST, USER, PASSWORD, DATABASE, PORT
  assert_equal(MySQL::Database, db.class)
  db.close
end

assert("MySQL::Database#execute, MySQL::Database::ResultSet#close") do
  db = MySQL::Database.new HOST, USER, PASSWORD, DATABASE, PORT
  result = db.execute("")

  db.close
  result.close

  assert_equal(MySQL::Database::ResultSet, result.class)
end

assert("MySQL::Database#execute_batch") do
  db = MySQL::Database.new HOST, USER, PASSWORD, DATABASE, PORT
  result = db.execute("")
  db.close
  result.close
end

assert("MySQL::Database#changes") do
  db = MySQL::Database.new HOST, USER, PASSWORD, DATABASE, PORT
end

assert("MySQL::Database#transaction") do
  db = MySQL::Database.new HOST, USER, PASSWORD, DATABASE, PORT
end

assert("MySQL::Database#commit") do
  db = MySQL::Database.new HOST, USER, PASSWORD, DATABASE, PORT
end

assert("MySQL::Database#rollback") do
end


assert("MySQL::Database::ResultSet#next") do
  db = MySQL::Database.new HOST, USER, PASSWORD, DATABASE, PORT
end

assert("MySQL::Database::ResultSet#close") do
  db = MySQL::Database.new HOST, USER, PASSWORD, DATABASE, PORT
end

assert("MySQL::Database::ResultSet#fields") do
  db = MySQL::Database.new HOST, USER, PASSWORD, DATABASE, PORT
end

assert("MySQL::Database::ResultSet#eof?") do
  db = MySQL::Database.new HOST, USER, PASSWORD, DATABASE, PORT
end
