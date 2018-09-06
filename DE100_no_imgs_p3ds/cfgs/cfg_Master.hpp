/*
	File : 	cfg_Master.hpp
	Date:   30.01.2016	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
*/

#include "cfg_Achievement.hpp"
#include "cfg_Crimes.hpp"
#include "cfg_Debriefing.hpp"
#include "cfg_faq.hpp"
#include "cfg_Functions.hpp"
#include "cfg_gang_system.hpp"
#include "cfg_gather.hpp"
#include "cfg_Licenses.hpp"
#include "cfg_marker.hpp"
#include "cfg_Notifications.hpp"
#include "cfg_prof.hpp"
#include "cfg_RemoteExec.hpp"
#include "cfg_RscTitles.hpp"
#include "cfg_skins.hpp"
#include "cfg_Sounds.hpp"
#include "cfg_Vehicles.hpp"
#include "cfg_vItems.hpp"

#define true 1
#define false 0

/*
    Master settings for various features and functionality
*/
class Life_Settings {
    class gangHideouts {
        class baseHideout {
            displayName= "";
            size = 0;
            marker = "";
            type = "";
        };

        class altisNewsHidehout:baseHideout {
            type = "";

        };
    };

    idCard_reapply_price = 1500000;

    radiation_range = 25;
    radiation_suit = "U_B_HeliPilotCoveralls";
    heistPrepCost[] = {
        330000,
        560000
    };

	dialog_illegal_color[] = {1,0.2,0.2,1};
	dialog_illegal_color_hex = "#FF3333";
    
    houseInv_weightFactor = 0.5;
    illegal_arma_items[] = {
    	"arifle_Katiba_C_F",
    	"arifle_Katiba_F",
    	"arifle_Katiba_GL_F",
    	"arifle_Mk20_F",
    	"arifle_Mk20_plain_F",
    	"arifle_Mk20C_F",
    	"arifle_Mk20C_plain_F",
    	"arifle_MX_Black_F",
    	"arifle_MX_F",
    	"arifle_MX_GL_Black_F",
    	"arifle_MX_GL_F",
    	"arifle_MX_pointer_F",
    	"arifle_MX_SW_Black_F",
    	"arifle_MX_SW_F",
    	"arifle_MXC_ACO_F",
    	"arifle_MXC_Black_F",
    	"arifle_MXC_F",
    	"arifle_MXM_Black_F",
    	"arifle_MXM_F",
    	"arifle_TRG20_F",
    	"arifle_TRG21_F",
    	"H_CrewHelmetHeli_O",
    	"HandGrenade_Stone",
    	"HandGrenade",
    	"hgun_P07_F",
    	"hgun_P07_snds_F",
    	"hgun_pistol_heavy_01_F",
    	"hgun_Pistol_heavy_02_F",
    	"launch_B_Titan_F",
    	"LMG_Mk200_F",
    	"LMG_Zafir_F",
    	"MiniGrenade",
    	"muzzle_snds_H",
    	"Rangefinder",
    	"SatchelCharge_Remote_Mag",
    	"SMG_01_F",
    	"SMG_02_F",
    	"srifle_DMR_01_F",
    	"srifle_DMR_03_F",
    	"srifle_DMR_03_khaki_F",
    	"srifle_DMR_03_multicam_F",
    	"srifle_DMR_03_tan_F",
    	"srifle_DMR_03_woodland_F",
    	"srifle_DMR_06_camo_F",
    	"srifle_DMR_06_olive_F",
    	"srifle_EBR_F",
    	"Titan_AA",
        "1Rnd_SmokePurple_Grenade_shell",
        "arifle_AK12_F",
        "arifle_AK12_GL_F",
        "arifle_AKM_F",
        "arifle_AKS_F",
        "arifle_ARX_blk_F",
        "arifle_ARX_ghex_F",
        "arifle_ARX_hex_F",
        "arifle_CTAR_blk_F",
        "arifle_CTAR_ghex_F",
        "arifle_CTAR_GL_blk_F",
        "arifle_CTAR_GL_ghex_F",
        "arifle_CTAR_GL_hex_F",
        "arifle_CTAR_hex_F",
        "arifle_CTARS_blk_F",
        "arifle_CTARS_ghex_F",
        "arifle_CTARS_hex_F",
        "arifle_MX_SW_khk_F",
        "arifle_SPAR_01_blk_F",
        "arifle_SPAR_01_GL_blk_F",
        "arifle_SPAR_01_GL_khk_F",
        "arifle_SPAR_01_GL_snd_F",
        "arifle_SPAR_01_khk_F",
        "arifle_SPAR_01_snd_F",
        "arifle_SPAR_02_blk_F",
        "arifle_SPAR_02_khk_F",
        "arifle_SPAR_02_snd_F",
        "arifle_SPAR_03_blk_F",
        "arifle_SPAR_03_khk_F",
        "arifle_SPAR_03_snd_F",
        "muzzle_snds_B_khk_F",
        "muzzle_snds_B_snd_F",
        "muzzle_snds_B",
        "muzzle_snds_H_khk_F",
        "muzzle_snds_H_snd_F",
        "SmokeShellPurple",
        "srifle_DMR_07_blk_F",
        "srifle_DMR_07_ghex_F",
        "srifle_DMR_07_hex_F",
        "U_B_GEN_Commander_F",
        "V_PlateCarrier2_blk"
    };

