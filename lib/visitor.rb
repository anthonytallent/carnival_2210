require 'pry'
class Visitor
  attr_reader :name, :height, :spending_money, :preferences

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete('$').to_i
    @preferences = []
  end

  def add_preference(type)
    @preferences << type
  end

  def tall_enough?(requirement)
    @height >= requirement
  end

end
