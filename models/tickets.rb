require_relative("../db/sql_runner")


class Ticket

  attr_reader :id
  attr_accessor :customers_id, :films_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customers_id = options['customers_id']
    @films_id = options['films_id']
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id"
    values = [@customers_id, @films_id]
    ticket = SqlRunner.run(sql, values)[0];
    @id = ticket['id'].to_i
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def Ticket.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE tickets SET (customers_id, films_id) = ($1, $2) WHERE id = $3"
    values = [@customers_id, @films_id, @id]
    SqlRunner.run(sql, values)
  end

  def Ticket.select_all()
    sql = "SELECT * FROM tickets"
    ticket = SqlRunner.run(sql)
    return ticket.map{|tickets| Ticket.new(tickets)}
  end


end
