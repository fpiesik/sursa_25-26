pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
----variables draw update-----------


function _init()
 walk=0
 tf=true
 win=false
 a=false
 cd=0
 check=0
 hide1=false
 hide2=false
 hide3=false
 hide4=false
 player=7
 tx=6
 ty=12
 teacher=76
 b=0
 px=107
 py=80
 f=false
 titel=true
 titlex=32
 titley=0
 t=0
 ti=0
 intro_time=0
 animation=false
 move=false
 s=0
 tim=17
 closet1=68
 closet2=131
 closet3=135
 closet4=139
 priny=false
 boom=false
 hide=0
 f=true
 safe=false
 
 hide5=false
 hide6=false
 hide7=false
 hide8=false
 table1=1
 table2=192
 table3=196
 table4=200
 
 win=false
 lose=false
 
 wins=0
 rt=0
 k=60
 l=60
end


function _draw()
 ss_menu()
	cls()
	map(titelx,titely)
	if animation==true or move==true then spr(table1,0,45,4,4) end
	if animation==true or move==true then spr(table2,32,45,4,4) end
	if animation==true or move==true then spr(table3,64,45,4,4) end
	if animation==true or move==true then spr(table4,0,75,4,4) end
 if animation==true or move==true then spr(closet1,0,0,4,4) end
	if animation==true or move==true then spr(closet2,32,0,4,4) end
	if animation==true or move==true then spr(closet3,64,0,4,4) end
	if animation==true or move==true then spr(closet4,96,0,4,4) end
 if priny==1 then print("press x to hide",px,py-8,7) end
 if titel==true then print("press c to start game",7) end
 if titel==true then print("once the game starts you have ",7) end
 if titel==true then print("5 seconds to hide",7) end
 if titel==true then print("after a small animation",7) end
 if titel==true then print("walking: e=up s=left d=down f=",12) end
 if titel==true then print("right",12) end
	if move==true then print("the teacher is comming hide quick",0,0,7) end
 if move==true then print("you have   seconds left",0,6,7) end
 if move==true then print(""..tim,34,6,7) end
	spr(player,px,py,2,2,f)
	if tim==0 then
	spr(teacher,tx,ty,2,4,tf) end
	if win==true then spr(37,k,l,2,2) end
	
end

function _update()
_c1()
_c2()
_c3()
_c4()
_d1()
_d2()
_d3()
_d4()
_normal()
_hide()
_ch()
_tm()

if btn(🅾️) then search = flr(rnd(9)) end
if cd>0 then cd-=1 end
if cd<0 then cd=0 end

if hide1==true then ti+=100 end
if hide2==true then ti+=100 end
if hide3==true then ti+=100 end
if hide4==true then ti+=100 end
if hide5==true then ti+=100 end
if hide6==true then ti+=100 end
if hide7==true then ti+=100 end
if hide8==true then ti+=100 end




if hide1==true or hide2==true or hide3==true or hide4==true or hide5==true or hide6==true or hide7==true or hide8==true then hide+=1 end
if hide1==false and hide2==false and hide3==false and hide4==false and hide5==false and hide6==false and hide7==false and hide8==false then hide=0 end

if hide5==true and hide>60 and btn(❎) then table1=1 px=8 py=21 end

if hide6==true and hide>60 and btn(❎) then table2=192 px=39 py=76 end

if hide7==true and hide>60 and btn(❎) then table3=196 px=71 py=76 end

if hide8==true and hide>60 and btn(❎) then table4=200 px=30 py=85 end

if hide1==true and hide>60 and btn(❎) then closet1=68 px=8 py=21 end

if hide2==true and hide>60 and btn(❎) then closet2=131 px=39 py=21 end

if hide3==true and hide>60 and btn(❎) then closet3=135 px=71 py=21 end

if hide4==true and hide>60 and btn(❎) then closet4=139 px=105 py=21 end

if closet1==64 then hide1=true end
if closet2==64 then hide2=true end
if closet3==64 then hide3=true end
if closet4==64 then hide4=true end

if closet1==68 then hide1=false end
if closet2==131 then hide2=false end
if closet3==135 then hide3=false end
if closet4==139 then hide4=false end