    droped_items[] = {
        "Land_BottlePlastic_V1_F",
        "Land_TacticalBacon_F",
        "Land_Can_V3_F",
        "Land_CanisterFuel_F",
        "Land_FoodContainer_01_White_F",
        "Land_Money_F",
        "Land_MetalBarrel_F",
        "Land_FirstAidKit_01_open_F"
    };

    //Wustest du,...?
    did_you_know[] = {
        "dass Du mit der Taste 5 die Größe des HUDs verändern kannst?",
        "dass Du nur Spielernamen von Spielern siehst, die Dir den Perso gezeigt haben oder in Deiner Gang sind?",
        "dass Du über den Einstellungsknopf auf der Karte, Marker verändern oder ausblenden kannst?",
        "dass Du im Z-Inv mit Doppelklick auf ein Item eine ""Alles"" Funktion hast?",
        "dass illegale Items in den meisten Menüs rot angezeigt werden?",
        "dass Du mit der Taste 3 Ohrstöpsel einsetzen kannst?",
        "dass es rentabler ist, ein Fahrzeug durch RP zuverkaufen, als über einen ChopShop?",
        "dass nur legale Items in Fahrzeugen gespeichert werden?",
        "dass Altis Dollar gegen echtes Geld zu kaufen verboten ist?<br/>Wenn dir jmd. so etwas anbietet, melde diesen Spieler bitte im Support. Dafür erhäst du auch ein kleines Dankeschön!"
    };

    /* Vehicle Purchase Prices */
    vehicle_purchase_multiplier_CIVILIAN = 1; //Civilian Vehicle Buy Price = Config_Vehicle price * multiplier
    vehicle_purchase_multiplier_COP = .2; //Cop Vehicle Buy Price = Config_Vehicle price * multiplier
    vehicle_purchase_multiplier_THR = .2; //Medic Vehicle Buy Price = Config_Vehicle price * multiplier

    /* Vehicle Rental Prices */
    vehicle_rental_multiplier_CIVILIAN = .80; //Civilian Vehicle Rental Price = Config_Vehicle price * multiplier
    vehicle_rental_multiplier_COP = .3; //Cop Vehicle Rental Price = Config_Vehicle price * multiplier
    vehicle_rental_multiplier_THR = .55; //Medic Vehicle Rental Price = Config_Vehicle price * multiplier

    /* Vehicle Purchase Prices */
    vehicle_sell_multiplier = .5; //Civilian Vehicle Buy Price = Config_Vehicle price * multiplier
    vehicle_chop_multiplier = .15; //Civilian Vehicle Buy Price = Config_Vehicle price * multiplier
    vehicle_chop_bb_multiplier = .35; //Civilian Vehicle Buy Price = Config_Vehicle price * multiplier

    vehicle_garage_multiplier_CIVILIAN = .03; //Civilian Vehicle Rental Price = Config_Vehicle price * multiplier
    vehicle_garage_multiplier_COP = .03; //Cop Vehicle Rental Price = Config_Vehicle price * multiplier
    vehicle_garage_multiplier_THR = .01;

    vehicle_depo_multiplier_CIVILIAN = .25;
    vehicle_depo_multiplier_COP = .25;
    vehicle_depo_multiplier_THR = .15;

    vehicle_fuel_trucks[] = {"C_Van_01_fuel_F","B_Truck_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F"}; 

    lpick_sys_range = 90;//Der Winkel, in dem der Lpick gedreht werden kann
    lpick_sys_key = 18;//Key um Schloss zu drehen
    lpick_sys_tolerance = 5;//Standard Toleranz
    lpick_sys_perc = 0.15;//Standard Perc
    lpick_sys_fray[] = {3,30};//Abnutzungs Array 0: Wert, welcher immer abgenutzt wird; 1: random Zahlen range

    allowed_dbChars = "abcdefghijklmnopqrstuvwxyzßöäü1234567890?![()]-_ .,;:*+=/\|<>#^";

    badWords_filter[] = {
        "  ",
        "kanacke",
        "gay",
        "hitler",
        "nazi",
        "sex",
        "penis",
        "schlampe",
        "cock",
        "dick",
        "porn",
        "hure",
        "huso",
        "totti",
        "derradierer",
        "jude",
        "auschwitz",
        "ficker",
        "spasti",
        "pimmelberger",
        "fotze",
        "pisser",
        "flüchtling",
        "behindert",
        "türke",
        "idiot",
        "behämmert",
        "anal",
        "helper",
        "admin",
        "batman",
        "lahe",
        "mistgeburt",
        "assi",
        "hurensohn",
        "lusche",
        "lappen",
        "bayer",
        "peace",
        "mudda",
        "mutter",
        "vadder",
        "arsch",
        "alter",
        "ballermann",
        "alde",
        "arschloch",
        "lucian",
        "puta",
        "amk",
        "troll",
        "nigger",
        "nigga",
        "allahu",
        "akbar",
        "amonakuim"
    };
};