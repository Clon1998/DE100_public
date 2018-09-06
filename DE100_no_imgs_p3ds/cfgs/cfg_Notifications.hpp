//By Patrick "Lucian" Schmidt
class CfgNotifications
{
	class ThrRequestMed
	{
		title = "THR - Zentrale";
		iconPicture = "A3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa";
		description = "%1";
		duration = 5;
		priority = 7;
	};

	class ThrRequestCar
	{
		title = "THR - Zentrale";
		iconPicture = "A3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa";
		description = "%1";
		duration = 5;
		priority = 7;
	};
	
	class DeliveryAssigned
	{
		title = "Liefermission akzeptiert";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		description = "%1";
		duration = 10;
		priority = 7;
	};
	
	class DeliveryFailed
	{
		title = "Liefermission Fehlgeschlagen";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskiconfailed_ca.paa";
		description = "%1";
		duration = 7;
		priority = 7;
	};
	
	class DeliverySucceeded
	{
		title = "Liefermission erfolgreich beendet";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcondone_ca.paa";
		description = "%1";
		duration = 6;
		priority = 6;
	};
	
	class TextMessage
	{
		title = "Neue Textnachrichten";
		iconPicture = "images\icons\ico_messagenew.paa";
		description = "%1";
		duration = 10;
		priority = 6;
	};
	
	class PoliceDispatch
	{
		title = "110 - Notrufzentrale";
		iconPicture = "images\icons\ico_messagepolice.paa";
		description = "%1";
		duration = 10;
		priority = 6;
	};
	
	class AdminDispatch
	{
		title = "Admin Naricht";
		iconPicture = "images\icons\ico_messageadmin.paa";
		description = "%1";
		duration = 10;
		priority = 6;
	};
	
	class AdminMessage
	{
		title = "Admin Naricht";
		iconPicture = "images\icons\ico_messageadmin.paa";
		description = "%1";
		duration = 10;
		priority = 5;
	};
};