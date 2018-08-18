require_relative("../db/sql_runner")

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
    sql = "UPDATE films
    SET ()"

  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, values)
    return self.map_items(films)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

end
