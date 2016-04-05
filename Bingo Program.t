%Random Number Program AND Grid Game - Bingo

%Bingo
setscreen("graphics:750,600")
View.Set("offscreenonly")
type boxData:
record
    x:int
    y:int
    status:boolean
    value:int
end record
var box1,box2,box3:array 1..4,1..4 of boxData
var fakenum:array 1..4,1..4 of int
var font,x,y,z:int
font:=Font.New("calibri:20")
function ptinrect (h, v, x1, v1, x2, v2 : int) : boolean
    result (h > x1) and (h < x2) and (v > v1) and (v < v2)
end ptinrect
proc BoxPlaces
    for i:1..4
        for j:1..4
            box1 (i,j).x:=0+j*50
            box1 (i,j).y:=300-(i-1)*50
            box1(i,j).status:=false
            box2 (i,j).x:=250+j*50
            box2 (i,j).y:=300-(i-1)*50
            box2 (i,j).status:=false
            box3 (i,j).x:=500+j*50
            box3 (i,j).y:=300-(i-1)*50
            box3 (i,j).status:=false
        end for
    end for
end BoxPlaces

proc DrawBoxes
    BoxPlaces
    for i:1..4
        for j:1..4
            drawbox(box1(i,j).x-25,box1(i,j).y-25,box1(i,j).x+25,box1(i,j).y+25,black)
            drawbox(box2(i,j).x-25,box2(i,j).y-25,box2(i,j).x+25,box2(i,j).y+25,black)
            drawbox(box3(i,j).x-25,box3(i,j).y-25,box3(i,j).x+25,box3(i,j).y+25,black)
        end for
    end for
end DrawBoxes

proc GenNumbers
    for k:1..20
        DrawBoxes
        Pic.ScreenLoad("objects/bluebtn.bmp",65,330,picMerge)
        Pic.ScreenLoad("objects/redbtn.bmp",315,330,picMerge)
        Pic.ScreenLoad("objects/greenbtn.bmp",565,330,picMerge)
        for i:1..4
            for j:1..4
                randint(fakenum(i,j),1,75)
                if fakenum(i,j)>9 then
                    Font.Draw(intstr(fakenum(i,j)),box1(i,j).x-17,box1(i,j).y-10,font,black)
                    Font.Draw(intstr(fakenum(i,j)),box2(i,j).x-17,box2(i,j).y-10,font,black)
                    Font.Draw(intstr(fakenum(i,j)),box3(i,j).x-17,box3(i,j).y-10,font,black)
                else
                    Font.Draw(intstr(fakenum(i,j)),box1(i,j).x-9,box1(i,j).y-10,font,black)
                    Font.Draw(intstr(fakenum(i,j)),box2(i,j).x-9,box2(i,j).y-10,font,black)
                    Font.Draw(intstr(fakenum(i,j)),box3(i,j).x-9,box3(i,j).y-10,font,black)
                end if
            end for
        end for
            delay(100)
        View.Update
        cls
    end for
        DrawBoxes
    Pic.ScreenLoad("objects/bluebtn.bmp",65,330,picMerge)
    Pic.ScreenLoad("objects/redbtn.bmp",315,330,picMerge)
    Pic.ScreenLoad("objects/greenbtn.bmp",565,330,picMerge)
    for m:1..4
        for n:1..4
            randint(box1(m,n).value,1,75)
            if box1(m,n).value>9 then
                Font.Draw(intstr(box1(m,n).value),box1(m,n).x-17,box1(m,n).y-10,font,black)
            else
                Font.Draw(intstr(box1(m,n).value),box1(m,n).x-9,box1(m,n).y-10,font,black)
            end if
        end for
    end for
        for h:1..4
        for l:1..4
            randint(box2(h,l).value,1,75)
            if box2(h,l).value>9 then
                Font.Draw(intstr(box2(h,l).value),box2(h,l).x-17,box2(h,l).y-10,font,black)
            else
                Font.Draw(intstr(box2(h,l).value),box2(h,l).x-9,box2(h,l).y-10,font,black)
            end if
        end for
    end for
        for t:1..4
        for y:1..4
            randint(box3(t,y).value,1,75)
            if box3(t,y).value>9 then
                Font.Draw(intstr(box3(t,y).value),box3(t,y).x-17,box3(t,y).y-10,font,black)
            else
                Font.Draw(intstr(box3(t,y).value),box3(t,y).x-9,box3(t,y).y-10,font,black)
            end if
        end for
    end for
        drawbox(65,330,185,370,black)
    View.Update
end GenNumbers
proc CardOne
end CardOne
proc CardTwo
end CardTwo
proc CardThree
end CardThree
proc PickCard
    loop
        buttonwait("down",x,y,z,z)
        if ptinrect(x,y,65,330,185,370) then
            CardOne
        elsif ptinrect(x,y,315,330,435,370) then
            CardTwo
        elsif ptinrect(x,y,565,330,685,370) then
            CardThree
        else
        end if
    end loop
end PickCard
DrawBoxes
GenNumbers
PickCard
