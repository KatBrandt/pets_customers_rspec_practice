class Groomer
  attr_reader :name, :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(new_customer)
    @customers << new_customer
  end

  def customers_with_balances
    customers.select do |customer|
      customer.outstanding_balance > 0
    end
  end

  def find_all_pets_type(pet_type)
    all_pets = customers.map do |customer|
                customer.pets
              end.flatten

    all_pets.count do |pet|
      pet.type == pet_type
    end
  end
end
