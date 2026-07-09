
![TemplateBanner](https://github.com/user-attachments/assets/a0e438d1-9923-4525-ae5c-c0d179ec3bc7)

# Playdate Template
This template will help you set up everything you need to start making a game for the Playdate. We will be creating a development environment to make a Playdate game in Lua using Visual Studio Code. Sets up automated builds, autocomplete, and debugging. Works for Windows, Mac, and Linux.

You can find a video tutorial on how to use this template and make your first Playdate game here: https://youtu.be/UZ04rk3lLqU

This template includes a copy of [playdate-luacats](https://github.com/notpeter/playdate-luacats) by notpeter, licensed under the MIT license.

# Setup
1. Download and install Visual Studio Code (VSCode) at [https://code.visualstudio.com/download](https://code.visualstudio.com/download)
2. Download and install the Playdate SDK at [https://play.date/dev/](https://play.date/dev/)
   - **Linux only:**
     - Extract the zipped SDK folder and rename the folder to `PlaydateSDK`
     - Move the `PlaydateSDK` folder to your "Documents" folder (or any other desired location)
     - Right-click the folder and select "Open in Terminal"
     - Type `sudo ./setup.sh` and press enter to run the setup script
     - Keep terminal window open for the next step
3. **Windows and Linux only (skip for Mac):** Set your environment variable
   - **Windows**
     - Open the "Windows Powershell" application, copy and paste the following into the terminal, and then press enter:

        ```sh
       [Environment]::SetEnvironmentVariable("PLAYDATE_SDK_PATH", ([Environment]::GetFolderPath("MyDocuments"))+"\PlaydateSDK", "User")
        ```
     - If you installed the Playdate SDK at a different path, change the `([Environment]::GetFolderPath("MyDocuments"))+"\PlaydateSDK"` part of the command to where you installed it
     - To check if it worked correctly, close and reopen Powershell, type `cd $env:PLAYDATE_SDK_PATH`, and press enter. It should print the path to your `PlaydateSDK` folder
   - **Linux**
     - In a terminal window, type the following command to open your `.bashrc` file located in your Home directory using the nano text editor (replace `.bashrc` with `.zshrc` if your distro uses zsh instead of bash) 
       ```
       nano ~/.bashrc
       ```
     - Scroll to the bottom of the file and copy and paste the following command (if you put your folder in a different location, change `$HOME/Documents/PlaydateSDK` to the path of your `PlaydateSDK` folder)
     
       ```sh
       export PLAYDATE_SDK_PATH=$HOME/Documents/PlaydateSDK
       ```
     - Press `Ctrl + X` to exit, `Y` to save, and then `Enter` to confirm the file name
     - If `nano` is not installed, you can manually edit/create your `.bashrc` file which you can find by navigating to your Home folder (make sure hidden files are shown) 
4. Download this template - to do so, press the big green `<> Code` button at the top of the Github page, click "Download ZIP", and unzip the file (alternatively, if you have git installed, you can just clone the repository)
5. Open the downloaded template folder in VSCode by first launching VSCode, and then going to `File -> Open Folder` at the top left of your VSCode window
   - Make sure you're opening the folder than contains the `.vscode` folder directly, *not* the folder containing that folder, as some unzipping utilities automatically create an extra parent folder
   - This is because the `.vscode` folder must be a direct child of the folder you opened in order for VSCode to pick it up
6. A popup should appear on the bottom right of your VSCode window asking you to install recommended extensions - go ahead and click install
   - If the popup does not appear, you can install the extensions manually with the `Extensions` icon (tetris block looking thing) on the left side and searching `@recommended`
   - The extensions are "Lua" by sumneko and "Playdate Debug" by midouest
7. Press `ctrl + shift + b` (`cmd + shift + b` for Mac), or go to `Terminal -> Run Build Task...` at the top of your VSCode window to build your project
8. The Playdate Simulator should launch automatically with your game
9. You can delete this `README.md` file and the `.txt` file in the `builds` folder

# Troubleshooting
- If you opened VSCode before you set your environment variable, VSCode hasn't picked up on the new environment variable yet - first try closing and reopening VSCode
- `Task configuration failed: Could not read Playdate SDK version at <path>`
  - This means that the PlaydateSDK folder was not found at the path that you set your `PLAYDATE_SDK_PATH` environment variable to. It likely means that your PlaydateSDK folder was not installed in the default documents folder (`C:\Users\<Username>\Documents\PlaydateSDK` for Windows). Double-check your Documents folder and look for a `PlaydateSDK` folder. If it's there, try setting it again. Otherwise, it got installed somewhere else, so you'll need to set the environment variable to that path, or reinstall the SDK at your normal documents folder
  - Sometimes, for Windows, your PlaydateSDK gets installed in the **OneDrive** documents folder instead by default (e.g. `C:\Users\<Username>\OneDrive\Documents\PlaydateSDK`. In that case, you'll need to change the environment variable path to your OneDrive path instead by using the below command in the "Set your environment variable" step, or go through the installer again and ensure the Playdate SDK is in your normal documents folder
  ```sh
   [Environment]::SetEnvironmentVariable("PLAYDATE_SDK_PATH", "$env:USERPROFILE\OneDrive\Documents\PlaydateSDK", "User")
  ```
  - Another possible Windows issue is the Playdate SDK gets installed on another drive (e.g. `D:\`, `E:\`, etc.)
  - If you set a custom path, it's possible that you made a typo when setting your environment variable path - try setting it again
  - After every change to your environment variable, you'll need to close and re-open VSCode for it to pickup the change
- `Task configuration failed: Could not find the Playdate SDK. Please ensure that the PlaydateSDK is installed and the PLAYDATE_SDK_PATH environment variable is set`
  - This means that your `PLAYDATE_SDK_PATH` environment variable does not exist. Try setting it again, or look up how to set environment variables another way ("set environment variable windows" or "set permanent environment variable [Linux distro]")
- `No build task to run found` when trying to run the build task
  - Likely that you've opened the wrong folder - the folder should be the one containing the `.vscode`, `builds`, and `source` folders, not a parent to that folder
- `SDK Path Not Set` error on simulator
   - Your SDK installation might be on a different drive than your project. If your SDK was installed on your D:/ drive and your project is in your C:/ drive, try re-installing the SDK on your C:/ drive instead.
- Seeing system "Settings" page instead of demo app
  - Sometimes happens when running the first time when there's no configuration folder - closing the Simulator and building again should solve the issue most of the time
- `Task configuration failed` on Linux
  - It's possible your default shell is zsh instead of bash - check by going to VSCode, click "Terminal" -> "New Terminal" at the top, and typing and running `echo $0`. If it says `zsh`, then you need to add your environment variable to `.zshrc` instead of `.bashrc` 

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
- `builds` - When you run the build task, the compiled Playdate program goes here in the form of a `.pdx`
  - `buildsFolder.txt` - A short description of what the `build` folder is for (can be deleted)
- `source` - The code and assets for your game goes here
  - `main.lua` - Initial entry point for your Playdate game (contains an example program which can be deleted)
  - `pdxinfo` - Used by the Playdate to get metadata about your game
    - You must fill this out before sharing your game
    - You can find more information about this file [here](https://sdk.play.date/Inside%20Playdate.html#pdxinfo)
- `README.md` - The file you're reading (can be deleted)