if closet1==64 then px=10000000 end
if closet2==64 then px=10000000 end
if closet3==64 then px=10000000 end
if closet4==64 then px=10000000 end


if table1==204 then px=10000000 end
if table2==204 then px=10000000 end
if table3==204 then px=10000000 end
if table4==204 then px=10000000 end
if table1==204 then hide5=true  end
if table2==204 then hide6=true  end
if table3==204 then hide7=true  end
if table4==204 then hide8=true  end
if table1==1 then hide5=false  end
if table2==192 then hide6=false  end
if table3==196 then hide7=false  end
if table4==200 then hide8=false  end

if ti==30 then tim=17 end
if ti==60 then tim=16 end
if ti==90 then tim=15 end
if ti==120 then tim=14 end
if ti==180 then tim=13 end
if ti==210 then tim=12 end
if ti==240 then tim=11 end
if ti==270 then tim=10 end
if ti==300 then tim=9 end
if ti==330 then tim=8 end
if ti==360 then tim=7 end
if ti==390 then tim=6 end
if ti==420 then tim=5 end
if ti==450 then tim=4 end
if ti==480 then tim=3 end
if ti==510 then tim=2 end
if ti==540 then tim=1 end
if ti>570 then tim=0 a=true end
if move==true then ti+=1 end
if move==true then animation=false end
if intro_time>70 then move=true end
if btn(🅾️) and titel==false then animation=true end
if btn(🅾️) then titel=false end
if titel==true then titelx=32 player=78 end
if titel==false then titelx=0 player=7 end
if t>30 then t=0 end

if animation==true then intro_time+=1 player=129 end
if move==true then s+=1 end

 if not move==false then
	if btn(➡️,1) then t+=1 end
	if btn(➡️,1) and t==0 then player=7 end
	if btn(➡️,1) and t>0 and t<10 then f=false player=9 end
	if btn(➡️,1) and t>10 and t<20 then f=false player=11 end
 if btn(➡️,1) and t>20 and t<30 then f=false player=13 end
 if btn(➡️,1) then px+=0.8 end

	if btn(⬅️,1) then t+=1 end
	if btn(⬅️,1) and t==0 then player=7 end
	if btn(⬅️,1) and t>0 and t<10 then  f=true player=9 end
	if btn(⬅️,1) and t>10 and t<20 then f=true player=11  end
 if btn(⬅️,1) and t>20 and t<30 then f=true player=13  end
 if btn(⬅️,1) then px-=0.8 end
 
 if btn(⬆️,1) then t+=1 end
	if btn(⬆️,1) and t==0 then player=7 end
	if btn(⬆️,1) and t>0 and t<10 then player=9 end
	if btn(⬆️,1) and t>10 and t<20 then player=11  end
 if btn(⬆️,1) and t>20 and t<30 then player=13  end
 if btn(⬆️,1) then py-=0.8 end
 
 if btn(⬇️,1) then t+=1 end
	if btn(⬇️,1) and t==0 then player=7 end
	if btn(⬇️,1) and t>0 and t<10 then player=9 end
	if btn(⬇️,1) and t>10 and t<20 then player=11  end
 if btn(⬇️,1) and t>20 and t<30 then player=13  end
 if btn(⬇️,1) then py+=0.8 end
 end
end

-->8
---------closets+desks-------------
function _c1()

for i=-2,27 do
for e=-3,19 do
if flr(px)==e and flr(py)==i and btnp(❎) then closet1=64 end
  end
 end
end



function _c2()

for i=-2,27 do
for e=28,52 do
if flr(px)==e and flr(py)==i and btnp(❎) then closet2=64 end
  end
 end
end


function _c3()

for i=-2,27 do
for e=60,84 do
if flr(px)==e and flr(py)==i and btnp(❎) then closet3=64 end
  end
 end
end



function _c4()

for i=-2,27 do
for e=90,114 do
if flr(px)==e and flr(py)==i and btnp(❎) then closet4=64 end
  end
 end
end

function _d1()

for i=32,75 do
for e=-3,19 do
if flr(px)==e and flr(py)==i and btnp(❎) then table1=204 end
  end
 end
end



function _d2()

for i=32,75 do
for e=28,52 do
if flr(px)==e and flr(py)==i and btnp(❎) then table2=204 end
  end
 end
