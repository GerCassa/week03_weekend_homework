require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require ('pry-byebug')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({'name' => 'Bruce', 'funds' => 10})
customer1.save()
customer2 = Customer.new({'name' => 'John', 'funds' => 10})
customer2.save()
customer3 = Customer.new({'name' => 'Samuel', 'funds' => 10})
customer3.save()
customer4 = Customer.new({'name' => 'Uma', 'funds' => 10})
customer4.save()
customer5 = Customer.new({'name' => 'Quentin', 'funds' => 100})
customer5.save()


film1 = Film.new({'title' => 'Pulp Fiction', 'price' => 5})
film1.save()
film2 = Film.new({'title' => 'Back to the Future', 'price' => 6})
film2.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})
ticket3.save()


binding.pry
nil
