# UFT Automation Script — GitHub Login (VBScript)
This repository contains a **Unified Functional Testing (UFT)** automation script written in **VBScript** to log in to GitHub using **descriptive programming** (static descriptive objects).

## Script Overview
- **File:** `LoginToGithub.vbs`
- **Purpose:** Automates logging into GitHub using UFT.
- **Approach:** Descriptive programming, no Object Repository required.
- **Browser:** Chrome (with UFT Web Add-in enabled)
- **Credentials:** Taken from UFT Data Table (recommended) or hardcoded for quick testing.

## Features
- Launches Chrome and navigates to the GitHub login page.
- Uses descriptive objects for Browser, Page, WebEdit, and WebButton.
- Handles:
  - Username input
  - Password input
  - Sign-in click
  - Capture screenshot
  - Logout click
- Includes basic login verification by checking for the profile avatar after login.
- Uses UFT `Reporter.ReportEvent` for logging test steps.

## How to Use
1. **Open UFT** and load the script.
2. In the **Global Data Table**:
   - Add a column: `GitHubUser`
   - Add a column: `GitHubPass`
   - Fill in your credentials  
3. Ensure:
   - UFT Web Add-in is enabled.
   - Browser automation extension is installed.
4. Run the script from UFT.

## Requirements
- **UFT Version:** 14.x or above
- **Browser:** Chrome (latest) or supported browser with UFT extension.
- **Add-ins:** Web Add-in enabled
- **Language:** VBScript

## Notes
- Hardcoding credentials in the script is **not recommended**.
- If GitHub prompts for 2FA, script will not handle OTP entry.
- For different browsers, modify `SystemUtil.Run` or `Browser().Navigate` accordingly.

## License
This project is open-source. Feel free to modify and use for learning or internal automation purposes.
