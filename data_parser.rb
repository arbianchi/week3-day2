require "json"



class DataParser

attr_reader :users, :path, :items, :data


  def initialize path
    @users = []
    @path = path
    @items = []
    @data = JSON.parse(File.read path)
  end


  def parse!

    @data["users"].each do |x|
      @users.push (User.new x["id"],x["name"],x["address"] )
    end

    @data["items"].each do |x|
      @items.push (Item.new x["id"],x["name"],x["category"], x["price"]   )
    end

  end

end
