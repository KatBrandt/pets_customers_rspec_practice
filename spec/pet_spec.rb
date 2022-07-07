require 'rspec'
require './lib/pet'

describe Pet do
  before(:each) do
    @pet = Pet.new({name: 'Samson', type: :dog, age: 3})
  end

  describe '#initialize' do
    it 'creates an instance of Pet' do
      expect(@pet).to be_a Pet
    end

    it 'has a name, type, and age' do
      expect(@pet.name).to eq 'Samson'
      expect(@pet.type).to eq :dog
      expect(@pet.age). to eq 3
    end
  end

  describe '#fed?' do
    it 'tells if dog has been fed' do
      expect(@pet.fed?).to be false

      @pet.feed

      expect(@pet.fed?).to be true
    end
  end
end
