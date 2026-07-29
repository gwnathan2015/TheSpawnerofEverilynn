# The Spawner of Everliynn 
requires a machine that can run Lua and love 11.5 or later.
<img width="524" height="506" alt="image" src="https://github.com/user-attachments/assets/abcfebed-3cca-444a-bd17-f9e821db5908" />
## INSTALLATION.

1. install love 11.5
2. make sure love 11.5 is properly set up
3. install the game folder
4. open powershell or a windows command line runner
5. type start-process 'path-to-love.exe here' TheSpawnerofEverilynn  (note path-to-love.exe needs to be replaced with the FULL path from the root system file c:/ all the way to where love.exe is installed. if on windows it should be right in c:/programfiles (x86)/love/love.exe)
7. play!

## VERSIONS

| Version |name           | Notes                                                                              | Codename           |
|---------|---------------|------------------------------------------------------------------------------------|--------------------|
| *PA-1.4 |NA             |adding characters.lua                                                               |refactor era                |
| *PA-1.5 |refactor pt. 1 | refactoring characters.lua                                                         |refactor era                |
| *PA-1.6 |refactor pt. 2 | refactoring map.lua and characters.lua                                             |refactor era                |
| *PA-1.7 |refactor pt. 3 | refactoring characters.lua                                                         |refactor era                |
| *PA-1.8 |NA             |refactor of character positioning and movement system                               |cavern              |
| *PA-1.8.1|Github update |addition of the github repository, and minor changes to the version file            |cavern              |
| *PA-1.8.2| Health update|addition of characters.coordinates and characters.stats                             |cavern              |
| *PA-1.8.3| health update 2| finishes the health update                                                       |cavern              |
| *PA-1.8.4| health update 3|adds more to the health update. not yet released. also adds music and title screen| cavern             |
| *PA-1.8.5| Dwarves and enemies| not yet released, adds Dwarves and other enemies                             |cavern              |
| *PA-1.8.6| Map expansion | no new tiles, but map expansion|crystal,  map expansion 57483025742035749203574389302574383204|
| *PA-1.9.0| UI update| finishes UI |crystal|
| *PA-1.9.1| shops update| explore a variety of shops run by your allies in fort city| crystal|
| *PA-1.9.2| map expasion 2| map expansion, new tiles maybe, houses maybe, but bigger map definitely.| crystal, map expansion 57483025742035749203574389302574383205|
| *PA-1.9.3| map expansion 3| anothe rmap expansion. likely an attempt at quest implementation and UI| crystal, map expansion 57483025742035749203574389302574383206|
| *PA-1.9.4| modding| support for the planned modding, not released | crystal|
| *PA-1.9.5| TBA| TBA| crystal|
| *PA-2.0| TBA| TBA| fort machine|
| *PA-2.0.1| TBA| TBA| fort machine|
| *PA-2.0.2| TBA| TBA| fort machine|
| *PA-2.1.0| TBA| TBA| TBA|

## Features
 
