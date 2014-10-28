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
url_weather = "https://api.forecast.io/forecast/187fcca57cfc9e4aea17eba531ee3407/37.8267,-122.423"
raw_data = open(url_weather).read
parsed_data = JSON.parse(raw_data)

the_temperature =
the_hour_outlook =
the_day_outlook =

# Ultimately, we want the following line to work when uncommented:

# puts "The current temperature at #{the_address} is #{the_temperature} degrees."
# puts "The outlook for the next hour is: #{the_hour_outlook}"
# puts "The outlook for the next day is: #{the_day_outlook}"
