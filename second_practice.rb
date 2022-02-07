dial_book = {
  "newyork" => "212",
  "newbrunswick" => "732",
  "edison" => "908",
  "plainsboro" => "609",
  "sanfrancisco" => "301",
  "miami" => "305",
  "paloalto" => "650",
  "evanston" => "847",
  "orlando" => "407",
  "lancaster" => "717"
}
 
# Get city names from the hash
def get_city_names(book)
  book.select { |k, v| puts k}
end
 
# Get area code based on given hash and key
def get_area_code(book, city)
  book.each do |key, value|
    if city == key
      return  "The #{key} code is #{book[city]}"
    end
  end
  return "City not found or with no code"
end
 
# Execution flow
puts "CODE FINDER"
25.times {print '-'}
puts
while true
  # Write your program execution code here
  puts "This are the city names"
  get_city_names(dial_book)
  print "Please select a city: "
  city = gets.chomp.downcase
  area_code = get_area_code(dial_book, city)
  puts area_code
  puts "To exit type 'n' otherwise press any other key and then enter"
  input = gets.chomp.downcase
  break if input == 'n'

end
