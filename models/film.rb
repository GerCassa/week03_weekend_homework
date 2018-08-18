require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @title = info['title']
    @price = info['price']
  end

  def save()
    sql = "INSERT INTO films(title, price)
      VALUES ($1,$2)
      RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def delete()
    sql = "DELETE FROM films
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values).first
  end

  def update()
    sql = "UPDATE films
    SET (title, price)
    = ($1, $2)
    WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
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
