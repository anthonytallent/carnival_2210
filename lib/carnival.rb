require 'pry'
require './lib/visitor'
require './lib/ride'

class Carnival
  attr_reader :duration, :rides

  def initialize
    @duration = '12 hours'
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    rides.max_by do |ride|
      ride.rider_log.values.sum
    end
  end

  def most_profitable_ride
    rides.max_by do |ride|
      ride.total_revenue
    end
  end

  def absolute_total_revenue
    rides.sum do |ride|
      ride.total_revenue
    end
  end
end