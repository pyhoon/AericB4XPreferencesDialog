B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=9.85
@EndOfDesignText@
#Region Shared Files
#CustomBuildAction: folders ready, %WINDIR%\System32\Robocopy.exe,"..\..\Shared Files" "..\Files"
'Ctrl + click to sync files: ide://run?file=%WINDIR%\System32\Robocopy.exe&args=..\..\Shared+Files&args=..\Files&FilesSync=True
#End Region

'Ctrl + click to export as zip: ide://run?File=%B4X%\Zipper.jar&Args=Project.zip

Sub Class_Globals
	Private Root As B4XView
	Private xui As XUI
	Private PrefDialog As PreferencesDialog
End Sub

Public Sub Initialize
'	B4XPages.GetManager.LogEvents = True
End Sub

Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	Root.LoadLayout("1")
	PrefDialog.Initialize(Root, "", 400dip, 200dip)
	PrefDialog.Theme = PrefDialog.THEME_LIGHT
	PrefDialog.Dialog.OverlayColor = xui.Color_ARGB(128, 0, 10, 40)
	PrefDialog.Title = "Demo"
	PrefDialog.AddDateItem("Date", "Date")
	PrefDialog.AddBooleanItem("Active", "Active")
End Sub

Private Sub B4XPage_Resize(Width As Int, Height As Int)
	If PrefDialog.IsInitialized And PrefDialog.Dialog.Visible Then PrefDialog.Dialog.Resize(Width, Height)
End Sub

Private Sub Button1_Click
	Dim SenderFilter As Object = PrefDialog.ShowDialog2(CreateMap(), "OK", "CANCEL")
	Wait For (SenderFilter) Complete (Result As Int)
	Log(Result)
End Sub