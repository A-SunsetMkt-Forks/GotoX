'���� GotoX ϵͳ���̸������ߡ�

Set fso = CreateObject("Scripting.FileSystemObject")
Set objShell = CreateObject("WScript.Shell")

objShell.CurrentDirectory = objShell.CurrentDirectory + "\python"

If fso.fileExists("install_dll.bat") Then
    Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
    Set colOperatingSystems = objWMIService.ExecQuery("Select * from Win32_OperatingSystem")
    For Each objOperatingSystem in colOperatingSystems
        if StrComp(objOperatingSystem.Version, "6.2") = -1 Then
            if MsgBox("�� Windows 7 ���״������谲װ dll �ļ���" & vbLf & vbLf & _
                      "�Ѽ�⵽��װ�ű����Ƿ����У�", _
                      vbYesNo + vbExclamation, "��ȷ��") = vbYes then
                objShell.Run "install_dll.bat",,True
            End if
        End If
    Next
End If

objShell.Run "python.exe -E -s ..\launcher\start.py",,False