end


function _d3()

for i=32,75 do
for e=60,84 do
if flr(px)==e and flr(py)==i and btnp(❎) then table3=204 end
  end
 end
end



function _d4()

for i=68,95 do
for e=-2,23 do
if flr(px)==e and flr(py)==i and btnp(❎) then table4=204 end
  end
 end
end
-->8
-------------hide---------------

function _hide()
	if tim==0 and search==1 and hide1==true  and cd==0 then cd=300 wins=1 end
	if tim==0 and  search==1 and hide1==true and wins==1 and cd==0 then cd=300 wins=2 end
	if tim==0 and  search==1 and hide1==true and wins==2 and cd==0 then cd=300 wins=3 end
	if tim==0 and  search==1 and hide1==true and wins==31 and cd==0 then cd=300 wins=4 end
	if tim==0 and  search==1 and hide1==true and wins==41 and cd==0 then cd=300 wins=5 end
	if tim==0 and  search==1 and hide1==true and wins==51 and cd==0 then cd=300 wins=6 end
	if tim==0 and  search==1 and hide1==true and wins==61 and cd==0 then cd=300 wins=7 end
	if tim==0 and  search==1 and hide1==true and wins==71 and cd==0 then cd=300 wins=8 end
	if tim==0 and  search==1 and hide1==true and wins==81 and cd==0 then cd=300 wins=9 end
	if tim==0 and  search==1 and hide1==true and wins==91 and cd==0 then cd=300 wins=10 end
	
	if tim==0 and  search==2 and hide2==true  then wins=1 end
	if tim==0 and  search==2 and hide2==true and wins==1 and cd==0 then cd=300 wins=2 end
	if tim==0 and  search==2 and hide2==true and wins==2 and cd==0 then cd=300 wins=3 end
	if tim==0 and  search==2 and hide2==true and wins==3 and cd==0 then cd=300 wins=4 end
	if tim==0 and  search==2 and hide2==true and wins==4 and cd==0 then cd=300 wins=5 end
	if tim==0 and  search==2 and hide2==true and wins==5 and cd==0 then cd=300 wins=6 end
	if tim==0 and  search==2 and hide2==true and wins==6 and cd==0 then cd=300 wins=7 end
	if tim==0 and  search==2 and hide2==true and wins==7 and cd==0 then cd=300 wins=8 end
	if tim==0 and  search==2 and hide2==true and wins==8 and cd==0 then cd=300 wins=9 end
	if tim==0 and  search==2 and hide2==true and wins==9 and cd==0 then cd=300 wins=10 end
	
	if tim==0 and search==3 and hide3==true  then wins=1 end
	if tim==0 and  search==3 and hide3==true and wins==1 then wins=2 end
	if tim==0 and  search==3 and hide3==true and wins==2 then wins=3 end
	if tim==0 and  search==3 and hide3==true and wins==3 then wins=4 end
	if tim==0 and  search==3 and hide3==true and wins==4 then wins=5 end
	if tim==0 and  search==3 and hide3==true and wins==5 then wins=6 end
	if tim==0 and  search==2 and hide3==true and wins==6 then wins=7 end
	if tim==0 and  search==3 and hide3==true and wins==7 then wins=8 end
	if tim==0 and  search==3 and hide3==true and wins==8 then wins=9 end
	if tim==0 and  search==3 and hide3==true and wins==9 then wins=10 end
	
	if tim==0 and  search==4 and hide4==true  then wins=1 end
	if tim==0 and  search==4 and hide4==true and wins==1 then wins=2 end
	if tim==0 and  search==4 and hide4==true and wins==2 then wins=3 end
	if tim==0 and  search==4 and hide4==true and wins==3 then wins=4 end
	if tim==0 and  search==4 and hide4==true and wins==4 then wins=5 end
	if tim==0 and  search==4 and hide4==true and wins==5 then wins=6 end
	if tim==0 and  search==4 and hide4==true and wins==6 then wins=7 end
	if tim==0 and  search==4 and hide4==true and wins==7 then wins=8 end
	if tim==0 and  search==4 and hide4==true and wins==8 then wins=9 end
	if tim==0 and  search==4 and hide4==true and wins==9 then wins=10 end
	
	if tim==0 and  search==5 and hide5==true  then wins=1 end
	if tim==0 and  search==5 and hide5==true and wins==1 then wins=2 end
	if tim==0 and  search==5 and hide5==true and wins==2 then wins=3 end
	if tim==0 and  search==5 and hide5==true and wins==3 then wins=4 end
	if tim==0 and  search==5 and hide5==true and wins==4 then wins=5 end
	if tim==0 and  search==5 and hide5==true and wins==5 then wins=6 end
	if tim==0 and  search==5 and hide5==true and wins==6 then wins=7 end
	if tim==0 and  search==5 and hide5==true and wins==7 then wins=8 end
	if tim==0 and  search==5 and hide5==true and wins==8 then wins=9 end
	if tim==0 and  search==5 and hide5==true and wins==9 then wins=10 end
	
	if tim==0 and  search==6 and hide6==true  then wins=1 end
	if tim==0 and  search==6 and hide6==true and wins==1 then wins=2 end
	if tim==0 and  search==6 and hide6==true and wins==2 then wins=3 end
	if tim==0 and  search==6 and hide6==true and wins==3 then wins=4 end
	if tim==0 and  search==6 and hide6==true and wins==4 then wins=5 end
	if tim==0 and  search==6 and hide6==true and wins==5 then wins=6 end
	if tim==0 and  search==6 and hide6==true and wins==6 then wins=7 end
	if tim==0 and  search==6 and hide6==true and wins==7 then wins=8 end 
	if tim==0 and  search==6 and hide6==true and wins==8 then wins=9 end 
	if tim==0 and  search==6 and hide6==true and wins==9 then wins=10
 
 if tim==0 and  search==7 and hide7==true  then wins=1 end
	if tim==0 and  search==7 and hide7==true and wins==1 then wins=2 end
	if tim==0 and  search==7 and hide7==true and wins==2 then wins=3 end
	if tim==0 and  search==7 and hide7==true and wins==3 then wins=4 end
	if tim==0 and  search==7 and hide7==true and wins==4 then wins=5 end
	if tim==0 and  search==7 and hide7==true and wins==5 then wins=6 end
	if tim==0 and  search==7 and hide7==true and wins==6 then wins=7 end
	if tim==0 and  search==7 and hide7==true and wins==7 then wins=8 end
	if tim==0 and  search==7 and hide7==true and wins==8 then wins=9 end
	if tim==0 and  search==7 and hide7==true and wins==9 then wins=10 end
	
	if tim==0 and  search==8 and hide8==true  then wins=1 end
	if tim==0 and  search==8 and hide8==true and wins==1 then wins=2 end
	if tim==0 and  search==8 and hide8==true and wins==2 then wins=3 end
	if tim==0 and  search==8 and hide8==true and wins==3 then wins=4 end
	if tim==0 and  search==8 and hide8==true and wins==4 then wins=5 end
	if tim==0 and  search==8 and hide8==true and wins==5 then wins=6 end
	if tim==0 and  search==8 and hide8==true and wins==6 then wins=7 end
	if tim==0 and  search==8 and hide8==true and wins==7 then wins=8 end
	if tim==0 and  search==8 and hide8==true and wins==8 then wins=9 end
	if tim==0 and  search==8 and hide8==true and wins==9 then wins=10 end
 end	
