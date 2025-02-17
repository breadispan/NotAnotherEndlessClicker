# NotAnotherEndlessClicker

NotAnotherEndlessClicker is an **AutoClicker** built with **AutoHotkey** (AHK) that allows users to automate mouse clicks at a specified position with a set interval and amount. It includes a **tray icon animation feature** to indicate when the script is actively clicking.

## 🚀 Features
- 🖱️ Clicks at a **specific mouse position** set by the user.
- ⏳ Set a **custom time interval** between clicks.
- 🔢 Choose the **number of clicks** to perform.
- 🎨 **Tray icon animation** when clicking.
- 🔄 **Stop anytime** by pressing `Esc`.

## 📦 Requirements
- Windows OS
- [AutoHotkey](https://www.autohotkey.com/) (AHK) installed

## 📜 How to Use
1. **Run the script** (Requires AutoHotkey installed).
2. Press **`F2`** to open the configuration window.
3. Set:
   - **Interval (seconds)** between clicks.
   - **Click amount** (number of clicks to perform).
4. Move your mouse to the **desired position**.
5. Press **`F3`** to start auto-clicking.
6. Press **`Esc`** to **stop** the script.

## 🔧 Installation
1. Download **NotAnotherEndlessClicker.ahk**.
2. (Optional) Place `.ico` files inside the `animation` folder to enable icon animation.
3. Run the script by double-clicking it or executing it with AutoHotkey.

## 🔄 Customization
### 💡 Change the Tray Icon Animation
- Place `.ico` files in the `animation` folder.
- The script will cycle through them while clicking.

### 🎨 Change the Default Tray Icons
Replace the icons in the `icons` folder:
- `lmousewait.ico` → Icon when waiting.
- `leftclick.ico` → Icon when idle after clicking.

## 🎯 Keybindings
| Key | Action |
|-----|--------|
| `F2` | Open Configuration Menu |
| `F3` | Start AutoClicker |
| `Esc` | Stop & Exit |

## 🛠️ Troubleshooting
- **No icons found?** Ensure `.ico` files are in the `animation` folder.
- **Not clicking?** Ensure valid numeric input in the configuration window.
- **Script doesn't start?** Run with **AutoHotkey installed**.

## 📄 License
This project is open-source under the **MIT License**.

---
💡 Created with **AutoHotkey** - Automate your workflow!
