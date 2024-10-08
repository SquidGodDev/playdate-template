# Playdate Template
This template will help you set up everything you need to start making a game for the Playdate. We will be creating a development environment to make a Playdate game in Lua using Visual Studio Code. Sets up automated builds, autocomplete, and debugging. Works for both Windows and Mac.

This template includes a copy of [playdate-luacats](https://github.com/notpeter/playdate-luacats) by notpeter, licensed under the MIT license.

# Setup
1. Install the Playdate SDK at [https://play.date/dev/](https://play.date/dev/)
2. Install Visual Studio Code (VSCode) at [https://code.visualstudio.com/download](https://code.visualstudio.com/download)
3. **WINDOWS ONLY** - Set your environment variable:
   - Open the "Windows Powershell" application, copy and paste this into the terminal: `set PLAYDATE_SDK_PATH="$env:USERPROFILE\Documents\PlaydateSDK"`, and then press enter
   - If it worked correctly, you shouldn't see any output
   - If you installed the Playdate SDK at a different path, change the `$env:USERPROFILE\Documents\PlaydateSDK` part of the command to where you installed it
4. Clone this repo, or if you don't know what that means, press the big green "Code" button at the top of the Github page, click "Download ZIP", and unzip the file
5. Open the downloaded template folder in VSCode by first launching VSCode, and then going to `File -> Open Folder` at the top left of your VSCode window
   - Make sure you're opening the folder than contains the `.vscode` folder directly, *not* the folder containing that folder, as some unzipping utilities automatically create an extra parent folder
   - This is because the `.vscode` folder must be a direct child of the folder you opened in order for VSCode to pick it up
6. A popup should appear on the bottom right of your VSCode window asking you to install recommended extensions - go ahead and click install
   - If the popup does not appear, you can install the extensions manually with the `Extensions` icon (tetris block looking thing) on the left side and searching `@recommended`
   - The extensions are "Lua" by sumneko and "Playdate Debug" by midouest
7. Press `ctrl/cmd + shift + b`, or go to `Terminal -> Run Build Task...` at the top of your VSCode window to build your project
8. The Playdate Simulator should launch automatically with your game
9.  You can delete this `README.md` file and the `.txt` file in the `builds` folder

# Debugging
1. Set breakpoints in your `.lua` files by clicking to the left of the line number
2. Press `F5`, or click the `Run and Debug` icon (triangle with a little bug next to it)
   - The debug button on the top right of your file is *not* the same - this debugs the current *file*, not the whole project, so it will fail (unless your file contains `playdate.update`)

# Starting a new project
To start a new project, you can re-download or make a copy of this template folder and open it again in VSCode. Since the extensions have already been installed, you can immediately build and run your new project. Except for this `README.md` file, *every* file in this template is required, so each of your projects needs a copy of the `.vscode` folder and all its contents, at the very least the `main.lua` and `pdxinfo` in the `source` folder, and an empty `builds` folder.

# Sharing your project
Before sharing your project, you must fill out the `pdxinfo` file with metadata about your game. You can find more information about that [here](https://sdk.play.date/Inside%20Playdate.html#pdxinfo).

The required fields are already listed in the `pdxinfo` file. The main things to note are:
1. `bundleID` must be in the specific `com.[author].[gamename]` format
2. The `version` number is *only* used as something to display to players, not for version handling, so this can be formatted however you want
3. The `buildNumber` is what's used by the Playdate system for version handling (i.e. to know when there is an update), so you must increase this number whenever you release an update to the game to signify that there is a new version
4. The `description` field isn't actually being used for anything right now, but it might be in the future, so it's probably good to fill it out

Here is a sample pdxinfo file:
```
name=Propeller Rat
author=SquidGod
description=Propeller around as a rat - in space
bundleID=com.squidgod.propellerrat
version=1.0
buildNumber=1
```

Once you fill that out and build your project one more time, you can find the `.pdx` folder in the `builds` folder with the name of your game. Zip the entire `.pdx` folder, and share it to the world!

# Template Structure
- `.vscode` - Tells VSCode how to build and launch your Playdate game
  - `playdate-luacats` - Enables type annotations and autocomplete for the Playdate SDK
  - `extensions.json` - Defines for recommended extensions
  - `launch.json` - Defines what `Run and Debug` should do
  - `tasks.json` - Defines what `Run Build Task...` should do
- `builds` - Your compiled Playdate program goes here in the form of a `.PDX`
  - `YOUR_GAME_APPEARS_HERE.txt` - Added just so the `build` folder shows up in this repository (can be deleted)
- `source` - The code and assets for your game goes here
  - `main.lua` - Initial entry point for your Playdate game (required file)
  - `pdxinfo` - Used by the Playdate to get metadata about your game
    - You must fill this out before sharing your game
    - You can find more information about this file [here](https://sdk.play.date/Inside%20Playdate.html#pdxinfo)
- `README.md` - The file you're reading (can be deleted)