end
-->8
------------sounds-----------------
function _normal()
if btn(➡️,1) or btn(⬅️,1) or btn(⬆️,1) or btn(⬇️,1) then walk+=0.5 end
if walk>=5.5 then walk=0 sfx(0) end
end





-->8
----------teacher search---------

function _ch()
if btn(➡️,1) then check=flr(rnd(8)+1) end
if btn(⬅️,1) then check=flr(rnd(8)+1) end
if btn(⬆️,1) then check=flr(rnd(8)+1) end
if btn(⬇️,1) then check=flr(rnd(8)+1) end
end

if tim==0 and hide1==true and check==1 then safe=true end
if tim==0 and hide2==true and check==2 then safe=true end
if tim==0 and hide3==true and check==3 then safe=true end
if tim==0 and hide4==true and check==4 then safe=true end
if tim==0 and hide5==true and check==5 then safe=true end
if tim==0 and hide6==true and check==6 then safe=true end
if tim==0 and hide7==true and check==7 then safe=true end
if tim==0 and hide8==true and check==8 then safe=true end

-->8
--------teacher_movement--------

function _tm()
 if tx==100 then tx=99 a=false b=true end
	if a==true then tx+=0.5 end
	if b==true then ty+=0.5 end
	if b==false then ty+=0 end
	if ty>70 then b=false end
	if ty==72.5 then tx+=1 tf=false end
	
	if ty==72.5 and hide1==true and check==1 then win=true end
	if ty==72.5 and hide2==true and check==2 then win=true end
	if ty==72.5 and hide3==true and check==3 then win=true end
	if ty==72.5 and hide4==true and check==4 then win=true end
	if ty==72.5 and hide5==true and check==5 then win=true end
	if ty==72.5 and hide6==true and check==6 then win=true end
	if ty==72.5 and hide7==true and check==7 then win=true end 	
	if ty==72.5 and hide8==true and check==8 then win=true end
