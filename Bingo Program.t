/*Random Number Program AND Grid Game - Bingo
have clickbox parameters around each card, they move with the card - this allows you to shuffle for
    clickbox(i) with i as the value of the card.*/

%Bingo
setscreen("graphics:620,600")
type boxData:
record
    x:int
    y:int
    status:boolean
    value:int
end record
var box:array 1..4,1..4 of boxData
var fakenum:array 1..4,1..4 of int
var font:int
font:=Font.New("calibri:20")
proc BoxPlaces
    for i:1..4
        for j:1..4
            box (i,j).x:=200+j*50
            box (i,j).y:=400-(i-1)*50
            box (i,j).status:=false
        end for
    end for
end BoxPlaces
proc DrawBoxes
    BoxPlaces
    for i:1..4
        for j:1..4
            drawbox(box(i,j).x-25,box(i,j).y-25,box(i,j).x+25,box(i,j).y+25,black)
            drawdot(box(i,j).x,box(i,j).y,black)
        end for
    end for
end DrawBoxes
proc GenNumbers
    for k:1..10
        DrawBoxes
        for i:1..4
            for j:1..4
                randint(fakenum(i,j),1,75)
                if fakenum(i,j)>9 then
                    Font.Draw(intstr(fakenum(i,j)),box(i,j).x-17,box(i,j).y-10,font,black)
                else
                    Font.Draw(intstr(fakenum(i,j)),box(i,j).x-9,box(i,j).y-10,font,black)
                end if
            end for
        end for
            delay(100)
        cls
    end for
        DrawBoxes
    for h:1..4
        for l:1..4
            randint(box(h,l).value,1,75)
            if box(h,l).value>9 then
                Font.Draw(intstr(box(h,l).value),box(h,l).x-17,box(h,l).y-10,font,black)
            else
                Font.Draw(intstr(box(h,l).value),box(h,l).x-9,box(h,l).y-10,font,black)
            end if
        end for
    end for
end GenNumbers
DrawBoxes
GenNumbers
