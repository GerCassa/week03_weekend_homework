require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require ('pry-byebug')

customer1 = Customer.new({'name' => 'Bruce', 'funds' => 10})
customer1.save()
customer2 = Customer.new({'name' => 'John', 'funds' => 10})
customer3 = Customer.new({'name' => 'Samuel', 'funds' => 10})
customer4 = Customer.new({'name' => 'Uma', 'funds' => 10})
customer5 = Customer.new({'name' => 'Quentin', 'funds' => 100})


film1 = Film.new({'title' => 'Pulp Fiction', 'price' => 5})
film1.save()


binding.pry
nil