end
-->8
-- multi-cart helper
ss_done=false
function ss_finish(r)
 if ss_done then return end
 ss_done=true
 cartdata("surviving_sandwehen")
 dset(3,r)
 load("surviving_sandwehen.p8")
end

function ss_menu()
 if (btn(4) and btnp(5))
 or (btn(5) and btnp(4)) then
  cartdata("surviving_sandwehen")
  dset(3,0)
  load("surviving_sandwehen.p8")
 end
 ss_check_finish()
end

function ss_check_finish()
 if won==1 or win==1 or win==true then ss_finish(1) end
 if gameover==true then
  if time_left~=nil and time_left<=0 then ss_finish(1)
  else ss_finish(2) end
 end
 if coll~=nil and coll>0 then ss_finish(2) end
 if hit~=nil and hit==1 then ss_finish(2) end
 if failure==true then ss_finish(2) end
 if verloren==true then ss_finish(2) end
 if gamestate~=nil and gamestate==1 then
  if score~=nil and score>=10 then ss_finish(1)
  else ss_finish(2) end
 end
 if tuer~=nil and zeit~=nil and zeit.zt<=0 then ss_finish(1) end
 if punkte~=nil and punkte>=5 then ss_finish(1) end
 if justgo~=nil and t~=nil and t==0 then ss_finish(2) end
 if t~=nil and won~=nil and t==0 and won==0 then ss_finish(2) end
end

