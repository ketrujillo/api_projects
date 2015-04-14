require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your location."

puts "What is the latitude?"
the_latitude = gets.chomp

puts "What is the longitude?"
the_longitude = gets.chomp

# Your code goes below. Use the same approach as you did in
#   address_to_coords.rb to read from a remote API and parse
#   the results.

# Ultimately, we want the following line to work when uncommented:

url_of_data_we_want2 = "https://api.forecast.io/forecast/7483895ad8ba7efbc30caaa950acb127/" + the_latitude +"," + the_longitude
raw_data2 = open(url_of_data_we_want2).read
parsed_data2 = JSON.parse(raw_data2)


the_temperature = parsed_data2["currently"]["temperature"]
the_hour_outlook = parsed_data2["minutely"]["summary"]
the_day_outlook = parsed_data2["hourly"]["summary"]


puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"

