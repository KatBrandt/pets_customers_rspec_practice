require 'rspec'
require './lib/groomer'
require './lib/pet'
require './lib/customer'

describe Groomer do
  before(:each) do
    @groomer = Groomer.new('Gerry')
  end

  describe '#initialize' do
    it 'creates a groomer' do
      expect(@groomer).to be_a Groomer
    end

    it 'has a name' do
      expect(@groomer.name).to eq 'Gerry'
    end

    it 'starts with an empty customers array' do
      expect(@groomer.customers).to eq []
    end
  end

  describe '#add_customer' do
    it 'can add customers' do
      bob = Customer.new("Bob", 1)
      jan = Customer.new("Jan", 2)

      samson = Pet.new({name: 'Samson', type: :dog, age: 3})
      penny = Pet.new({name: 'Penny', type: :cat, age: 13})
      aspen = Pet.new({name: 'Aspen', type: :dog, age: 7})
      autumn = Pet.new({name: 'Autumn', type: :ca, age: 5})

      bob.adopt(samson)
      bob.adopt(penny)

      jan.adopt(aspen)
      jan.adopt(autumn)

      @groomer.add_customer(bob)
      @groomer.add_customer(jan)

      expect(@groomer.customers).to eq [bob, jan]

      expect(bob.pets.count).to eq 2
      expect(jan.pets.count).to eq 2
    end
  end

  describe '#customers_with_balances' do
    it 'can find customers with outstanding balances' do
      bob = Customer.new("Bob", 1)
      jan = Customer.new("Jan", 2)

      @groomer.add_customer(bob)
      @groomer.add_customer(jan)

      bob.charge(15)

      expect(@groomer.customers_with_balances).to eq [bob]
    end
  end
end
