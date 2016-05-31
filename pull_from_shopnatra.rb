require 'httparty'
require 'pry'



def get_data
  HTTParty.get(
    "https://shopnatra.herokuapp.com/data?password=hunter2",
  )
end

data = get_data

File.open("data2.json", 'w') { |file| file.write(get_data.to_json) }

def get_transactions
  HTTParty.get(
    "https://shopnatra.herokuapp.com/transactions/2016-09-01?password=hunter2",
  )
end

transactions = get_transactions

File.open("transactions2.json", 'w') { |file| file.write(get_transactions.to_json) }
