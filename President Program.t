/*Random Number Program - President
have clickbox parameters around each card, they move with the card - this allows you to shuffle for
clickbox(i) with i as the value of the card.*/
var cardspot:array 1..26 of 
record
x:int
y:int
end record
for i:1..26
cardspot(i).x:=1000
cardspot(i).y:=1000
end for
proc loadcards
for i:1..13
Pic.ScreenLoad("hearts/hearts"+intstr(i)+".bmp",cardspot(i).x,cardspot(i).y,picCopy)
delay (100)
end for
for j:1..13
Pic.ScreenLoad("spades/spades"+intstr(j)+".bmp",cardspot(j+13).x,cardspot(j+13).y,picCopy)
delay (100)
end for
end loadcards
Pic.ScreenLoad("hearts/hearts1.bmp",0,0,picCopy)
drawbox(0,0,82,126,yellow)
loadcards