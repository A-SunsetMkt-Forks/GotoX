'������������ GotoX �Ŀ�ݷ�ʽ��

Set fso = WScript.CreateObject("Scripting.FileSystemObject")
Set objShell = WScript.CreateObject("WScript.Shell")

linkFile = objShell.SpecialFolders("Desktop") & "\GotoX.lnk"
isCreateShortcut = True

if fso.fileExists(linkFile) then
    if MsgBox("��ݷ�ʽ�Ѿ����ڣ��Ƿ񸲸ǣ�", _
              vbYesNo + vbExclamation, "��ȷ��") = vbNo then
        isCreateShortcut = False
    End if
End if

if isCreateShortcut then
    Set link = objShell.CreateShortcut(linkFile)
    jsDirectory = fso.GetFile(WScript.ScriptFullName).ParentFolder.Path
    link.TargetPath = jsDirectory & "\python\python.exe"
    link.Arguments = "-E -s ..\launcher\start.py"
    link.WindowStyle = 7
    link.IconLocation = jsDirectory & "\GotoX.ico"
    link.Description = "GotoX"
    link.WorkingDirectory = jsDirectory & "\python"
    link.Save()
End if
