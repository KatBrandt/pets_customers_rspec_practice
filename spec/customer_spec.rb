require 'rspec'
require './lib/customer'
require './lib/pet'

describe Customer do
  before(:each) do
    @customer = Customer.new("Joel", 2)
  end

  describe '#initialize' do
    it 'creates an instance of Customer' do
      expect(@customer).to be_a Customer
    end

    it 'creates a name and id' do
      expect(@customer.name).to eq 'Joel'
      expect(@customer.id).to eq 2
    end

    it 'should start with an empty pet array' do
      expect(@customer.pets).to eq []
    end
  end

  describe '#adopt' do
    it 'can add pets' do
      samson = Pet.new({name: 'Samson', type: :dog, age: 3})
      lucy = Pet.new({name: 'Lucy', type: :cat, age: 12})
      @customer.adopt(samson)
      @customer.adopt(lucy)

      expect(@customer.pets).to eq [samson, lucy]
    end
  end

  describe '#outstanding_balance' do
    it 'starts balance at zero' do
      expect(@customer.outstanding_balance).to eq 0
    end

    it 'can #charge and add balances' do
      @customer.charge(15)
      expect(@customer.outstanding_balance).to eq 15

      @customer.charge(7)
      expect(@customer.outstanding_balance).to eq 22
    end
  end


end