__gfx__
00000000444444444444111144444444444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000447447444411181111444744447447440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700444444441111888111114444444444440000000000000000000055555555000000005555555500000000555555550000000055555555000000000000
00077000444444111118878811111144444444440000000000000000000555577777000000055557777700000005555777770000000555577777000000000000
00077000444411111188777881111111444444440655555555555560005555777777000000555577777700000055557777770000005555777777000000000000
00700700441111111887778888111111114444446657777777777566005557778787000000555777878700000055577787870000005557778787000000000000
00000000111111111888788882811111111144445557777777777555005577778787000000557777878700000055777787870000005577778787000000000000
00000000111155111188288282881111111111445557777777777555005577777777000000557777777700000055777777770000005577777777000000000000
77777777111155b1111822828828817111111114cc57777777777588000577777770000000057777777000000005777777700000000577777770000000000000
7777777711111bbb1111288828881177777111115c57777777777585000088277800000000008827780000000000882778000000000088277880000000000000
77777777111111bbb11112288221117111111111cc57777777777588000077888800000000077888880000000000887788000000000088888877000000000000
777777771111111bbb1111282211117711111111cc55555555555588000097882800000000097888280000000000889728000000000088882879000000000000
7777777711111111bbb1111221111117111111110000000000000000000000c55c00000000000cc55c00000000000cc55c0000000000ccc55c00000000000000
77777777111111111bbb11111111111711111111000000000000000000000888820000000000188882c000000000088882c000000000188882c0000000000000
777777771111111111bbb11111111777111111110000000000000000000000cc100000000000771cc1770000000017ccc77000000000771cc1c7000000000000
7777777711111111111bbb1111111711111111140000000000000000000000777000000000007700007700000000077007700000000077000077000000000000
44444444111111111111bb1111111111111111140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44744744411111111111111111111111117411140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
444444444111111111111111111111114444111400a0000000000a00000055555555000000005555555500000000555555550000000055555555000000000000
444444444111411111111111111111144444111400aa00000000aa00000077777555500000007777755550000000777775555000000077777555500000000000
444444444111444111111111111111144444111400aaaaaaaaaaaa00000077777755550000007777775555000000777777555500000077777755550000000000
444444444111444441111111114411144444111400aaaaaaaaaaaa00000078787775550000007878777555000000787877755500000078787775550000000000
4444444441114444444111114444111444441114000aaaaaaaaaa000000078787777550000007878777755000000787877775500000078787777550000000000
44444444411144444444111444441114444411140000aaaaaaaa0000000077777777550000007777777755000000777777775500000077777777550000000000
0000000041114444444411144444111444441114000000aaaa000000000007777777500000000777777750000000077777775000000007777777500000000000
0000000041114744447411144474111444741114000000a77a000000000000877288000000000087728800000000008772880000000008877288000000000000
0000000041114444444411144444111444441114000000aaaa000000000000888877000000000088888770000000008877880000000077888888000000000000
0000000041114444444411144444111444441114000000aaaa000000000000828879000000000082888790000000008279880000000097828888000000000000
00000000411144444444111444441114444411140000007a7a000000000000c55c000000000000c55cc00000000000c55cc00000000000c55ccc000000000000
000000004111444444441114444411144444111400000aaaaaa00000000000288880000000000c288881000000000c288880000000000c288881000000000000
0000000041114444444411144444111444441114000aa7a7aaaaa00000000001cc0000000000771cc1c700000000077cc771000000007c1cc177000000000000
000000004111444444441114444411144444111400a7a7a77aaaaa00000000077700000000007700007700000000077077700000000077000077000000000000
44444444444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000044444444444000
44444444444444444444444444444444444444444444444444444444444444440000000000000000044444444444444400005555555500000044444444444000
4444444444444444444444444444444444444444444444444444444444444444000000000000000004444444444444440000f555555500000044444444444000
4411111111111111111111111111144444111111111111111111111111111444000000000000000004444444444444440000cff5555500000044444444440000
4411111111111111111111111111144444111111111111771111111111111444000000000000000004444444444444440000ffff555500000044444444440000
44111111157777711791144111111444441111111111117711111111111114440000000000000000044444444444444400008fff555500000044444444440000
44111111157788778771cc411111144444111111111117771111111111111444000000000000000004444444444444440000f8fff55500000044444444440000
4411111115777777888421111111144444111111111117171111111111111444000000000000000004444444444444440000ff8fff5500000044444444440000
441111111577887778258c11111114444411111111111117111111111111144400000000000000000444444444444444000000fff00000000044444444400000
441111111577777778858c11111114444411111111111117111111111111144400000000000000000444444444444444000000fff00000000044444444400000
44111115555777772884811111111444441111111111111711111111111114440000000000000000044444444444444400066666666600000044444444400000
44111155555577778884844111111444441111111111111711111111111114440000000000000000044444444444444400066666666600000044444444400000
44115555555557778884144111111444441111111111111111111111111114440000000000000000044444444444444400066666666600000044444444400000
44444444444444444444444444444444444444444444444444444444444444440000000000000000044444444444444400066666666600000044444444000000
44111111111111111111111111111444441111111111111111111111111114440000000000000000044444444444444400066666666600000044444444000000
44111111111111111111111111111444441111111111111111111111111114440000000000000000044444444466644400066666666600000044444444000000
44111111111111111111111111111444441111111111111111111111111114440000000000000000044444444466644400066666666600000044444444000000
44111111111111111111111111111444441111111111111111111111111114440000000000000000044444444466644400066666666600000044444466000000
44111111111111111111111111111444441111111111111111111111111114440000000000000000044444444444444400066666666600000044444466000000
441111111111111111111111111114444411111111111111111111111111144400000000000000000444444444444444000666fff66600000044444440000000
441111111111111111111111111114444411111111111111111111111111144400000000000000000444444444444444000666fff66600000044444440000000
44111111111111111111111111111444441111111111111111111111111114440000000000000000044444444444444400066666666600000044444440000000
441111111111111111111111111114444411111111111111111111111111144400000000000000000444444444444444000ccccccccc00000044444440000000
444444444444444444444444444444444444444444444444444444444444444400000000000000000444444444444444000ccccccccc00000044444440000000
441111111111111111111111111114444411111111111111111111111111144400000000000000000444444444444444000ccccccccc00000044444400000000
441111111111111111111111111114444411111111111111111111111111144400000000000000000444444444444444000cc00000cc00000044444400000000
441111111111111111111111111114444411111111111111111111111111144400000000000000000444444444444444000cc00000cc00000044444400000000
441111111111111111111111111114444411111111111111111111111111144400000000000000000444444444444444000cc00000cc00000044444400000000
441111111111111111111111111114444411111111111111111111111111144400000000000000000444444444444444000cc00000cc00000044444400000000
441111111111111111111111111114444411111111111111111111111111144400000000000000000444444444444444000cc00000cc00000044444400000000
444444444444444444444444444444444444444444444444444444444444444400000000000000000444444444444444000cc00000cc00000044444400000000
444444444444444444444444444444444444444444444444444444444444444400000000000000000444444444444444000cc00000cc00000044444400000000
0000000000000000000000a044444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444400000000
0000000000000000000a0a0a44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444400000000
00000000555555550000a08044444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444400000000
00000005555777770000a08044111111111177111111111111111444441111111111111111111111111114444411111111111111111111111111144400000000
00000055557777770000088a44111111111717111111111111111444441111111111111111111111111114444411111111111111111111111111144400000000
00000055577787870055580044111111111717111111111111111444441111111111177777111111111114444411111111111111111111111111144400000000
00000055777787870555550044111111111117111111111111111444441111111111111117111111111114444411111111111111711111111111144400000000
00000055777777775655555044111111111117111111111111111444441111111111111117111111111114444411111111111777711111111111144400000000
00000005777777705655555044111111117771111111111111111444441111111111111771111111111114444411111111117711711111111111144400000000
00000000882778805665555044111111117777111111111111111444441111111111177711111111111114444411111111111777777711111111144400000000
00000000888888770566550044111111111111777771111111111444441111111111111777111111111114444411111111111111711111111111144400000000
00000000888828790055500044111111111111111171111111111444441111111111111117111111111114444411111111111111711111111111144400000000
00000000ccc55c000000000044111111111111111111111111111444441111111111777777111111111114444411111111111111711111111111144400000000
00000000188882c00000000044444444444444444444444444444444444444444444444444444444444444444444444444444444744444444444444400000000
00000000771cc1c70000000044111111111111111111111111111444441111111111111111111111111114444411111111111111711111111111144400000000
00000000770000770000000044111111111111111111111111111444441111111111111111111111111114444411111111111111111111111111144400000000
55555555880000000000008844111111111111111111111111111444441111111111111111111111111114444411111111111111111111111111144400000000
55555555888000000000088844111111111111111111111111111444441111111111111111111111111114444411111111111111111111111111144400000000
55555555088800000000888044111111111111111111111111111444441111111111111111111111111114444411111111111111111111111111144400000000
55555555008880000008880044111111111111111111111111111444441111111111111111111111111114444411111111111111111111111111144400000000
55555555000888000088800044111111111111111111111111111444441111111111111111111111111114444411111111111111111111111111144400000000
55555555000088800888000044111111111111111111111111111444441111111111111111111111111114444411111111111111111111111111144400000000
55555555000008888880000044111111111111111111111111111444441111111111111111111111111114444411111111111111111111111111144400000000
55555555000000888800000044444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444400000000
00000000000000888800000044111111111111111111111111111444441111111111111111111111111114444411111111111111111111111111144400000000
00000000000008888880000044111111111111111111111111111444441111111111111111111111111114444411111111111111111111111111144400000000
00000000000088800888000044111111111111111111111111111444441111111111111111111111111114444411111111111111111111111111144400000000
00000000000888000088800044111111111111111111111111111444441111111111111111111111111114444411111111111111111111111111144400000000
00000000008880000008880044111111111111111111111111111444441111111111111111111111111114444411111111111111111111111111144400000000
00000000088800000000888044111111111111111111111111111444441111111111111111111111111114444411111111111111111111111111144400000000
00000000888000000000088844444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444400000000
00000000880000000000008844444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444400000000
44444444444411114444444444444444444444444444111144444444444444444444444444441111444444444444444444444444444411114444444444444444
44744744441118111144474444744744447447444411181111444744447447444474474444111811114447444474474444744744441118111144474444744744
44444444111188811111444444444444444444441111888111114444444444444444444411118881111144444444444444444444111188811111444444444444
44444411111887881111114444444444444444111118878811111144444444444444441111188788111111444444444444444411111887881111114444444444
44441111118877788111111144444444444411111188777881111111444444444444111111887778811111114444444444441111118877788111111144444444
44111111188777888811111111444444441111111887778888111111114444444411111118877788881111111144444444111111188777888811111111444444
11111111188878888281111111114444111111111888788882811111111144441111111118887888828111111111444411111111188878888281111111114444
11115511118828828288111111111144111155111188288282881177711111441111551111882882828811771111114411115511118828828288111111111144
111155b1111822828828811111111114111155b1111822828828811177711114111155b1111822828828877771111114111155b1111822828828811111111114
11111bbb11112888288811177111111111111bbb11112888288811111711111111111bbb11112888288817111711111111111bbb111128882888111111111111
111111bbb11112288221117711111111111111bbb11112288221111771111111111111bbb11112288221171177111111111111bbb11112288221111111111111
1111111bbb11112822111171111111111111111bbb11112822111777777111111111111bbb11112822111771711111111111111bbb1111282211111111111111
11111111bbb11112211117711111111111111111bbb11112211111711111111111111111bbb11112211111771111111111111111bbb111122111111111111111
111111111bbb11111111171111111111111111111bbb11111111171111111111111111111bbb11111111117111111111111111111bbb11111111111111111111
1111111111bbb11111111777711111111111111111bbb11111117711111111111111111111bbb11111111771111111111111111111bbb1111111111111111111
11111111111bbb11111117717711111411111111111bbb11111171111111111411111111111bbb11111177711111111411111111111bbb111111111111111114
111111111111bb111111177771111114111111111111bb111111111111111114111111111111bb111111777111111114111111111111bb111111111111111114
41111111111111111111111111141114411111111111111111111111117411144111111111111111111111111174111441111111111111111111111111741114
41111111111111111111111144441114411111111111111111111111444411144111111111111111111111114444111441111111111111111111111144441114
41114111111111111111111444441114411141111111111111111114444411144111411111111111111111144444111441114111111111111111111444441114
41114441111111111111111444441114411144411111111111111114444411144111444111111111111111144444111441114441111111111111111444441114
41114444411111111144111444441114411144444111111111441114444411144111444441111111114411144444111441114444411111111144111444441114
41114444444111114444111444441114411144444441111144441114444411144111444444411111444411144444111441114444445111118888111444441114
41114444444411144444111444441114411144444444111444441114444411144111444444441114444411144444111441114444445711177782111444441114
41114444444411144444111444441114411144444444111444441114444411144111444444441114444411144444111441114444445711177788111444441114
41114744447411144474111444741114411147444474111444741114447411144111474444741114447411144474111441114744445511177288111444741114
41114444444411144444111444441114411144444444111444441114444411144111444444441114444411144444111441114444445511177877111444441114
41114444444411144444111444441114411144444444111444441114444411144111444444441114444411144444111441114444445511177879111444441114
41114444444411144444111444441114411144444444111444441114444411144111444444441114444411144444111441114444444511155444111444441114
41114444444411144444111444441114411144444444111444441114444411144111444444441114444411144444111441114444444411154444111444441114
41114444444411144444111444441114411144444444111444441114444411144111444444441114444411144444111441114444444411144444111444441114
41114444444411144444111444441114411144444444111444441114444411144111444444441114444411144444111441114444444411144444111444441114
__label__
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd

__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20a0a0a0a0a0a0a0a0a0a0a02020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20a0a0a0a0a0a0a0a0a0a0a02020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20a0a0a0a0a0a0a0a0a0a0a02020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20a0a0a020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20a0a0a020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20a0a0a020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20a0a0a0202020202020202020204a4b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20202020202020202020202020205a5b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20202020202020202020202020206a6b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20202020202020202020202020207a7b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
970100000c17300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 00424344

