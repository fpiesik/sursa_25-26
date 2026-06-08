pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
-- surviving sandwehen
-- multi-cart menu
-- each menu entry loads one
-- student mini-game cart

levels={
 {"sam",   "mensa escape"},
 {"alissa",  "schulweg"},
 {"damon",   "wort-sortierer"},
 {"elanur",  "hindernislauf"},
 {"emirhan", "faecher-sortierer"},
 {"ivan",    "sandwehen"},
 {"lian",    "level"},
 {"raphael", "level"},
 {"samuel",  "verstecken"},
 {"sean",    "schneeball"},
 {"toprak",  "basketball"},
 {"tyler",   "zu spaet"}
}
sel=1
blink=0

function _init()
 cls()
end

function _update60()
 blink=(blink+1)%60
 if btnp(2) then sel-=1 sfx(0) end
 if btnp(3) then sel+=1 sfx(0) end
 if sel<1 then sel=#levels end
 if sel>#levels then sel=1 end
 if btnp(4) or btnp(5) then
  local cart=levels[sel][1]..".p8"
  sfx(1)
  load(cart)
 end
end

function _draw()
 cls(1)
 rectfill(0,0,127,17,5)
 print("surviving",45,3,7)
 print("sandwehen",43,10,10)
 print("multi-cart",42,22,6)
 print("⬆️⬇️ waehlen",7,113,6)
 print("🅾️/❎ starten",75,113,6)
 print("in levels: 🅾️+❎ menu",25,121,5)

 local start=max(1,min(sel-4,#levels-7))
 for i=start,min(#levels,start+7) do
  local y=34+(i-start)*9
  local c=6
  if i==sel then
   rectfill(8,y-2,119,y+6,13)
   c=7
   if blink<30 then print("▶",11,y,c) end
  end
  print(levels[i][1]..": "..levels[i][2],20,y,c)
 end
end
