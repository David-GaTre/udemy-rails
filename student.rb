require_relative 'third_exercise_mixin'
 
class Student
  include Crud
  attr_accessor :first_name, :last_name, :email, :username, :password
 
  def initialize(firstname, lastname, username, email, password)
    @first_name = firstname
    @last_name = lastname
    @username = username
    @email = email
    @password = password
  end
 
  def to_s
    "First name: #{@first_name}, Last name: #{@last_name}, Username: #{@username},
                  email address: #{@email} don't ask why but hashed password: #{@password}"
  end
 
end
 
david = Student.new("David", "Garcia", "david1", "david@example.com",
                      "password1")
 
hashed_password = david.create_hash_digest(david.password)
 
puts hashed_password
david.password = hashed_password
puts david