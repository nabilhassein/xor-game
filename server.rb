require 'sinatra'

set :bind, '0.0.0.0'
set :port, 80

$nbits      = rand(0..1)
$start_time = Time.now.to_i
$interval   = 60

# reset the counter every $interval seconds
before do
  if Time.now.to_i - $start_time > $interval
    puts "resetting counter and clock\n" # server log
    $start_time = Time.now.to_i
    $nbits      = rand(0..1)
  end
end

get '/' do
  erb :play
end

post '/' do
  valid = [0, 1, "0", "1"]
  input = params["input"]
  bet   = params["bet"]
  if valid.member?(input) and valid.member?(bet)
    game(input.to_i, bet.to_i)
  else
    erb :error
  end
end

def game(input, bet)
  $nbits += input
  if $nbits % 2 == bet
    erb :gameover, :locals => {:verb => "won"}
  else
    erb :gameover, :locals => {:verb => "lost"}
  end
end
