; Script gerado pelo Inno Setup para o SUAP-CB

[Setup]
AppName=SUAP-CB
AppVersion={#AppVersion}
AppPublisher=IFMT - Instituto Federal de Mato Grosso
AppSupportURL=https://ifmt.edu.br
AppUpdatesURL=https://ifmt.edu.br
DefaultDirName={autopf}\SUAP-CB
DefaultGroupName=SUAP-CB
OutputDir=dist
OutputBaseFilename=suap-cb-{#AppVersion}-Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
UninstallDisplayIcon={app}\suapcb.exe
LicenseFile=LICENSE
PrivilegesRequired=lowest

[Languages]
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "dist\suapcb.exe"; DestDir: "{app}"; Flags: ignoreversion
; Source: "LICENSE"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\SUAP-CB"; Filename: "{app}\suapcb.exe"
Name: "{group}\{cm:UninstallProgram,SUAP-CB}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\SUAP-CB"; Filename: "{app}\suapcb.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\suapcb.exe"; Description: "{cm:LaunchProgram,SUAP-CB}"; Flags: nowait postinstall skipifsilent
