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
    # return an array with all customers who have an outstanding balance
    customers.select do |customer|
      customer.outstanding_balance > 0
    end
  end
end
