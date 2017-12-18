

// Eventtypen
//----------------------------------------------------------------------------------------------------------------------------
#define   Event_DateChange                16#100      // Event für: Variable vom Typ Datum
#define   Event_TimeChange                16#101      // Event für: Variable vom Typ Zeit
#define   Event_ValueChange               16#102      // Event für: Variable vom Typ Numeric
#define   Event_MenuChange                16#103      // Event für: Variable vom Typ Menue

#define   Event_SystemCat1                16#110      
#define   Event_SystemCat2                16#111      
#define   Event_SystemCat3                16#112      
#define   Event_SystemCat4                16#113      

#define   Event_SwitchOn                  16#200      // Event für: Steuerung wurde eingeschaltet
#define   Event_SwitchOff                 16#201      // Event für: Steuerung wurde ausgeschaltet

#define   Event_OPChange                  16#210      // Event für das Umschalten der Betriebsart

#define   Event_UserLogin                 16#220      // Event für: Benutzer hat sich eingeloggt
#define   Event_UserLogout                16#221      // Event für: Benutzer hat sich ausgeloggt

#define   Event_UserEvent                 16#260      // Event für: Benutzer-Event

#define   Event_Alarm                     16#FFFF     // Alarmmeldung

#define   Event_EventEntry                16#270      


// Eigenschaften des UDCs
//----------------------------------------------------------------------------------------------------------------------------
#define   Event_UDCVersion                1           // Version des aktuellen UDCs
#define   Event_VariableNo                5           // Anzahl der Variablen, die dem UDC mitgegeben werden
#define   Event_ColorNo                   12          // Anzahl der Farben, die dem UDC mitgegeben werden
#define   Event_TextschemeNo              7           // Anzahl der Textschemen, die dem UDC mitgegeben werden


// Farben für Eventzeilen
//----------------------------------------------------------------------------------------------------------------------------
#define   Event_ColorActiveLine           WHITE     // Farbe für eine ausgewählte Zeile
#define   Event_ColorSwitchOnOff          GREEN     // Farbe für das Event SwitchOnOff
#define   Event_ColorAlarm                RED       // Farbe für einen Alarm, sollte dieser im LSE nicht definiert sein
#define   Event_ColorDateTimeChange       BLUE      // Farbe für das Event einer Datums- bzw. Zeitänderung
#define   Event_ColorValueChange          BLUE      // Farbe für das Event einer Wertänderung
#define   Event_ColorMenuChange           BLUE      // Farbe für das Event einer Menüänderung
#define   Event_ColorUser                 BLACK     // Farbe für das Anmelden / Abmelden eines Benutzers
#define   Event_ColorToolcat              BLACK     // Farbe für das Laden eines Rezeptes
#define   Event_ColorMachineConfig        BLACK     // Farbe für das Laden/Speichern einer Maschinen-Konfiguration
#define   Event_ColorHeating              BLACK     // Farbe für das Einschalten / Ausschalten der Heizung
#define   Event_ColorHydraulik            BLACK     // Farbe für das Einschalten / Ausschalten der Hydraulik
#define   Event_ColorUserEvent            BLACK     // Farbe für das Benutzer-Event
#define   Event_ColorOPChange             BLACK     // Farbe für das Umschalten vom Betriebsmodus
#define   Event_ColorBgActiveLine         INVISIBLE // Hintergrundfarbe für eine ausgewählte Zeile

// Konfigurationen der Zahlen
//----------------------------------------------------------------------------------------------------------------------------
#define   Event_ConfigAlarmNo             16#105    // Einstellung für Wandeln Alarmnummer zu String => 5 Zeichen, mit Vornullen
#define   Event_ConfigParam1              16#800    // Einstellung für Wandeln Param1 zu String => Zeichenlänge automatisch bestimmen
#define   Event_ConfigParam2              16#3      // Einstellung für Wandeln Param2 zu String => 1 Zeichen


