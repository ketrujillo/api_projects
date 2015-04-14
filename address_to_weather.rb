require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
street_address = gets.chomp
url_safe_street_address = URI.encode(street_address)

# Your code goes below.

# Ultimately, we want the following line to work when uncommented:

#google api
url_of_data_we_want = "http://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_street_address
raw_data = open(url_of_data_we_want).read
parsed_data = JSON.parse(raw_data)

the_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
the_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]
latitude = the_latitude.to_s
longitude = the_longitude.to_s

#forecast api
url_of_data_we_want2 = "https://api.forecast.io/forecast/7483895ad8ba7efbc30caaa950acb127/" + latitude +"," + longitude
raw_data2 = open(url_of_data_we_want2).read
parsed_data2 = JSON.parse(raw_data2)

the_temperature = parsed_data2["currently"]["temperature"]
the_hour_outlook = parsed_data2["minutely"]["summary"]
the_day_outlook = parsed_data2["hourly"]["summary"]




puts "The current temperature at #{street_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
