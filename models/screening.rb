#new class will need CRUD will need time and film_id also may need tickets! starting tickets
# with zero tickets sold and maybe a capcity limit.
# don't forget to add it into sql as a table will need to drop before films
# if its using its ID. IF you get screening done can add snacks as new table/class
require_relative("../db/sql_runner")
require_relative("films")
require_relative("tickets")

class Screening

  attr_reader :id
  attr_accessor :times, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @times = options['times']
    @film_id = options['film_id']
    # @ticket_id = options['film_id']
  end


  def save()
    sql = "INSERT INTO screenings (times, film_id) VALUES ($1, $2) RETURNING id"
    values = [@times, @film_id]
    times = SqlRunner.run(sql, values)[0];
    @id = times['id'].to_i
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def Screening.select_all()
    sql = "SELECT * FROM screenings"
    times = SqlRunner.run(sql)
    return times.map{|time| Screening.new(time)}
  end

  def Screening.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE screenings SET (times, film_id) = ($1, $2) WHERE id = $3"
    values = [@times, @film_id, @id]
    SqlRunner.run(sql,values)
  end


  # write a function that shows the most popular time(most tickets sold) try use
  # tickets sold function from the customer class or sql.

  # def pop_time()
  #   sql = "SELECT * FROM tickets WHERE id = $1"
  #   values = [@id]
  #   pop_time = SqlRunner.run(sql, values)
  #   return pop_time.map{|movie|Screening.new(movie)}
  # end

end
