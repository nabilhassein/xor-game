The XOR Game
============
The XOR game is a game for n >= 1 players.
The n players (player 0 .. player n-1) conceptually move "at the same time".  
Each player chooses a bit of input, and a bit to bet on the outcome.
A player wins by choosing the same bit as the outcome of XORing all n bits;
a player loses by choosing the opposite bit.  
Let w be the number of winners, and let l be the number of losers.  
Then 0 <= w <= n, 0 <= l <= n, and w + l = n.  
That is, any combination of wins and losses among the n players is possible.

This Program
============
server
------
'server.rb' is the first Ruby program I have ever written and deployed.
It is a single-page Sinatra app which accepts 'get' and 'post' on '/'.  
A 'get' request receives as a response an HTML form with two text boxes labeled
'input' and 'bet'; submitting the form makes an HTTP POST request.  
If either 'input' or 'bet' is anything other than 0 or 1,
the server returns an error response to the client.  
If both 'input' and 'bet' are valid, then the server increments a counter,
checks if it is even or odd, and compares that to the client's 'bet'.  
It then responds to the client to tell it if it won or lost.  
The counter is reset to either 0 or 1, with equal probability, once per minute.

client
------
I have the app running live on AWS.  
You can play at this URL in your browser: http://ec2-54-221-1-103.compute-1.amazonaws.com/
Or like this at the command line: `curl --data "input=1&bet=1" http://ec2-54-221-1-103.compute-1.amazonaws.com/`

implementation details
----------------------
A player receives a response immediately; that is, their bit is XORed only with
the bits previously received.  
This does not conform to the description of the game above: it violates the
specification that all n players move simultaneously.  
It would be preferable to instead keep connections open until the interval
has elapsed, at which point all n players simultaneously receive a response.  

Nothing prevents the same person from playing in the same game repeatedly.
That's fine.

To make things a little more interesting, the counter starts at either 0 or 1
with 50% probability. Otherwise it is too easy to win when there is low traffic.  
(It is still not hard: the server's state is hidden from clients, but clients
receive a response immediately. So it is easy to win when you play repeatedly.)

What do I get for winning?
--------------------------
Not a damn thing.

security
========
I don't know much about security, but I want to learn.
So I encourage you to break my website and tell me how you did it,
so that I can fix it and learn not to do whatever I did wrong again.
My current deployment setup is a bit sorry; I could use advice here.

TODOs
=====
1. Implement some sort of keep-alive connection so that all n players who play
in the specified interval receive their responses simultaneously,
instead of on a rolling bases. This is my top priority.
2. Make the browser client pretty.
3. Optional matchmaking w/ win-loss records. This requires a notion of identity;
currently there is no option except to be anonymous.
If this feature is implemented, the choice to be anonymous must remain.
4. Chat so that players can strategize and try to help or harm each other.

Come and commit!
