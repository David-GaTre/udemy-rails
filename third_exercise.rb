# PART 1: USING BCRYPT
require 'bcrypt'
 
my_password = BCrypt::Password.create("my password")
 
puts my_password

puts my_password == "my password"     #=> true
my_password == "not my password" #=> false
 
my_password = BCrypt::Password.new("$2a$12$TZzUfLSUK0pzgxQASO3V0uphuQHI8oGG3UylUh.bayEGckO3UeRLG")
puts my_password == "my password"     #=> true
puts my_password == "not my password" #=> false


# PART 2: STARTING TO CREATE FUNCTIONS AND USING THE BCRYPT GEM
# require 'bundler/inline'
 
# gemfile true do
#  source 'http://rubygems.org'
#  gem 'bcrypt'
# end
module Crud
  require 'bcrypt'
  puts "Module CRUD activated"
 
  def self.create_hash_digest(password)
    BCrypt::Password.create(password)
  end
  
  def self.verify_hash_digest(password)
    BCrypt::Password.new(password)
  end
  
  def self.create_secure_users(list_of_users)
    list_of_users.each do |user_record|
      user_record[:password] = create_hash_digest(user_record[:password])
    end
    list_of_users
  end

  # PART 3: AUTHENTICATE AND CREATING THE MODULE
  def self.authenticate_user(username, password, list_of_users)
    list_of_users.each do |user_record|
      if user_record[:username] == username && verify_hash_digest(user_record[:password]) == password
        return user_record
      end
    end
    "Credentials were not correct"
  end
end