# Scrap Mechanic Survival Map Viewer
This dumps your map data for a survival game and displays it in the browser.
It needs an active internet connection to get Jquery and JqueryUI.

## Steps to Follow
1. Open map_dump.lua and copy all lines
2. Open Scrap Mechanic\Survival\Scripts\game\terrain\terrain_overworld.lua and paste the lines into the method *load()* in between *print( "Seed: "..g_cellData.seed )* and *return true*
3. Make a backup of your savegame to be safe
4. Start the game and load your survival game. The game starts and creates a new file *map_dump.json* in Scrap Mechanic\Survival.
5. Open the json and the file map.html from this repo
6. Paste the content into map.html at line 178 between the backticks (json = `*(PASTE HERE)*`)
7. Open map.html in your browser
