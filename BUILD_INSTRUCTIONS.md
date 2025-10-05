# DICE GAME - BUILD & UPLOAD GUIDE

## 🎯 STEP-BY-STEP EXPORT GUIDE

### 1. OPEN GODOT EDITOR
- Open Godot 4.5
- Open your dice project from: `C:\Users\ADMIN\OneDrive\Documents\dice`

### 2. DOWNLOAD EXPORT TEMPLATES
- Go to: **Project** → **Export...**
- Click: **Manage Export Templates** 
- Click: **Download and Install**
- Wait for download (may take 5-10 minutes)

### 3. CREATE WINDOWS EXPORT PRESET
- In Export dialog, click **Add...**
- Select: **Windows Desktop**
- Name: "Windows Release"

### 4. CONFIGURE EXPORT SETTINGS
**Required Settings:**
- Export Path: `C:\Users\ADMIN\Desktop\dice_game.exe`
- Executable Name: `dice_game.exe`
- Application → Name: `Dice Game`
- Application → Description: `Roll dice and win coins!`
- Binary Format → Export With Debug: **OFF**
- Binary Format → Embed PCK: **ON**

**Optional Settings:**
- Application → Icon: Use `res://icon.svg`
- Application → Version: `1.0`

### 5. EXPORT THE GAME
- Click: **Export Project**
- Navigate to Desktop
- File name: `dice_game.exe`
- Click: **Save**
- Wait for export completion

### 6. TEST YOUR GAME
- Go to Desktop
- Double-click `dice_game.exe`
- Verify homepage loads
- Test dice rolling works
- Check coin saving/loading

## 🚀 ITCH.IO UPLOAD GUIDE

### 1. CREATE GAME PAGE
- Go to: https://itch.io/game/new
- Fill out:
  - **Title:** Dice Game
  - **Project URL:** yourusername.itch.io/dice-game
  - **Classification:** Game
  - **Kind of project:** Game
  - **Genre:** Strategy, Casino

### 2. UPLOAD FILES
- **Upload files:** Select `dice_game.exe` from Desktop
- **Platforms:** Check "Windows"
- **This file will be played in the browser:** NO

### 3. GAME DETAILS
**Description:**
```
🎲 Roll the dice and test your luck!

- Start with 100 coins
- Pay 5 coins per roll
- Win probability changes every roll (20-80%)
- Win: Get 15 coins back (+10 profit)
- Lose: Just the 5 coins you paid

Simple, addictive, and fair gameplay with real probability mechanics!
```

**Tags:** dice, casino, probability, gambling, simple

### 4. SCREENSHOTS
Take screenshots of:
- Homepage with "PLAY" button
- Game screen showing dice, coins, and probability
- A winning roll (green flash)

### 5. PUBLISH
- **Pricing:** Free
- **Visibility:** Public  
- **Content Rating:** Everyone
- Click: **Save & view page**

## 📁 PROJECT FILES READY FOR EXPORT:
✅ homepage.tscn - Main menu
✅ dice_roll.tscn - Game scene  
✅ Main.gd - Game logic
✅ Dice.gd - Dice animation
✅ SaveManager.gd - Save system
✅ All assets included

## 🎮 EXPECTED FILE SIZE:
- EXE file: ~35-50 MB
- Contains everything needed to run

## 🆘 IF YOU NEED HELP:
1. Make sure Godot 4.5 is installed
2. All files are in the dice project folder
3. Project opens without errors
4. Main scene is set to homepage.tscn

Your game is ready to export! Just follow these steps in Godot.