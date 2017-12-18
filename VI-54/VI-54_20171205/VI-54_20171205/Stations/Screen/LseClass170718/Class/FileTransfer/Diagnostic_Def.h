
// Definition der ID der einzelenen Stationen.
#define Diagnostic_ID_HMI       10000
#define Diagnostic_ID_PLC1      20000
#define Diagnostic_ID_PLC2      30000

// Definition der Übergeordneten Ordner  ( C:\.....  oder E:\...... )
#define Diagnostic_FolderPath                 "Export\Diagnostic"
#define Diagnostic_FolderPath_MAX_Folder      10

// Definition des LogFile Namens
#define Diagnostic_LogFile                    "Diagnostic-log.txt"

// Definition der FolderNamen der Funktionen
#define Diagnostic_FktName_ProjectInfo        "ProjectInfo"
#define Diagnostic_FktName_SystemInfo         "SystemInfo"
#define Diagnostic_FktName_SRAMInfo           "SRAMInfo"
#define Diagnostic_FktName_FileFolderTransfer "UserFileFolder"

// Definition der Foldernamen der Stationen
#define Diagnostic_StatName_HMI               "HMI"
#define Diagnostic_StatName_PLC1              "PLC1"
#define Diagnostic_StatName_PLC2              "PLC2"

// Priorität für die Diagnose Funktionen mit der geschickt wird.
#define Diagnostic_Prio         9


// Definition der ID's für das HMI
#define Diagnostic_ID_ProjectInfo_HMI            (Diagnostic_ID_HMI +  1)
#define Diagnostic_ID_SystemInfo_HMI             (Diagnostic_ID_HMI +  2)
#define Diagnostic_ID_SRAMInfo_HMI               (Diagnostic_ID_HMI +  3)
#define Diagnostic_ID_FileTransfer_HMI           (Diagnostic_ID_HMI +  4)

// Definition der ID's für die PLC 1
#define Diagnostic_ID_ProjectInfo_PLC1           (Diagnostic_ID_PLC1 +  1)
#define Diagnostic_ID_SystemInfo_PLC1            (Diagnostic_ID_PLC1 +  2)
#define Diagnostic_ID_SRAMInfo_PLC1              (Diagnostic_ID_PLC1 +  3)
#define Diagnostic_ID_FileTransfer_PLC1          (Diagnostic_ID_PLC1 +  4)


// Definition der ID's für die PLC 2
#define Diagnostic_ID_ProjectInfo_PLC2           (Diagnostic_ID_PLC2 +  1)
#define Diagnostic_ID_SystemInfo_PLC2            (Diagnostic_ID_PLC2 +  2)
#define Diagnostic_ID_SRAMInfo_PLC2              (Diagnostic_ID_PLC2 +  3)
#define Diagnostic_ID_FileTransfer_PLC2          (Diagnostic_ID_PLC2 +  4)



// Definition der Länge von File oder Folder Strings
#define Diagnostic_MAX_FileFolderString     500




// Optionale Commandos der Diagnose
#define  Diagnostic_OptCMD_StartWorkOnPLC     1
#define  Diagnostic_OptCMD_ResponseSuccesData 2
#define  Diagnostic_OptCMD_ResponseError      3



// Fehler Nummern ( DiagnosticErrorNummer )
#define DENR_Offset  1000
#define DENR_NoError                 ( DENR_Offset +  0 )
#define DENR_PLC_DataIncorrect       ( DENR_Offset +  1 )
#define DENR_PLC_SendError           ( DENR_Offset +  2 )
#define DENR_HMI_ErrorPLC            ( DENR_Offset +  3 )


// Fehler Codes  ( DiagnosticErrorCode )
#define DECD_Offset  1000
#define DECD_NoError                 ( DECD_Offset +  0 )
#define DECD_DataSize                ( DECD_Offset +  1 )
#define DECD_DataPointer             ( DECD_Offset +  2 )
#define DECD_JobID                   ( DECD_Offset +  3 )

// Definitionen der Filenamen
#define Diagnostic_ProjectInfoName      "ProjectInfo.txt"
#define Diagnostic_SystemInfoName       "SystemInfo.txt"
#define Diagnostic_SRAMInfoFileName     "SRAMInfo.dat"
#define Diagnostic_SRAMInfoTmpDPNE      "C:\SramInfo.dat"
