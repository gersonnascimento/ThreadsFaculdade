class Person
  def initialize(name, side, status)
    @name = name
    @side = side
    @status = status
  end

  def name
    @name
  end

  def side
    @side
  end

  def change_status status
    @status = status
  end

  def status
    @status
  end

  def change_side
    if @side=='left'
      @side='right'
    else
      @side='left'
    end
  end
end

def pass(p1, p2)
  if p1.side != p2.side
    p1.change_status 'has gone'
    p2.change_status 'has gone'
  else
    p1.change_side
    p2.change_side
  end
  puts '___________________________________________'
  puts "Status #{p1.name}:#{p1.status}"
  puts "Status #{p2.name}:#{p2.status}"
  puts "Side #{p1.name}:#{p1.side}"
  puts "Side #{p2.name}:#{p2.side}"
  puts '___________________________________________'
end

p1 = Person.new('João', 'left', 'going')
p2 = Person.new('José', 'left', 'coming')


t = Thread.new{
  while p1.status != 'has gone' || p2.status != 'has gone'
    sleep(2)
    pass(p1,p2)
  end
 }

 t.join
