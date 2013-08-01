# the XOR game
- n players where n is a positive integer
- players should conceptually move simultaneously
- each player gets a bit of input; all n bits are XORed
- a player wins by correctly predicting the outcome of the XOR

# server
- first Ruby program, browser game I've ever written & deployed
- 40 line Sinatra app -- check out the code on github
- doesn't quite implement game correctly...
- vagrant and AWS are sweet but my current deployment kind of sucks

# let's play
- [it's running live on AWS, hosted here because I'm cheap and/or lazy](http://ec2-54-221-1-103.compute-1.amazonaws.com/)

- you can also play from the command line with curl:  
curl --data "input=1&bet=1" http://ec2-54-221-1-103.compute-1.amazonaws.com/

# a quick look at the code
[here](https://github.com/nabilhassein/xor-game/blob/master/server.rb)

# TODOs
- keep connections open and respond to all n players simultaneously  
- make the browser client pretty  
- optional persistent identity for matchmaking, records  
- chat so players can strategize and try to help or harm each other  
- better deployment and security; please break it and tell me what's what
- get a domain name

Come and commit!

# thanks for listening
github.com/nabilhassein/xor-game

email:   nabil.hassein@gmail.com  
twitter: @NabilHassein  
