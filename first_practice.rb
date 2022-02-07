users = [
          { username: 'davidg', password: 'holis' },
          { username: 'bruh', password: 'bruh1'}
        ]

puts "Welcome to the authenticator"
25.times {print "-"}
puts
puts "bla bla bla"
puts

def auth(username, password, users)
  users.each do |user|
    if user[:username] == username && user[:password] == password
      return user
    end
  end
  "Credentials not correct"
end

cont = 0
tries = 3
while cont < tries 
  print "Username: "
  name = gets.chomp
  print "Password: "
  passw = gets.chomp
  authenticator = auth(name, passw, users)
  puts authenticator
  puts "Press n to quit or any other key to continue"
  input = gets.chomp.downcase
  
  break if input == "n"
  cont += 1 if authenticator == "Credentials not correct"
end