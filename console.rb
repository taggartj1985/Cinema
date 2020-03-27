require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')


require('pry')

Customer.delete_all()


customer1 = Customer.new({'name' => 'Freddy', 'funds' => 100})
customer1.save
customer2 = Customer.new({'name' => 'Jason', 'funds' => 20})
customer2.save
customer3 = Customer.new({'name' => 'Mike', 'funds' => 60})
customer3.save
customer4 = Customer.new({'name' => 'Chucky', 'funds' => 40})
customer4.save

customer4.name = 'Leatherface'
customer4.update()
Customer.order_customers_by_name()








binding.pry
nil
