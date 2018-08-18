require_relative("../db/sql_runner")
require_relative('./film')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @name = info['name']
    @funds = info['funds']
  end

  def save()
    sql = "INSERT INTO customers(name, funds)
      VALUES ($1,$2)
      RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def delete()
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values).first
  end

  def update()
    sql = "UPDATE customers
    SET (name, funds)
    = ($1, $2)
    WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  # def films_booked()
  #   sql = "SELECT films.title FROM customers
  #   INNER JOIN tickets
  #   ON tickets.customer_id = customers.id
  #   INNER JOIN films
  #   ON tickets.film_id = films.id
  #   WHERE customer_id = $1"
  #   values = [@id]
  #   SqlRunner.run(sql, values)
  #   Film.map_items(films)
  # end

    def films_booked()
    sql = "SELECT films.*, tickets.*
    FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    WHERE customer_id = $1"
    values = [@id]
    film_booked = SqlRunner.run(sql, values)
    return Film.map_items(film_booked)
  end

  def self.map_items(customer_data)
    result = customer_data.map { |customer| Customer.new(customer)}
    return result
  end

  def Customer.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    return Customer.map_items(customers)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end

end
