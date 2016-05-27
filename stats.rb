require 'JSON'
require "./item"
require "./user"
require "./data_parser"
require "./transaction_parser"
require "./transaction"
require 'pry'


def file_path file_name
  File.expand_path "../data/#{file_name}.json", __FILE__
end

t = TransactionParser.new file_path("transactions")
d = DataParser.new file_path("data")

d.parse!
t.parse!

transaction_by_user = {}
transaction_by_user.default = 0

(t.transactions).each do |x|

  transaction_by_user[x.user_id] += 1
end

bigbuyer = transaction_by_user.select {|k,v| v == transaction_by_user.values.max }

buyername = nil

(d.users).each do |x|
  if x.id == 16
  buyername = x.name
  end
end

puts "The user that made the most orders was #{buyername}."

binding.pry
