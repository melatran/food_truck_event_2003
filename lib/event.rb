class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck_name)
    @food_trucks << food_truck_name
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.check_stock(item) > 0
    # require "pry";binding.pry
    end
  end
  # 
  # def list_items
  #   inventories = @food_trucks.map {|food_truck| food_truck.inventory}
  #   item_names = inventories.flat_map {|inventory| inventory.keys}
  #   item_names.uniq
  # end

  def total_inventory
    total = {}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        total[item] = {quantity: 0, food_trucks:[]} if total[item].nil?
        total[item][:quantity] += quantity
        total[item][:food_trucks] << food_truck
      end
    end
    total
  end
end

# class Hash
#   def compact(opts={})
#     inject({}) do |new_hash, (k,v)|
#       if !v.nil?
#         new_hash[k] = opts[:recurse] && v.class == Hash ? v.compact(opts) : v
#       end
#       new_hash
#     end
#   end
# end