nothing much to see here, most features aren't here yet, although there is a wizard (supposed to sell potions when the game is done), a swordsman (follows the player and supposed to help the player defeat dwarves) and a working movement system where the bottom half of trees and NPCs can't be moved into. to see future game updates go into version.md.
we got some nice music (that doesn't play in game yet) from the web. for more info about that go to the credits md file in the music folder.
press R to respawn if you ever need that. also pressing ESC closes the game

<img width="800" height="637" alt="Screenshot 2026-07-27 110459" src="https://github.com/user-attachments/assets/68067903-6cc7-474b-be3b-91058840809c" />





## PLANNED MODDING

for the future, when modding can be implemented (maybe it will) mods will look like this:

```
mods/
    dwarven_expansion_mod/
        dwarven_expansion_mod info.lua
        assets/
            tiles/
            characters/
            items/
            ui/
        code/
            maps/
                dwarven_expansion_mod map1.lua
                dwarven_expansion_mod map2.lua
            hazards.lua
            npcs.lua
            items.lua
            init.lua
```

the info.lua file for each mod will say basic info like:

```
return {
    name = "Dwarven Expansion Mod",
    version = "1.0",
    author = "Nathan",
    description = "Adds dwarven ruins, new hazards, and expanded lore.",
    mod_type = "addition", -- content + features
    entry = "code/init.lua",
    assets = {
        tiles = "assets/tiles/",
        characters = "assets/characters/",
        items = "assets/items/",
        ui = "assets/ui/"
        music = "assets/music"
        sounds = "assets/sounds"
    },
    dependencies = {},
    load_priority = 1
}
```

the init.lua file HAS to tell the game where every file in the code section is, because in reality, in the code folder, you can put any folder path you want, as long as init.lua tells the game where the mods files are. the maps have to have the mods name in it with underscores replacing spaces. the assets folder has to be organized exactly like is shown, or else the game won't load them properly, and you will be stuck with broken maps.

there are three types of mods, content mods witch only add maps using vanilla or modded tiles, and they don't need an assets folder, but everything else remains the same, addition mods, which have everything as shown, and feature mods, witch don't add maps or tiles, but can add brand new features, and even help loading other mods like an API core thingy in Minecraft modding. please note this is planned theoretical and won't actually work without a lot of rewriting the game engine. we hope to be there by the time were at our last beta or first release (if that ever comes)



## CHARACTERS

|character | faction| implemented? |
|----------|--------|--------------|
|wizard | ally (sells potions) |not fully|
|swordsman | ally (fights with player) |not fully|
|farmer | ally (sells food to heal) |not fully|
|tool smith | ally (sells weapons and tools to help you) |not at all|
|dwarves | enemy| not at all|
|king of fort city | ally | not at all|
|king of everless | ally| not at all|

## LORE AND STORY

in 234 CE of the planet of everliynn, a lone dwarf stumbles upon the "spawner" and he uses its full potential to corrupt and bend the kingdom of Evely to his will, soon he destroyed it, building the castle fort city of dwarvia to replace it.

in 245 CE of the planet everliynn, the lone dwarf declares the empire of dwarvenland. many nearby kingdoms fall to his imperial forces, as he plumages the world

now, in 256 CE of the planet Everilynn, you alone can plan and manage to defeat the dwarven king, starting from the last free, big city, fort city, you must free the world of the dwarven empire, and you are not alone in your fights, you have the wizard, who will gladly sell you your potions in return for coins gained by defeating dwarves, the farmer, who will gladly sell you food to heal your health after a great fight with dwarves, and your most loyal ally, the swordsman, who pledged to protect and help you in combat. the reason for this is unknown, and what the spawner is unknown, however the swordsman says that he thinks is an amalgamation of the mythical "creator of the world's powers after he is said to have been tricked into losing his powers by a small group of kings, seeking power for themselves, however the power never managed to get to those kings, and eventually over time became deep in the earth and compacted into the spawner, only for it to be found by that lone dwarf when he was mining.

the goals and intent of the dwarf remain unknown, except for one thing that an elven spy in the dwarven court said, he said "the dwarven king said 'KILL THEM ALL, THE ELVES, THE HUMANS, THE ANIMALS, KILL THEM, ALL, GIVE ME ALL THEIR WEALTH, AND GROW OUR POPULATION! SOON WE Shall MARCH ON FORT CITY" ever since then, fort city and everless have been getting attacked, and while fort city created an elaborate wall and canal thing, everless grew a large barrier of trees, stone, dirt, grass, and water

fort city and everless are very different, first of all everless is the last remaining major elven settlement, its more down to earth, and many houses are made out of large mushrooms or trees(typical in where they live) and their defense systems against dwarves use grasses and mosses that are poisonous to dwarves but not humans, the two cities are far apart, but they both jointly protect the trade between each other, sending military with traders to protect them and make sure the trade gets to the other side of the trade corridor

the player starts with 100 HP the swordsman has 120, but he got hurt on his way to the player at the start, and the wizard and farmer have 100, the basic dwarves have 50, the bulk dwarves have 100, the miner dwarves have 120, and the dwarf golems have 350. the commanders have 90 but cannot defend themselves except for spawning in dwarves.
getting rid of special dwarves lessens the dwarves supply of them, as they are very hard to create, taking years after the empire's formation for the first golem to be finished.

when the final boss fight is ahead, beware the dwarves are tricky to fight, they will spend years trying to get rid of you, especially if they're at their weakest, which is when you're at your weakest, underestimating them. beware, every turn could bring a dwarven attack, every battle, loses food, health, and potions, and every escape, loses morale. and another beware, the dwarves can NOT be reasoned with.

the farmer sells bread, gives 20 HP, apples gives 10 HP, wheat, give it to the miller and get a portable milling station, potatoes gives 65 HP. 1 bread is usually worth 2 or 3 coins, while 1 apple is usually worth 1, and wheat is free (for a quest) when it's not its usually 2 coins, 1 potato sits at 3 or 4 coins.

one quest has the player protecting a trade caravan to the elven city of everless, only right after during your overnight stay, you hear dwarf noises, you have to protect the city from a dwarven invasion.

the humans and elves used to live in one kingdom, the two kingdoms royal heritage united, but the dwarves once took the trade corridor, and the two have not reunified since. beware, the weakest point is also the most attacked, because the weakest point.... is the most important one. the wizard has used some of his magic to put fort city in a pocket universe to protect it from full dwarven occupation, as dwarves can't stay in there for long.

everless is in a ring of magic, a magical barrier created in 1206 BCE by elven wizards' magicians and elders to defend the city before the unification with the humans in 119 CE. the crown prince of everless is the heir to the crown, and soon to be leader, as the current king is in deteriorating condition. the princess of everless was married to prince mark of Marell (a small human-elven settlement off the coast of the great ocean) and was previously before that married to prince browom of the city right next to fort city, fortress city.

the great ocean is being drained by the dwarves, its already half its usual size, where all this water goes is unknown, however legends say its the king of dwarveia practicing ice freezing, and throwing. the reigion of marell is larger than the used to exist town, but you see... the area has grown due to the great oceans no longer being great.

the miller offers you a portable milling station, in return for you transporting from the farmer to the miller. with it, you can turn wheat into flour, flour into dough, and dough into any type of bread you can make. the weaponsmith, offers you axes, swords, pickaxes (for if you need stone to repair portable stations), and the guard of the towers, offers you arrows, and a portable fletching station.

typical tools include stone iron and bronze swords axes and arrows, with wooden silk bows, the silk coming from silk trees in everless, currently the massive iron and bronze fields are in dwarven territory. one quest is to reclaim it. afetr the quest, the price of iron and iron tools goes from 50 coins to 15 coins. same with bronze going from 35 coins to 10 coins. arrows on both types go from around 20 to only 8 coins.

the king of fort city and the crown prince of everless (current acting king) offer you 30 coins each for reclaiming the reigion and setting up fortifications. 
