B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=9.801
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: True
#End Region

Sub Process_Globals
	Dim stop As Boolean
End Sub

Sub Globals

	Private bar1 As SeekBar
	Private bar2 As SeekBar
	Private stopB As Button
	Private start As Button
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("motor")		' load the layout

End Sub

Sub send
	Dim out1(1), out2(1), i=1 As Byte
	Dim str1,str2 As String
	
	Do While i=1
	out1(0)=bar1.value
	out2(0)=bar2.value
	str1=BytesToString(out1,0,1,"UTF-8")
	str2=BytesToString(out2,0,1,"UTF-8")

	Starter.Manager.SendMessage(str1)
	Starter.Manager.SendMessage(str2)
	Sleep(200)
	If stop Then Exit
	Loop
End Sub

Public Sub UpdateState
	stopB.Enabled = Starter.Manager.ConnectionState
	start.Enabled = Starter.Manager.ConnectionState
End Sub

Sub stopB_click
	stop=True
End Sub

Sub start_click
	stop=False
	send
End Sub

Public Sub NewMessage (msg() As Byte)

End Sub

Sub Activity_Resume
	'send
End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub
