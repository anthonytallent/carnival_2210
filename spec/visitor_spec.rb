require 'pry'
require './lib/visitor'

RSpec.describe 'Visitor class' do
  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  it 'exists' do 

    expect(@visitor1.name).to eq('Bruce')
    expect(@visitor1.height).to eq(54)
    expect(@visitor1.spending_money).to eq(10)
    expect(@visitor1.preferences).to eq([])
  end

  describe '#add_preference()' do
    it 'will add a preference symbol to the preferences attribute' do

      expect(@visitor1.preferences).to eq([])

      @visitor1.add_preference(:gentle)
      @visitor1.add_preference(:water)

      expect(@visitor1.preferences).to eq([:gentle, :water])
    end
  end

  describe '#tall_enough?' do
    it 'returns true if the visitor is tall enough to ride the ride' do

      expect(@visitor1.tall_enough?(54)).to eq(true)
      expect(@visitor3.tall_enough?(54)).to eq(true)
    end

    it 'returns false if the visitor is not tall enough to rigde the ride' do

      expect(@visitor2.tall_enough?(54)).to eq(false)
      expect(@visitor1.tall_enough?(64)).to eq(false)
    end
  end
end