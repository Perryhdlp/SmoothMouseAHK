# Mouse Movement AutoHotkey Script

## Overview

This AutoHotkey script allows you to move the mouse cursor by a specific number of pixels when pressing arrow keys and modifier keys.

## Features

- Press arrow keys to move the mouse cursor by 5/10 pixels, 20 pixels, or 40 pixels.
- Press the same arrow key again to stop the movement.
- Use modifier keys (Ctrl, Shift) with arrow keys to adjust movement speed (40 pixels, 20 pixels).
- Press Modifier + Escape key to stop all movement entirely.
- Customizable beep sound when arrow keys are pressed.

## Installation and Usage

1. Download and install AutoHotkey from the official website: [https://www.autohotkey.com/download/](https://www.autohotkey.com/download/).
2. Copy and paste the entire script into a text editor like Notepad, Notepad++, or Sublime Text.
3. Save the file with a .ahk extension. For example: MouseMovement.ahk.
4. Double click on the saved file to run the script.
5. The script will run in the background, and you can use the arrow keys to move the mouse cursor as described above.
6. To stop the script, right-click on the green "H" icon in the taskbar and click "Exit".

## Customization

You can customize the following aspects of the script:

- Movement speeds: Change the values of the variables `speed_slow`, `speed_normal`, and `speed_fast`.
- Beep sound: Change the values of the variables `beep_frequency` and `beep_duration`.
- Modifier keys: Use "^" for Ctrl, "+" for Shift, "#" for Win, and "&" for Alt. For example, "^Left" means Ctrl+Left, "+Right" means Shift+Right, and so on.

## Acknowledgments

This script uses the DllCall function from the Windows API to move the mouse cursor.

## Compatibility

- This script is for Windows only. It will not work on Mac or Linux.
- This script requires AutoHotkey v1.1.33 or later.

## Troubleshooting

- If the beep sound doesn't play or is too loud, adjust the values of `beep_frequency` and `beep_duration`.
- If you encounter any issues or have questions, refer to the AutoHotkey documentation or community forums.

## License

This script is released under the [MIT License](LICENSE).
