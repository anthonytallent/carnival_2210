require 'pry'
require './lib/visitor'

class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue, :rider_log

  def initialize(attributes)
    @name = attributes[:name]
    @min_height = attributes[:min_height]
    @admission_fee = attributes[:admission_fee]
    @excitement = attributes[:excitement]
    @total_revenue = 0
    @rider_log = {}
  end

  def boarding_preferences(visitor)
    visitor.preferences.find do |preference|
      preference == @excitement
    end
  end

  def board_rider(visitor) #refactor if time allows
    if boarding_preferences(visitor) == nil || visitor.tall_enough?(min_height) == false
      return
    else
      if @rider_log[visitor] == nil
        @rider_log[visitor] = 1
      else
        @rider_log[visitor] += 1
      end
      x = visitor.spending_money
      x -= @admission_fee
      visitor.spending_money = x
      @total_revenue += @admission_fee
    end
  end

end
