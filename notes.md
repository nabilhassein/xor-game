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
- it's running live on AWS (see README on the github page for link)
- you can also play from the command line with curl

# TODOs
- keep connections open and respond to all n players simultaneously  
- make the browser client pretty  
- optional persistent identity for matchmaking, records  
- chat so players can strategize and try to help or harm each other  
- better deployment and security; please break it and tell me what's what

Come and commit!

# thanks for listening
email:   nabil.hassein@gmail.com  
twitter: @NabilHassein  
github:  nabilhassein/xor-game
