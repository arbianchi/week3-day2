require 'httparty'
require 'pry'
require './token'


def get_data
  HTTParty.get(
    "https://shopnatra.herokuapp.com/data?password=hunter2",
  )
end

data = get_data
puts data
binding.pry
