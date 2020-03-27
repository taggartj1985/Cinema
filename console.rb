require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')


require('pry')
Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


customer1 = Customer.new({'name' => 'Freddy', 'funds' => 100})
customer1.save
customer2 = Customer.new({'name' => 'Jason', 'funds' => 20})
customer2.save
customer3 = Customer.new({'name' => 'Mike', 'funds' => 60})
customer3.save
customer4 = Customer.new({'name' => 'Leatherface', 'funds' => 40})
customer4.save

customer4.name = 'Chucky'
customer4.update()
Customer.order_customers_by_name()

film1 = Film.new({'title' => 'Halloween', 'price' => 4})
film1.save
film2 = Film.new({'title' => 'Jaws', 'price' => 5})
film2.save
film3 = Film.new({'title' => 'The Ring', 'price' => 3})
film3.save

film2.title = 'Childs Play'
film2.update()

ticket1 = Ticket.new({'customers_id' => '4', 'films_id' => '2'})
ticket1.save()

customer4.buy_ticket(film2)
customer4.update()


Film.select_all()
Customer.select_all()
Ticket.select_all()






binding.pry
nil
