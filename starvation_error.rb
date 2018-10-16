require 'securerandom'

def random_message
  SecureRandom.base64.slice(0,4)
end

$messages = [
  'Olá',
  'Você gostaria de conhecer nossas promoções? estamos com uma oferta imperdível!',
  'Tudo bem?',
  'Quer conhecer nossos produtos?',
  'Sim',
  'Não'
]

def order array
  array.sort_by{|i| i.size}
end

def add_random_message
    $messages << random_message
end

def show_queue
  add_random_message

  $messages = order $messages
  if $messages.any?
    puts 'FILA'
    $messages.each do |m|
      puts m
    end
  end
end

def send_message message
  puts "Mensagem enviada: #{message}"
  puts '_________________________________________'
  $messages = $messages.delete_if{|msg| msg == message}
end

assync = Thread.new{
  while true
    sleep(4)
    $messages = order $messages
    show_queue
    send_message $messages.first
  end
}

assync.join
