/*
*    class:
*        variable = Variable Name
*        displayName = License Name
*        price = License Price
*        illegal = Illegal License
*        side = side indicator
*/
//By Patrick "Lucian" Schmidt
class Licenses {

    /*
    *
    * Base Classes
    *
    */

    class blueprint {
        variable = "blueprint";
        displayName = "STR_Default";
        price = 500;
        showInFAQ = false;
    };

    class civ_base : blueprint {
        side = "civ";
    };

    class civ_legal_base : civ_base {
        illegal = false;
    };

    class civ_illegal_base : civ_base {
        illegal = true;
    };

    class cop_base : blueprint {
        side = "cop";
        illegal = false;
    };

    class med_base : blueprint {
        side = "thr";
        illegal = false;
    };

    /*
    *
    * Civilian Licenses
    *
    */

    class driver : civ_legal_base {
        variable = "driver";
        displayName = "STR_License_Driver";
        price = 15000;
        showInFAQ = true;
    };

    class air : civ_legal_base {
        variable = "air";
        displayName = "STR_License_Pilot";
        price = 100000;
        showInFAQ = true;
    };

    class boat : civ_legal_base {
        variable = "boat";
        displayName = "STR_License_Boat";
        price = 15000;
        showInFAQ = true;
    };

    class truck : civ_legal_base {
        variable = "truck";
        displayName = "STR_License_Truck";
        price = 70000;
        showInFAQ = true;
    };

    class dive : civ_legal_base {
        variable = "dive";
        displayName = "STR_License_Diving";
        price = 8000;
        showInFAQ = true;
    };

    class gun : civ_legal_base {
        variable = "gun";
        displayName = "STR_License_Firearm";
        price = 80000;
        showInFAQ = true;
    };

    class home : civ_legal_base {
        variable = "home";
        displayName = "STR_License_Home";
        price = 2000000;
        showInFAQ = true;
    };

    class oil : civ_legal_base {
        variable = "oil";
        displayName = "STR_License_Oil";
        price = 60000;
        showInFAQ = true;
    };

    class diamond : civ_legal_base {
        variable = "diamond";
        displayName = "STR_License_Diamond";
        price = 80000;
        showInFAQ = true;
    };

    class copper : civ_legal_base {
        variable = "copper";
        displayName = "STR_License_Copper";
        price = 40000;
        showInFAQ = true;
    };

    class iron : civ_legal_base {
        variable = "iron";
        displayName = "STR_License_Iron";
        price = 49500;
        showInFAQ = true;
    };

    class sand : civ_legal_base {
        variable = "sand";
        displayName = "STR_License_Sand";
        price = 48500;
        showInFAQ = true;
    };

    class salt : civ_legal_base {
        variable = "salt";
        displayName = "STR_License_Salt";
        price = 48000;
        showInFAQ = true;
    };

    class cement : civ_legal_base {
        variable = "cement";
        displayName = "STR_License_Cement";
        price = 29500;
        showInFAQ = true;
    };

    class coal : civ_legal_base {
        variable = "coal";
        displayName = "STR_License_Coal";
        price = 60000;
        showInFAQ = true;
    };

    class silber : civ_legal_base {
        variable = "silber";
        displayName = "STR_License_Silver";
        price = 68000;
        showInFAQ = true;
    };

    class gas : civ_legal_base {
        variable = "gas";
        displayName = "STR_License_Gas";
        price = 49000;
        showInFAQ = true;
    };

    class gold : civ_legal_base {
        variable = "gold";
        displayName = "STR_License_Gold";
        price = 100000;
        showInFAQ = true;
    };

    class schmiede : civ_legal_base {
        variable = "schmiede";
        displayName = "STR_License_Schmiede";
        price = 700000;
        showInFAQ = true;
    };

    class stahlschmiede : civ_legal_base {
        variable = "stahlschmiede";
        displayName = "STR_License_Stahlschmiede";
        price = 400000;
        showInFAQ = true;
    };

    class betonmischer : civ_legal_base {
        variable = "betonmischer";
        displayName = "STR_License_Betonmischer";
        price = 69000;
        showInFAQ = true;
    };


    class wine : civ_legal_base {
        variable = "wine";
        displayName = "STR_License_Wine";
        price = 70000;
        showInFAQ = true;
    };

    class battery : civ_legal_base {
        variable = "battery";
        displayName = "STR_License_battery";
        showInFAQ = true;
        price = 92000;
    };

    class tomatoP : civ_legal_base {
        variable = "tomatoP";
        displayName = "STR_License_tomatoP";
        price = 48000;
        showInFAQ = true;
    };

    class sugar : civ_legal_base {
        variable = "sugar";
        displayName = "STR_License_sugar";
        price = 103000;
        showInFAQ = true;
    };

    class fSalad : civ_legal_base {
        variable = "fSalad";
        displayName = "STR_License_fSalad";
        price = 80000;
        showInFAQ = true;
    };

    class plastic : civ_legal_base {
        variable = "plastic";
        displayName = "STR_License_plastic";
        price = 80000;
        showInFAQ = true;
    };

    class cBoard : civ_legal_base {
        variable = "cBoard";
        displayName = "STR_License_cBoard";
        price = 120000;
        showInFAQ = true;
    };

    class smartPhone : civ_legal_base {
        variable = "smartPhone";
        displayName = "STR_License_smartPhone";
        price = 500000;
        showInFAQ = true;
    };

    class ketchup : civ_legal_base {
        variable = "ketchup";
        displayName = "STR_License_ketchup";
        price = 55000;
        showInFAQ = true;
    };


    class blackmarket : civ_illegal_base {
        variable = "blackmarket";
        displayName = "STR_License_Blackmarket";
        price = 15000000;
        showInFAQ = true;
    };

    class rebel : civ_illegal_base {
        variable = "rebel";
        displayName = "STR_License_Rebel";
        price = 700000;
        showInFAQ = true;
    };

    class heroin : civ_illegal_base {
        variable = "heroin";
        displayName = "STR_License_Heroin";
        price = 120000;
        showInFAQ = true;
    };

    class marijuana : civ_illegal_base {
        variable = "marijuana";
        displayName = "STR_License_Marijuana";
        price = 120000;
        showInFAQ = true;
    };

    class coke : civ_illegal_base {
        variable = "coke";
        displayName = "STR_License_Cocaine";
        price = 130000;
        showInFAQ = true;
    };

    class methn : civ_illegal_base {
        variable = "methn";
        displayName = "STR_License_MethN";
        price = 130000;
        showInFAQ = true;
    };

    class methb : civ_illegal_base {
        variable = "methb";
        displayName = "STR_License_Bluesky";
        price = 130000;
        showInFAQ = true;
    };

    class moonShine : civ_illegal_base {
        variable = "moonShine";
        displayName = "STR_License_moonShine";
        price = 110000;
        showInFAQ = true;
    };

    class gunPowder : civ_illegal_base {
        variable = "gunPowder";
        displayName = "STR_License_gunPowder";
        price = 100000;
        showInFAQ = true;
    };

    class c4 : civ_illegal_base {
        variable = "c4";
        displayName = "STR_License_c4";
        price = 600000;
        showInFAQ = true;
    };


    /*
    *
    * Cop Licenses
    *
    */

    class cair : cop_base {
        variable = "cair";
        displayName = "STR_License_Pilot";
        price = 18000;
    };

    class cg : cop_base {
        variable = "cg";
        displayName = "STR_License_CG";
        price = 8000;
    };

    /*
    *
    * Med Licenses
    *
    */

    class mair : med_base {
        variable = "air";
        displayName = "STR_License_Pilot";
        price = 15000;
    };
};
