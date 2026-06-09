pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
-- surviving sandwehen
-- story + single meta cart

-- story_order is intentionally separate:
-- reorder this list later without touching
-- the single level menu below.
story_order={1,2,3,4,5,6,7,8,9,10,11,12}

levels={
 {"alina",   "mensa escape"},
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

story_text={
 "erstmal mensa ueberleben:\nwer snacks ausweicht,\nbekommt energie fuer tag 1.",
 "der schulweg ruft.\nautos links, abschluss rechts!",
 "woerter sortieren: deutsch\nist wie sport, nur mit stiften.",
 "hindernislauf im schulflur.\nbitte nicht die deko umrennen.",
 "faecher sortieren:\nchaos rein, stundenplan raus.",
 "sandwehen vor der schule!\naugen zu und weiterlernen.",
 "ein mysterioeses level.\nniemand weiss, was passiert.",
 "noch ein level der legenden.\nmutig bleiben!",
 "verstecken in der schule.\npsst, die pause zaehlt.",
 "schneeball-alarm!\nauch kalte haende schaffen abi.",
 "basketball-pruefung:\nkorb treffen, zukunft treffen.",
 "zu spaet? nicht heute!\nder abschluss wartet."
}

-- cartdata works in pico-8 html exports.
-- slots: 0 mode, 1 story pos,
-- 2 lives, 3 result from level
cartdata("surviving_sandwehen")

state="title"
sel=1
level_sel=1
blink=0
timer=0
lives=3
story_pos=1

function _init()
 local mode=dget(0)
 local result=dget(3)
 if result>0 then
  dset(3,0)
  if mode==1 then
   story_pos=max(1,dget(1))
   lives=max(0,dget(2))
   handle_story_result(result)
  else
   state="single"
  end
 else
  state="title"
 end
end

function handle_story_result(result)
 if result==1 then
  story_pos+=1
  dset(1,story_pos)
  if story_pos>#story_order then
   state="graduation"
  else
   state="cutscene"
  end
 else
  lives-=1
  dset(2,lives)
  if lives<=0 then
   state="gameover"
  else
   state="retry"
   timer=120
  end
 end
end

function _update60()
 blink=(blink+1)%60
 if state=="title" then update_title()
 elseif state=="single" then update_single()
 elseif state=="cutscene" then update_cutscene()
 elseif state=="retry" then update_retry()
 elseif state=="graduation" or state=="gameover" then update_end_scene()
 end
end

function update_title()
 if btnp(2) or btnp(3) then sel=3-sel sfx(0) end
 if btnp(4) or btnp(5) then
  if sel==1 then start_story()
  else state="single" end
  sfx(1)
 end
end

function start_story()
 lives=3
 story_pos=1
 dset(0,1)
 dset(1,story_pos)
 dset(2,lives)
 dset(3,0)
 state="cutscene"
end

function update_single()
 if btnp(2) then level_sel-=1 sfx(0) end
 if btnp(3) then level_sel+=1 sfx(0) end
 if level_sel<1 then level_sel=#levels end
 if level_sel>#levels then level_sel=1 end
 if btnp(5) then state="title" sfx(0) end
 if btnp(4) then
  dset(0,2)
  dset(1,level_sel)
  dset(3,0)
  sfx(1)
  load_level(level_sel)
 end
end

function update_cutscene()
 if btnp(5) then state="title" sfx(0) end
 if btnp(4) then
  dset(0,1)
  dset(1,story_pos)
  dset(2,lives)
  dset(3,0)
  sfx(1)
  load_level(story_order[story_pos])
 end
end

function update_retry()
 timer-=1
 if timer<=0 then
  dset(0,1)
  dset(1,story_pos)
  dset(2,lives)
  dset(3,0)
  load_level(story_order[story_pos])
 end
end

function update_end_scene()
 if btnp(4) or btnp(5) then
  dset(0,0)
  dset(1,1)
  dset(2,3)
  dset(3,0)
  state="title"
  sfx(0)
 end
end

function load_level(i)
 load(levels[i][1]..".p8")
end

function _draw()
 if state=="title" then draw_title()
 elseif state=="single" then draw_single()
 elseif state=="cutscene" then draw_cutscene()
 elseif state=="retry" then draw_retry()
 elseif state=="graduation" then draw_graduation()
 elseif state=="gameover" then draw_gameover()
 end
end

function draw_title()
 cls(1)
 map(0,0,0,0,16,16)
 for i=0,15 do line(0,i*8,127,i*8,5) end
 circfill(104,24,16,10)
 rectfill(0,88,127,127,4)
 print("surviving",45,20,7)
 print("sandwehen",43,29,10)
 print("abschluss-edition",31,39,6)
 draw_option(1,"story-modus",38,64)
 draw_option(2,"single-modus",38,76)
 print("⬆️⬇️ waehlen  🅾️ start",11,113,6)
end

function draw_option(n,t,x,y)
 local c=6
 if sel==n then
  rectfill(x-8,y-2,x+72,y+6,13)
  c=7
  if blink<30 then print("▶",x-6,y,c) end
 end
 print(t,x+4,y,c)
end

function draw_single()
 cls(1)
 rectfill(0,0,127,17,5)
 print("single-modus",40,6,7)
 print("⬆️⬇️ waehlen",7,113,6)
 print("🅾️ starten ❎ zurueck",61,113,6)
 local start=max(1,min(level_sel-4,#levels-7))
 for i=start,min(#levels,start+7) do
  local y=26+(i-start)*10
  local c=6
  if i==level_sel then
   rectfill(8,y-2,119,y+6,13)
   c=7
   if blink<30 then print("▶",11,y,c) end
  end
  print(levels[i][1]..": "..levels[i][2],20,y,c)
 end
end

function draw_cutscene()
 local li=story_order[story_pos]
 cls(12)
 draw_story_picture(li)
 rectfill(4,76,123,122,0)
 rect(4,76,123,122,7)
 print("kapitel "..story_pos.."/"..#story_order,8,80,10)
 print(levels[li][2],8,88,7)
 print(story_text[story_pos],8,98,6)
 print("leben: "..lives,84,80,8)
 print("🅾️ los  ❎ titel",30,121,5)
end

function draw_story_picture(i)
 -- placeholder: later replace with
 -- spr()/map() calls per level.
 rectfill(14,10,113,68,9)
 rect(14,10,113,68,7)
 circfill(34+i%6*10,34,12,10)
 rectfill(20,54,108,68,4)
 print("bild platzhalter",34,30,7)
end

function draw_retry()
 cls(8)
 rectfill(8,38,119,88,0)
 rect(8,38,119,88,7)
 print("aua, das war knapp!",24,46,7)
 print("leben uebrig: "..lives,34,58,10)
 print("gleich nochmal...",31,72,6)
end

function draw_graduation()
 cls(12)
 rectfill(0,82,127,127,4)
 rectfill(18,48,109,82,5)
 rectfill(28,34,99,48,13)
 print("abschluss-zeremonie",25,18,7)
 spr(1,58,58)
 rectfill(50,52,78,65,7)
 print("zeugnis",52,56,0)
 print("geschafft!",43,92,10)
 print("du hast deinen abschluss",13,103,7)
 print("ueberlebt. glueckwunsch!",10,111,7)
 print("🅾️/❎ titel",42,121,5)
end

function draw_gameover()
 cls(2)
 rectfill(8,30,119,96,0)
 rect(8,30,119,96,8)
 print("leider nicht geschafft",22,42,8)
 print("die sandwehen waren",24,56,7)
 print("diesmal staerker.",31,64,7)
 print("neuer versuch ab tag 1!",12,80,10)
 print("🅾️/❎ titel",42,111,5)
end
