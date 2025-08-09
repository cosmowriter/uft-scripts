' ----------------------------
' UFT VBScript: Login to GitHub
' Add the credentials to datatable before running the script
' ----------------------------

'Declare credentials from datatable
Dim githubUser, githubPass
githubUser = DataTable.Value("GitHubUser", dtGlobalSheet)
githubPass = DataTable.Value("GitHubPass", dtGlobalSheet)

'Declare obj BrowserPage
Set oBrowserPage = Browser("name:=Sign in.*").Page("title:=Sign in.*")


'----- Start execution steps -----

'Launch Chrome and navigate to login page
SystemUtil.Run "chrome.exe", "https://github.com/login", , , 3
If oBrowserPage.Exist() Then
    Reporter.ReportEvent micPass, "Launch website", "Browser launched successfully and page loaded."
Else
    Reporter.ReportEvent micFail, "Launch website", "Browser/Page does not exist."
End if

'Enter credentials
If oBrowserPage.WebEdit("html id:=login_field").Exist() Then
    oBrowserPage.WebEdit("html id:=login_field").Set githubUser
    oBrowserPage.WebEdit("html id:=password").SetSecure githubPass
    Reporter.ReportEvent micPass, "Enter credentials", "Credentials entered."
Else
    Reporter.ReportEvent micFail, "Enter credentials", "Username/Password field not found."
End If

'Click on Submit
oBrowserPage.WebButton("name:=commit").Click

'Verify login
If Browser("name:=GitHub").Page("title:=GitHub").WebButton("aria-label:=Open user navigation menu").Exist() Then
    Reporter.ReportEvent micPass, "Login", "User logged in to GitHub dashboard."
Else
    Reporter.ReportEvent micFail, "Login failed", "Log in failed with the mentioned credentials."
End If

'Capture screenshot
Desktop.CaptureBitmap "F:\UFT_Scripts\GitHubLogin.png"

'Logout
On Error Resume Next
Browser("name:=GitHub").Page("title:=GitHub").WebButton("aria-label:=Open user navigation menu").Click
Browser("name:=GitHub").Page("title:=GitHub").Link("href:=/logout").Click
Browser("name:=Logout").Page("title:=Logout").WebButton("value:='Sign out from all accounts'")
If Browser("name:=GitHub .*").Page("title:=GitHub .*").Exist() or Err.Number = 0 Then
    Reporter.ReportEvent micPass, "Logout", "User logged out of GitHub."
    Err.Clear
Else
    Reporter.ReportEvent micFail, "Logout failed", "Logout failed. "&Err.Description  
End If
On Error Goto 0