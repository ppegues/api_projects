require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
the_address = gets.chomp
url_safe_address = URI.encode(the_address)

# Your code goes below.
url_of_data_we_want ="http://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_address}&sensor=false"
raw_data1 = open(url_of_data_we_want).read
parsed_data1 = JSON.parsed(raw_data1)

the_latitude = parsed_data1["results"][0]["geometry"]["location"]["lat"]
the_longitude = parsed_data1["results"][0]["geometry"]["location"]["lng"]

url_weather = "https://api.forecast.io/forecast/187fcca57cfc9e4aea17eba531ee3407/#{the_latitude},#{the_longitude}"
raw_data2 = open(url_weather).read
parsed_data2 = JSON.parse(raw_data2)

#latitude = parsed_data["latitude"]
#longitude = parsed_data["longitude"]
currently = parsed_data2["currently"]
hourly = parsed_data2["hourly"]
daily = parsed_data2["daily"]


the_temperature = currently["temperature"]
the_hour_outlook = hourly["summary"][0]
the_day_outlook = daily["summary"][0]

# Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{the_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
