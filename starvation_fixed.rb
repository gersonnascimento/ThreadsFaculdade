require 'securerandom'

class Message
  def initialize name
    @name = name
    @times = 0
  end

  def name
    @name
  end

  def size
    @name.size
  end

  def add_time
    @times += 1
  end

  def times
    @times
  end

end

def random_message
  SecureRandom.base64.slice(0,4)
end



$messages = [
  Message.new('Olá'),
  Message.new('Você gostaria de conhecer nossas promoções? estamos com uma oferta imperdível!'),
  Message.new('Tudo bem?'),
  Message.new('Quer conhecer nossos produtos?'),
  Message.new('Sim'),
  Message.new('Não')
]

def order array
  array.sort_by{|i| (i.size - i.times)}
end

def add_random_message
    $messages << Message.new(random_message)
end

def show_queue
  add_random_message

  $messages = order $messages
  if $messages.any?
    puts 'FILA'
    $messages.each do |m|
      m.add_time
      puts m.name
    end
  end
end

def send_message message
  puts "Mensagem enviada: #{message}"
  puts '_________________________________________'
  $messages = $messages.delete_if{|msg| msg.name == message}
end

assync = Thread.new{
  while true
    sleep(1)
    $messages = order $messages
    show_queue
    send_message $messages.first.name
  end
}

assync.join