// Eigenschaften für die Texte
//------------------------------------------------------
#define   Event_AttrStandard	            T_SOLID OR T_COPY OR T_PROP
#define   Event_AttrTime		              T_CENTERBOUND OR T_MIDBOUND
#define   Event_AttrParam1                T_CENTERBOUND OR T_MIDBOUND
#define   Event_AttrAlarmNo               T_CENTERBOUND OR T_MIDBOUND
#define   Event_AttrParam2                T_CENTERBOUND OR T_MIDBOUND
#define   Event_AttrText	                T_LEFTBOUND OR T_MIDBOUND
#define   Event_TextOffset	              0


// Einstellungen zum Bestimmen der Texte aus LSE
//----------------------------------------------------------------------------------------------------------------------------
#define   Event_Textlist                  "EventJournal"      //****DELETE****

#define   Event_TitleTextEventTime        0
#define   Event_TitleTextParam1           1
#define   Event_TitleTextAlarmNo          2
#define   Event_TitleTextParam2           3                   //Benutzerlevel
#define   Event_TitleTextDescription      4

#define   Event_TextSwitchOn              0
#define   Event_TextSwitchOff             1

#define   Event_TextOPModeInit            0
#define   Event_TextOPModeStop            2
#define   Event_TextOPModeManual          4
#define   Event_TextOPModeSetup           3
#define   Event_TextOPModeSemiAuto        5
#define   Event_TextOPModeAutomatic       6

#define   Event_TextLogin                 0
#define   Event_TextLogout                1


// Defines für die Strings
//----------------------------------------------------------------------------------------------------------------------------
#define   Event_CarriageReturn            13                                      // ASCII CR
#define   Event_LineFeed                  10                                      // ASCII LF
#define   Event_Comma                     44                                      // ASCII Beistrich
#define   Event_Semikolon                 59                                      // ASCII Semikolon 
#define   Event_Blank                     32                                      // ASCII Leerzeichen
#define   Event_BufferLength              10000                                   // Maximale Länge des Buffers
#define   Event_FreeBufferSpace           300                                     // Freigelassener Speicher (Absicherung)
#define   Event_TempBufferLength          255                                     // Maximale Länge des temporären Buffers
#define   Event_NoAlarmInfo               "Text is not defined in LSE"            // Text, wenn keine Beschreibung gefunden wird


// Eigenschaften von Datum und Zeit
//----------------------------------------------------------------------------------------------------------------------------
#define   Event_DatePlaceHolder           "- -.- -.- -"           // Platzhalter für Datum
#define   Event_TimePlaceHolder           "- -:- -:- -"           // Platzhalter für Zeit
#define   Event_DateFormat                SIZE_DDMMYY             // Format des Datums in der Datei
#define   Event_TimeFormat                SIZE_HHMMSS             // Format der Zeit in der Datei


// Eigenschaften der Datei
//----------------------------------------------------------------------------------------------------------------------------
#define   Event_DefaultPath               "Export\EventJournal"   // Pfad des Ordners, wohin das EventJournal exportiert wird
#define   Event_DefaultPath_MAX_Folder    10                      // Maximale Anzahl an Ordnern die der Exportpfad enthalten darf
#define   Event_FilePreFix                "\EventJournal"         // Präfix für Dateiname der Exportierten Events
#define   Event_FileType                  ".txt"                  // Typ der Datei
#define   Event_MaxFilenameLength         80                      // Länge der EventJournal Datei
#define   Event_MaxInterruptTime          50 ms                   // Maximale Zeit, in der der Buffer gefüllt werden kann


// Zustände beim Exportieren der Events
//----------------------------------------------------------------------------------------------------------------------------
#define   Event_AlarmActive               "[active] "              // Zustand des Alarmes als Präfix beim Exportieren der EventJournal
#define   Event_AlarmInactive             "[inactive] "            // Zustand des Alarmes als Präfix beim Exportieren der EventJournal
#define   Event_WindowNr                  10050                    // Fenster-Nummer

