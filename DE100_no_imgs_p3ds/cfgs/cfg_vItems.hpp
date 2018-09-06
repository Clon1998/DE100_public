/*
*    Format:
*        level: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*            3: Custom exit message (Optional)
*/
//By Patrick "Lucian" Schmidt
class VirtualShops {
    //Virtual Shops
    class market {
        name = "Altis Markt";
        side[] = {"civ","cop","thr"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "battery", "pickaxe", "fuelFull", "peach","grapes","fSalad","tomato","sugar","ketchup", "boltcutter", "storagesmall", "storagebig", "storagegang"};
    };

    class gasstation {
        name = "Lars Tanke";
        side[] = {"civ","cop","thr"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "tbacon", "redgull", "battery", "fuelFull"};
    };

    class nobody {
        name = "Nobody Markt";
        side[] = {"civ"};
        license = "nobody";
        level[] = { "", "", -1, "" };
        items[] = { "zipties","waterBottle", "rabbit", "apple", "redgull", "tbacon", "battery", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "blastingcharge", "bag","Graffiti1","Graffiti2","Graffiti3","Graffiti4" };
    };

    class rebel {
        name = "Rebel Markt";
        side[] = {"civ"};
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = { "smokeWall","zipties","waterBottle", "rabbit", "apple", "redgull", "tbacon", "battery", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "blastingcharge", "bag" ,"epinephrine","morphine","gpstracker","Graffiti1","Graffiti2","Graffiti3","Graffiti4"};
    };

    class gang {
        name = "Gang Markt";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "battery", "fuelFull", "peach", "boltcutter", "blastingcharge","gpstracker" };
    };

    class wongs {
        name = "Wong's Markt";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "turtle_soup", "turtle_raw" };
    };

    class coffee {
        name = "Stratis Kaffeebar";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "coffee", "donuts" };
    };

    class drugdealer {
        name = "Drogendealer";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "cocaine_processed", "heroin_processed", "marijuana", "bluesky", "meth_processed" };
    };

    class oil {
        name = "Ölhändler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "oil_processed", "pickaxe", "fuelFull" };
    };

    class fishmarket {
        name = "Altis Fisch Markt";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {  "salema", "ornate", "mackerel", "tuna",  "mullet", "catshark" };
    };

    class glass {
        name = "Altis Glasshändler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "glass" };
    };

    class iron  {
        name = "Altis Eisenhändler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "iron_refined" };
    };

    class diamond {
        name = "Altis Diamantenhändler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "diamond_uncut", "diamond_cut" };
    };

    class salt {
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "salt_refined" };
    };

    class cement {
        name = "Altis Zementhändler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "cement" };
    };

    class goldbar {
        name = "Goldbarrenhändler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "goldbar" };
    };

    class cop {
        name = "Polizei Item Shop";
        side[] = {"cop"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "smokeWall","speedtrap","donuts","coffee","spikeStrip","waterBottle","rabbit","apple","redgull","fuelFull","battery","storagecop","epinephrine","morphine","gpstracker","lockpick"};
    };

    class gold1 {
        name = "Altis Goldhändler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "gold_refined"};
    };

    class silber1 {
        name = "Altis Silberhändler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "silver_refined"};
    };

    class copper {
        name = "Altis Kupferhändler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "copper_refined"};
    };

    class coal {
        name = "Altis Kohlehändler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "coal_refined"};
    };

    class gasp {
        name = "Altis Erdgashändler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "gas_refined"};
    };

    class schmuck {
        name = "Altis Schmuckhändler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "schmuck_refined"};
    };

    class beton {
        name = "Altis Betonhändler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "beton_refined"};
    };

    class tomatop {
        name = "Altis Tomatenmarkhändler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "tomatoP"};
    };

    class wine {
        name = "Altis Weinladen";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "wine"};
    };

    class moonShine {
        name = "Altis Schwarzgebranntes";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "moonShine"};
    };

    class smartPhone {
        name = "Altis Handyladen";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "smartPhone"};
    };

    class c4 {
        name = "Altis C4";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "c4","gunPowder"};
    };

    class plastic {
        name = "Altis Plastikhändler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "plastic"};
    };

    class stahl {
        name = "Altis Stahlhändler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "stahl_refined"};
    };

    class essen {
        name = "Altis Lebensmittelmarkt";
        side[] = {"civ","cop","thr"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle","rabbit","apple","peach","redgull","marijuana","fuelFull"};
    };

    class thr {
        name = "THR Ausrüstung";
        side[] = {"thr"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "vehiclebox","waterBottle","rabbit","peach","apple","toolbox","fuelFull","redgull","battery","roadcone","roadbarrier","gpstracker"};
    };

    class baumarkt {
        name = "Polizei Objekte";
        side[] = {"cop"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "mauer","gate","arrowdeskl","arrowdeskr","roadbarrier","roadcone","tapesign","hescobag"};
    };

    class silvester {
        name = "Silvesterraketen Händler";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "rocket_random","rocket_normal_red","rocket_normal_blue","rocket_normal_white","rocket_normal_green","rocket_fizzer_blue", "rocket_fizzer_red", "rocket_fizzer_white", "rocket_fizzer_green", "rocket_rain_blue", "rocket_rain_red", "rocket_rain_white", "rocket_rain_green"};
    };
    class atomicTrader {
        name = "Ausländischer Kontaktmann";
        side[] = {"civ"};
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "fissileMaterial"};
    };

};

/*
*    CLASS:
*        variable = Variable Name
*        buyPrice = Item Buy Price
*        displayName = Item Name
*        edible = Item Edible (-1 = Disabled)
*        icon = Item Icon
*        illegal = Illegal Item
*        MaxPrice = Item Max Price for DYNMARKET
*        MinPrice = Item Min Price for DYNMARKET
*        profVar = Variable for the prificient-Sys
*        RelatedItems = RelatedItems for DYNMARKET
*        safeToDB = Safe item in Db for Player and Veh inv
*        sellPrice = Item Sell Price
*        weight = Item Weight
*/
class VirtualItems {
    //Just a Empty Class where the others can be based on.
    class blueprint {
        variable = "blueprint";
        displayName = "STR_Default";
        icon = "images\items\ico_unknown.paa";
        buyPrice = 1000;
        sellPrice = 100;
        maxPrice = 1000;
        minPrice = 100;
        weight = 1;
        edible = -1;
        dynTracker = false;
        illegal = false;
        safeToDB = true;
        profVar = "";
        showInFAQ = false;
        needFuelTruck = false;
        needGasTruck = false;
        relatedItems[] = {
            "NOT_DEFINED"
        };
    };
    //Graffitis
    class Graffiti1: blueprint {
        variable = "graffiti_ftp";
        displayName = "STR_Item_graffiti_1";
        weight = 2;
        buyPrice = 500;
        sellPrice = 250;
        icon = "images\items\ico_graffiti_acab.paa";
        showInFAQ = true;
        illegal = true;
    };

    class Graffiti2: blueprint {
        variable = "graffiti_de100";
        displayName = "STR_Item_graffiti_2";
        weight = 2;
        buyPrice = 500;
        sellPrice = 250;
        icon = "images\items\ico_graffiti_de100.paa";
        showInFAQ = true;
        illegal = true;
    };

    class Graffiti3: blueprint {
        variable = "graffiti_weed";
        displayName = "STR_Item_graffiti_3";
        weight = 2;
        buyPrice = 500;
        sellPrice = 250;
        icon = "images\items\ico_graffiti_weed.paa";
        showInFAQ = true;
        illegal = true;
    };

    class Graffiti4: blueprint {
        variable = "graffiti_dale";
        displayName = "STR_Item_graffiti_4";
        weight = 2;
        buyPrice = 500;
        sellPrice = 250;
        icon = "images\items\ico_graffiti_dale.paa";
        showInFAQ = true;
        illegal = true;
    };
    
    //Misc
    class fissileMaterial: blueprint {
        variable = "fissileMaterial";
        displayName = "STR_Item_fissileMaterial";
        weight = 50;
        buyPrice = -1;
        sellPrice = 20000000;
        icon = "images\items\ico_fissileMaterial.paa";
        showInFAQ = true;
        illegal = true;
        safeToDB = false;
    };

    class smokeWall: blueprint {
        variable = "smokeWall";
        displayName = "STR_Item_smokeWall";
        weight = 20;
        buyPrice = 600000;
        sellPrice = 200000;
        icon = "images\items\ico_fissileMaterial.paa";
        showInFAQ = true;
        illegal = true;
    };

    class pickaxe: blueprint {
        variable = "pickaxe";
        displayName = "STR_Item_Pickaxe";
        weight = 2;
        buyPrice = 1200;
        sellPrice = 750;
        maxPrice = 400;
        minPrice = 100;
        icon = "images\items\ico_pickaxe.paa";
        showInFAQ = true;
    };

    class rocket_random: blueprint {
        variable = "rocket_random";
        displayName = "STR_Item_rocket_random";
        weight = 2;
        buyPrice = 10000;
        sellPrice = 5000;
        maxPrice = 400;
        minPrice = 100;
        illegal = true;
        icon = "images\items\ico_rocketRandom.paa";
    };

    class rocket_normal_red: rocket_random {
        variable = "rocket_normal_red";
        displayName = "STR_Item_rocket_normal_red";
        weight = 2;
        buyPrice = 15000;
        sellPrice = 5000;
        maxPrice = 400;
        minPrice = 100;
        illegal = true;
    };

    class rocket_normal_blue: rocket_random {
        variable = "rocket_normal_blue";
        displayName = "STR_Item_rocket_normal_blue";
        weight = 2;
        buyPrice = 15000;
        sellPrice = 5000;
        maxPrice = 400;
        minPrice = 100;
        illegal = true;
    };

    class rocket_normal_white: rocket_random {
        variable = "rocket_normal_white";
        displayName = "STR_Item_rocket_normal_white";
        weight = 2;
        buyPrice = 15000;
        sellPrice = 5000;
        maxPrice = 400;
        minPrice = 100;
        illegal = true;
    };

    class rocket_normal_green: rocket_random {
        variable = "rocket_normal_green";
        displayName = "STR_Item_rocket_normal_green";
        weight = 2;
        buyPrice = 15000;
        sellPrice = 5000;
        maxPrice = 400;
        minPrice = 100;
        illegal = true;
    };

    class rocket_fizzer_blue: rocket_random {
        variable = "rocket_fizzer_blue";
        displayName = "STR_Item_rocket_fizzer_blue";
        weight = 2;
        buyPrice = 20000;
        sellPrice = 5000;
        maxPrice = 400;
        minPrice = 100;
        illegal = true;
    };

    class rocket_fizzer_red: rocket_random {
        variable = "rocket_fizzer_red";
        displayName = "STR_Item_rocket_fizzer_red";
        weight = 2;
        buyPrice = 20000;
        sellPrice = 5000;
        maxPrice = 400;
        minPrice = 100;
        illegal = true;
    };

    class rocket_fizzer_white: rocket_random {
        variable = "rocket_fizzer_white";
        displayName = "STR_Item_rocket_fizzer_white";
        weight = 2;
        buyPrice = 20000;
        sellPrice = 5000;
        maxPrice = 400;
        minPrice = 100;
        illegal = true;
    };

    class rocket_fizzer_green: rocket_random {
        variable = "rocket_fizzer_green";
        displayName = "STR_Item_rocket_fizzer_green";
        weight = 2;
        buyPrice = 20000;
        sellPrice = 5000;
        maxPrice = 400;
        minPrice = 100;
        illegal = true;
    };

    class rocket_rain_blue: rocket_random {
        variable = "rocket_rain_blue";
        displayName = "STR_Item_rocket_rain_blue";
        weight = 2;
        buyPrice = 25000;
        sellPrice = 5000;
        maxPrice = 400;
        minPrice = 100;
        illegal = true;
    };

    class rocket_rain_red: rocket_random {
        variable = "rocket_rain_red";
        displayName = "STR_Item_rocket_rain_red";
        weight = 2;
        buyPrice = 25000;
        sellPrice = 5000;
        maxPrice = 400;
        minPrice = 100;
        illegal = true;
    };

    class rocket_rain_white: rocket_random {
        variable = "rocket_rain_white";
        displayName = "STR_Item_rocket_rain_white";
        weight = 2;
        buyPrice = 25000;
        sellPrice = 5000;
        maxPrice = 400;
        minPrice = 100;
        illegal = true;
    };

    class rocket_rain_green: rocket_random {
        variable = "rocket_rain_green";
        displayName = "STR_Item_rocket_rain_green";
        weight = 2;
        buyPrice = 25000;
        sellPrice = 5000;
        maxPrice = 400;
        minPrice = 100;
        illegal = true;
    };

    class fuelEmpty: blueprint {
        variable = "fuelEmpty";
        displayName = "STR_Item_FuelE";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        icon = "images\items\ico_fuel_can.paa";
    };

    class fuelFull: blueprint {
        variable = "fuelFull";
        displayName = "STR_Item_FuelF";
        weight = 5;
        buyPrice = 850;
        sellPrice = 500;
        showInFAQ = true;
        icon = "images\items\ico_fuel_can.paa";
    };

    class spikeStrip: blueprint {
        variable = "spikeStrip";
        displayName = "STR_Item_SpikeStrip";
        weight = 15;
        buyPrice = 2500;
        sellPrice = 1200;
        illegal = true;
        icon = "images\items\ico_spikestrip.paa";
    };

    class lockpick: blueprint {
        variable = "lockpick";
        displayName = "STR_Item_Lockpick";
        weight = 1;
        buyPrice = 2500;
        sellPrice = 1200;
        showInFAQ = true;
        icon = "images\items\ico_lockpick.paa";
    };

    class gpstracker: blueprint {
        variable = "gpstracker";
        displayName = "STR_Item_gpstracker";
        weight = 1;
        buyPrice = 100000;
        sellPrice = 1200;
        illegal = true;
        showInFAQ = true;
        icon = "\a3\weapons_f\Data\UI\gear_item_gps_ca.paa";
    };

    class morphine: blueprint {
        variable = "morphine";
        displayName = "STR_Item_Morphine";
        weight = 1;
        buyPrice = 25000;
        sellPrice = 12000;
        illegal = false;
        showInFAQ = true;
        icon = "images\items\ico_injector.paa";
    };

    class epinephrine: blueprint {
        variable = "epinephrine";
        displayName = "STR_Item_Epinephrine";
        weight = 1;
        buyPrice = 25000;
        sellPrice = 12000;
        illegal = false;
        showInFAQ = true;
        icon = "images\items\ico_injector.paa";
    };

    class goldbar: blueprint {
        variable = "goldBar";
        displayName = "STR_Item_GoldBar";
        weight = 12;
        buyPrice = -1;
        sellPrice = 550000;
        illegal = true;
        safeToDB = false;
        showInFAQ = true;
        icon = "images\items\ico_goldbar.paa";
    };

    class blastingcharge: blueprint {
        variable = "blastingCharge";
        displayName = "STR_Item_BCharge";
        weight = 15;
        buyPrice = 50000;
        sellPrice = 20000;
        illegal = true;
        showInFAQ = true;
        icon = "images\items\ico_blastingCharge.paa";
    };

    class zipties: blueprint {
        variable = "zipTies";
        displayName = "STR_Item_zipties";
        weight = 5;
        buyPrice = 5000;
        sellPrice = 2600;
        showInFAQ = true;
        illegal = true;
    };

    class toolbox: blueprint {
        variable = "toolBox";
        displayName = "STR_Item_ADACtoolbox";
        weight = 1;
        buyPrice = 1000;
        sellPrice = 500;
        illegal = true;
    };

    class vehiclebox: blueprint {
        variable = "vehicleBox";
        displayName = "STR_Item_VehBox";
        weight = 15;
        buyPrice = 400000;
        sellPrice = 50000;
        illegal = true;
    };

    class battery: blueprint {
        variable = "battery";
        displayName = "STR_Item_battery";
        weight = 1;
        buyPrice = 1000;
        sellPrice = 200;
        showInFAQ = true;
        profVar = "battery_Prof";
    };

    class speedtrap: blueprint {
        variable = "speedTrap";
        displayName = "STR_Item_speedtrap";
        weight = 5;
        buyPrice = 5500;
        sellPrice = 2500;
        illegal = true;
    };

    class gate: blueprint {
        variable = "gate";
        displayName = "STR_Item_gate";
        weight = 15;
        buyPrice = 10000;
        sellPrice = 2500;
        illegal = true;
    };

    class arrowdeskl: blueprint {
        variable = "ArrowDeskL";
        displayName = "STR_Item_arrowdeskl";
        weight = 5;
        buyPrice = 3000;
        sellPrice = 2500;
        illegal = true;
    };
    class arrowdeskr: blueprint {
        variable = "ArrowDeskR";
        displayName = "STR_Item_arrowdeskr";
        weight = 5;
        buyPrice = 3000;
        sellPrice = 2500;
        illegal = true;
    };

    class roadbarrier: blueprint {
        variable = "RoadBarrier";
        displayName = "STR_Item_roadbarrier";
        weight = 5;
        buyPrice = 6000;
        sellPrice = 2500;
        illegal = true;
    };

    class roadcone: blueprint {
        variable = "RoadCone";
        displayName = "STR_Item_roadcone";
        weight = 5;
        buyPrice = 1000;
        sellPrice = 100;
        illegal = true;
    };

    class tapesign: blueprint {
        variable = "TapeSign";
        displayName = "STR_Item_tapesign";
        weight = 5;
        buyPrice = 1000;
        sellPrice = 100;
        illegal = true;
    };

    class hescobag: blueprint {
        variable = "HescoBag";
        displayName = "STR_Item_hescobag";
        weight = 10;
        buyPrice = 11000;
        sellPrice = 2500;
        illegal = true;
    };

    class mauer: blueprint {
        variable = "mauer";
        displayName = "STR_Item_mauer";
        weight = 15;
        buyPrice = 8000;
        sellPrice = 2500;
        illegal = true;
    };

    class boltcutter: blueprint {
        variable = "boltCutter";
        displayName = "STR_Item_BCutter";
        weight = 5;
        buyPrice = 7500;
        sellPrice = 2500;
        showInFAQ = true;
        illegal = true;
        icon = "images\items\ico_boltcutter.paa";
    };

    class bag: blueprint {
        variable = "bag";
        displayName = "STR_Item_bag";
        weight = 5;
        buyPrice = 15000;
        sellPrice = 6000;
        showInFAQ = true;
        illegal = true;
        icon = "images\items\ico_bag.paa";
    };

    class storagesmall: blueprint {
        variable = "storageSmall";
        displayName = "STR_Item_StorageBS";
        weight = 5;
        buyPrice = 375000;
        sellPrice = 75000;
        showInFAQ = true;
        icon = "images\items\ico_storageSmall.paa";
    };

    class storagebig: blueprint {
        variable = "storageBig";
        displayName = "STR_Item_StorageBL";
        weight = 10;
        buyPrice = 500000;
        sellPrice = 150000;
        showInFAQ = true;
        icon = "images\items\ico_storageBig.paa";
    };

    class storagegang: blueprint {
        variable = "storageGang";
        displayName = "STR_Item_StorageBC";
        weight = 40;
        buyPrice = 10000000;
        sellPrice = 4000000;
        showInFAQ = true;
        icon = "images\items\ico_storageGang.paa";
    };

    class storagecop: blueprint {
        variable = "storageCop";
        displayName = "STR_Item_StorageBP";
        weight = 40;
        buyPrice = 2500000;
        sellPrice = 1400000;
        showInFAQ = false;
        icon = "images\items\ico_storageCop.paa";
    };

    //Mined Items
    class oil_unprocessed: blueprint {
        variable = "oilUnprocessed";
        profVar = "Oil_Prof_Gather";
        displayName = "STR_Item_OilU";
        needFuelTruck = true;
        weight = 7;
        buyPrice = -1;
        sellPrice = -1;
        icon = "images\items\ico_oil_unprocessed.paa";
    };

    class oil_processed: blueprint {
        variable = "oilProcessed";
        profVar = "Oil_Prof";
        displayName = "STR_Item_OilP";
        needFuelTruck = true;
        weight = 6;
        buyPrice = -1;
        sellPrice = 3200;
        maxPrice = 6666;
        minPrice = 2000;
        icon = "images\items\ico_oil_processed.paa";
        relatedItems[] = {
            "cement",
            "glass",
            "beton_refined",
            "plastic"
        };
        dynTracker = true;
    };

    class copper_unrefined: blueprint {
        variable = "copperUnrefined";
        profVar = "Copper_Prof_Gather";
        displayName = "STR_Item_CopperOre";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        icon = "images\items\ico_copper_ore.paa";
    };

    class copper_refined: blueprint {
        variable = "copperRefined";
        profVar = "Copper_Prof";
        displayName = "STR_Item_CopperIngot";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1500;
        maxPrice = 2500;
        minPrice = 1000;
        icon = "images\items\ico_copper.paa";
        relatedItems[] = {
            "gas_refined",
            "coal_refined",
            "iron_refined",
            "stahl_refined"
        };
        dynTracker = true;
    };

    class iron_unrefined: blueprint {
        variable = "ironUnrefined";
        profVar = "Iron_Prof_Gather";
        displayName = "STR_Item_IronOre";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        icon = "images\items\ico_iron_ore.paa";
    };

    class iron_refined: blueprint {
        variable = "ironRefined";
        profVar = "Iron_Prof";
        displayName = "STR_Item_IronIngot";
        weight = 5;
        buyPrice = -1;
        sellPrice = 3200;
        maxPrice = 6666;
        minPrice = 3000;
        icon = "images\items\ico_iron.paa";
        relatedItems[] = {
            "gas_refined",
            "coal_refined",
            "copper_refined",
            "stahl_refined"
        };
        dynTracker = true;
    };

    class schmuck_refined: blueprint {
        variable = "schmuckrefined";
        profVar = "schmuck_Prof";
        displayName = "STR_Item_schmuck";
        weight = 6;
        buyPrice = -1;
        sellPrice = 3200;
        maxPrice = 30610;
        minPrice = 15310;
        icon = "images\items\ico_schmuck.paa";
        relatedItems[] = {
            "silver_refined",
            "diamond_cut",
            "gold_refined"
        };
        dynTracker = true;
    };

    class beton_refined: blueprint {
        variable = "betonrefined";
        profVar = "beton_Prof";
        displayName = "STR_Item_beton";
        weight = 8;
        buyPrice = -1;
        sellPrice = 3200;
        maxPrice = 22800;
        minPrice = 14000;
        icon = "images\items\ico_beton.paa";
        relatedItems[] = {
            "oil_processed",
            "glass",
            "cement",
            "plastic"
        };
        dynTracker = true;
    };

    class stahl_refined: blueprint {
        variable = "stahlrefined";
        profVar = "stahl_Prof";
        displayName = "STR_Item_stahl";
        weight = 6;
        buyPrice = -1;
        sellPrice = 3200;
        maxPrice = 20119;
        minPrice = 13521;
        icon = "images\items\ico_stahl.paa";
        relatedItems[] = {
            "coal_refined",
            "gas_refined",
            "copper_refined",
            "iron_refined"
        };
        dynTracker = true;
    };

    class gas_unrefined: blueprint {
        variable = "gasUnrefined";
        profVar = "Gas_Prof_Gather";
        displayName = "STR_Item_gasU";
        needGasTruck = true;
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        icon = "images\items\ico_gasu.paa";
    };

    class gas_refined: blueprint {
        variable = "gasRefined";
        profVar = "Gas_Prof";
        displayName = "STR_Item_gasR";
        needGasTruck = true;
        weight = 3;
        buyPrice = -1;
        sellPrice = 3200;
        maxPrice = 10137;
        minPrice = 2070;
        icon = "images\items\ico_gasp.paa";
        relatedItems[] = {
            "coal_refined",
            "copper_refined",
            "iron_refined",
            "stahl_refined"
        };
        dynTracker = true;
    };

    class coal_unrefined: blueprint {
        variable = "coalunrefined";
        profVar = "coal_Prof_Gather";
        displayName = "STR_Item_Coal";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        icon = "images\items\ico_coal.paa";
    };

    class coal_refined: blueprint {
        variable = "coalRefined";
        profVar = "coal_Prof";
        displayName = "STR_Item_CoalR";
        weight = 3;
        buyPrice = -1;
        sellPrice = 3200;
        maxPrice = 1499;
        minPrice = 550;
        icon = "images\items\ico_coalr.paa";
        relatedItems[] = {
            "gas_refined",
            "copper_refined",
            "iron_refined",
            "stahl_refined"
        };
        dynTracker = true;
    };

    class gold_unrefined: blueprint {
        variable = "goldunrefined";
        profVar = "gold_Prof_Gather";
        displayName = "STR_Item_GoldnOre";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        icon = "images\items\ico_golderz.paa";
    };

    class gold_refined: blueprint {
        variable = "goldrefined";
        profVar = "gold_Prof";
        displayName = "STR_Item_GoldIngot";
        weight = 4;
        buyPrice = -1;
        sellPrice = 3200;
        maxPrice = 7333;
        minPrice = 3000;
        icon = "images\items\ico_gold.paa";
        relatedItems[] = {
            "diamond_cut",
            "schmuck_refined",
            "silver_refined"
        };
        dynTracker = true;
    };

    class silver_unrefined: blueprint {
        variable = "silverunrefined";
        profVar = "silber_Prof_Gather";
        displayName = "STR_Item_SilvernOre";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        icon = "images\items\ico_silbererz.paa";
    };

    class silver_refined: blueprint {
        variable = "silverrefined";
        profVar = "silber_Prof";
        displayName = "STR_Item_SilverIngot";
        weight = 3;
        buyPrice = -1;
        sellPrice = 3200;
        maxPrice = 5960;
        minPrice = 2550;
        icon = "images\items\ico_silber.paa";
        relatedItems[] = {
            "diamond_cut",
            "schmuck_refined",
            "gold_refined"
        };
        dynTracker = true;
    };

    class salt_unrefined: blueprint {
        variable = "saltUnrefined";
        profVar = "Salt_Prof_Gather";
        displayName = "STR_Item_Salt";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        icon = "images\items\ico_salt_unprocessed.paa";
    };

    class salt_refined: blueprint {
        variable = "saltRefined";
        profVar = "Salt_Prof";
        displayName = "STR_Item_SaltR";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1450;
        maxPrice = 3020;
        minPrice = 1785;
        icon = "images\items\ico_salt.paa";
        relatedItems[] = {
            "ketchup",
            "tomatoP",
            "sugar"
        };
        dynTracker = true;
    };

    class sand: blueprint {
        variable = "sand";
        profVar = "Sand_Prof_Gather";
        displayName = "STR_Item_Sand";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        icon = "images\items\ico_sand.paa";
    };

    class glass: blueprint {
        variable = "glass";
        profVar = "Sand_Prof";
        displayName = "STR_Item_Glass";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1450;
        maxPrice = 7464;
        minPrice = 1780;
        icon = "images\items\ico_glass.paa";
        relatedItems[] = {
            "oil_processed",
            "plastic",
            "cement",
            "beton_refined"
        };
        dynTracker = true;
    };

    class diamond_uncut: blueprint {
        variable = "diamondUncut";
        profVar = "Diamond_Prof_Gather";
        displayName = "STR_Item_DiamondU";
        weight = 4;
        buyPrice = -1;
        sellPrice = 750;
        icon = "images\items\ico_diamond_unprocessed.paa";
    };

    class diamond_cut: blueprint {
        variable = "diamondCut";
        profVar = "Diamond_Prof";
        displayName = "STR_Item_DiamondC";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2000;
        maxPrice = 5357;
        minPrice = 2634;
        icon = "images\items\ico_diamond.paa";
        relatedItems[] = {
            "silver_refined",
            "schmuck_refined",
            "gold_refined"
        };
        dynTracker = true;
    };

    class rock: blueprint {
        variable = "rock";
        profVar = "Rock_Prof_Gather";
        displayName = "STR_Item_Rock";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        icon = "images\items\ico_rock.paa";
    };

    class cement: blueprint {
        variable = "cement";
        profVar = "Rock_Prof";
        displayName = "STR_Item_CementBag";
        weight = 5;
        buyPrice = -1;
        sellPrice = 1950;
        maxPrice = 4500;
        minPrice = 3333;
        icon = "images\items\ico_cement.paa";
        relatedItems[] = {
            "oil_processed",
            "glass",
            "beton_refined",
            "plastic"
        };
        dynTracker = true;
    };

    //Drugs
    class heroin_unprocessed: blueprint {
        variable = "heroinUnprocessed";
        profVar = "Heroin_Prof_Gather";
        displayName = "STR_Item_HeroinU";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        safeToDB = false;
        illegal = true;
        icon = "images\items\ico_heroin_unprocessed.paa";
    };

    class heroin_processed: blueprint {
        variable = "heroinProcessed";
        profVar = "Heroin_Prof";
        displayName = "STR_Item_HeroinP";
        weight = 3;
        buyPrice = 3500;
        sellPrice = 2060;
        maxPrice = 12000;
        minPrice = 3223;
        safeToDB = false;
        illegal = true;
        icon = "images\items\ico_heroin_processed.paa";
        relatedItems[] = {
            "cocaine_processed",
            "marijuana"
        };
        dynTracker = true;
    };

    class cannabis: blueprint {
        variable = "cannabis";
        profVar = "Canabis_Prof_Gather";
        displayName = "STR_Item_Cannabis";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        safeToDB = false;
        illegal = true;
        icon = "images\items\ico_cannabis.paa";
    };

    class marijuana: blueprint {
        variable = "marijuana";
        profVar = "Canabis_Prof";
        displayName = "STR_Item_Marijuana";
        weight = 3;
        buyPrice = 2800;
        sellPrice = 2350;
        maxPrice = 10300;
        minPrice = 3223;
        safeToDB = false;
        illegal = true;
        icon = "images\items\ico_marijuana.paa";
        relatedItems[] = {
            "cocaine_processed",
            "heroin_processed"
        };
        dynTracker = true;
    };

    class meth_unprocessed: blueprint {
        variable = "methUnprocessed";
        profVar = "Meth_Prof_Gather";
        displayName = "STR_Item_methU";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        icon = "images\items\ico_methu.paa";
    };

    class meth_processed: blueprint {
        variable = "methProcessed";
        profVar = "Meth_Prof";
        displayName = "STR_Item_methP";
        weight = 3;
        buyPrice = 2800;
        sellPrice = 2350;
        maxPrice = 6842;
        minPrice = 3671;
        safeToDB = false;
        illegal = true;
        icon = "images\items\ico_methn.paa";
        relatedItems[] = {
            "turtle_raw",
            "bluesky"
        };
        dynTracker = true;
    };

    class bluesky: blueprint {
        variable = "bluesky";
        profVar = "MethB_Prof";
        displayName = "STR_Item_methB";
        weight = 3;
        buyPrice = 2800;
        sellPrice = 2350;
        maxPrice = 10500;
        minPrice = 3464;
        safeToDB = false;
        illegal = true;
        icon = "images\items\ico_methb.paa";
        relatedItems[] = {
            "meth_processed",
            "turtle_raw"
        };
        dynTracker = true;
    };

    class cocaine_unprocessed: blueprint {
        variable = "cocaineUnprocessed";
        profVar = "Cocain_Prof_Gather";
        displayName = "STR_Item_CocaineU";
        weight = 4;
        buyPrice = -1;
        sellPrice = 3000;
        safeToDB = false;
        illegal = true;
        icon = "images\items\ico_cocain_unprocessed.paa";
    };

    class cocaine_processed: blueprint {
        variable = "cocaineProcessed";
        profVar = "Cocain_Prof";
        displayName = "STR_Item_CocaineP";
        weight = 3;
        buyPrice = -1;
        sellPrice = 5000;
        maxPrice = 11000;
        minPrice = 3454;
        safeToDB = false;
        illegal = true;
        icon = "images\items\ico_cocain_processed.paa";
        relatedItems[] = {
            "marijuana",
            "heroin_processed"
        };
        dynTracker = true;
    };

    //Drink
    class redgull: blueprint {
        variable = "redgull";
        displayName = "STR_Item_RedGull";
        weight = 1;
        buyPrice = 1500;
        sellPrice = 200;
        edible = 100;
        showInFAQ = true;
        icon = "images\items\ico_redgull.paa";
    };

    class coffee: blueprint {
        variable = "coffee";
        displayName = "STR_Item_Coffee";
        weight = 1;
        buyPrice = 10;
        sellPrice = 5;
        edible = 100;
        icon = "images\items\ico_coffee.paa";
    };

    class waterBottle: blueprint {
        variable = "waterBottle";
        displayName = "STR_Item_WaterBottle";
        weight = 1;
        buyPrice = 10;
        sellPrice = 5;
        edible = 100;
        showInFAQ = true;
        icon = "images\items\ico_water.paa";
    };

    //Food
    class apple: blueprint {
        variable = "apple";
        profVar = "Fruit_Prof_Gather";
        displayName = "STR_Item_Apple";
        weight = 1;
        buyPrice = 65;
        sellPrice = 50;
        edible = 10;
        showInFAQ = true;
        icon = "images\items\ico_apple.paa";
    };

    class peach: blueprint {
        variable = "peach";
        profVar = "Fruit_Prof_Gather";
        displayName = "STR_Item_Peach";
        weight = 1;
        buyPrice = 68;
        sellPrice = 55;
        edible = 10;
        showInFAQ = true;
        icon = "images\items\ico_peach.paa";
    };

    class tbacon: blueprint {
        variable = "tbacon";
        displayName = "STR_Item_TBacon";
        weight = 1;
        buyPrice = 75;
        sellPrice = 25;
        edible = 40;
        showInFAQ = true;
        icon = "images\items\ico_meat.paa";
    };

    class donuts: blueprint {
        variable = "donuts";
        displayName = "STR_Item_Donuts";
        weight = 1;
        buyPrice = 120;
        sellPrice = 60;
        edible = 30;
        icon = "images\items\ico_donut.paa";
    };

    class rabbit: blueprint {
        variable = "rabbit";
        displayName = "STR_Item_RabbitMeat";
        weight = 1;
        buyPrice = 150;
        sellPrice = 75;
        edible = 20;
        showInFAQ = true;
        icon = "images\items\ico_meat.paa";
    };

    class salema: blueprint {
        variable = "salema";
        displayName = "STR_Item_SalemaMeat";
        weight = 2;
        buyPrice = 75;
        sellPrice = 55;
        edible = 30;
        showInFAQ = true;
        icon = "images\items\ico_fish.paa";
    };

    class ornate: blueprint {
        variable = "ornate";
        displayName = "STR_Item_OrnateMeat";
        weight = 2;
        buyPrice = 175;
        sellPrice = 150;
        edible = 25;
        showInFAQ = true;
        icon = "images\items\ico_fish.paa";
    };

    class mackerel: blueprint {
        variable = "mackerel";
        displayName = "STR_Item_MackerelMeat";
        weight = 4;
        buyPrice = 250;
        sellPrice = 200;
        edible = 30;
        showInFAQ = true;
        icon = "images\items\ico_fish.paa";
    };

    class tuna: blueprint {
        variable = "tuna";
        displayName = "STR_Item_TunaMeat";
        weight = 6;
        buyPrice = 1250;
        sellPrice = 1000;
        edible = 100;
        showInFAQ = true;
        icon = "images\items\ico_fish.paa";
    };

    class mullet: blueprint {
        variable = "mullet";
        displayName = "STR_Item_MulletMeat";
        weight = 4;
        buyPrice = 600;
        sellPrice = 400;
        edible = 80;
        showInFAQ = true;
        icon = "images\items\ico_fish.paa";
    };

    class catshark: blueprint {
        variable = "catshark";
        displayName = "STR_Item_CatSharkMeat";
        weight = 6;
        buyPrice = 750;
        sellPrice = 500;
        edible = 100;
        showInFAQ = true;
        icon = "images\items\ico_fish.paa";
    };

    class turtle_raw: blueprint {
        variable = "turtleRaw";
        displayName = "STR_Item_TurtleMeat";
        weight = 6;
        buyPrice = 4000;
        sellPrice = 3000;
        maxPrice = 15000;
        minPrice = 9562;
        illegal = true;
        icon = "images\items\ico_turtle.paa";
        relatedItems[] = {
            "meth_processed",
            "bluesky"
        };
        dynTracker = true;
    };

    class turtle_soup: blueprint {
        variable = "turtleSoup";
        displayName = "STR_Item_TurtleSoup";
        weight = 2;
        buyPrice = 2500;
        sellPrice = 1000;
        edible = 100;
        showInFAQ = true;
        icon = "images\items\ico_turtle_soup.paa";
    };

    class tomato: blueprint {
        variable = "tomato";
        displayName = "STR_Item_tomato";
        weight = 3;
        buyPrice = 109;
        sellPrice = 100;
        edible = 50;
        profVar = "Tomato_Prof_Gather";
        icon = "images\items\ico_tomato.paa";

    };

    class tomatoP: blueprint {
        variable = "tomatoP";
        displayName = "STR_Item_tomatoP";
        weight = 2;
        buyPrice = 1000;
        sellPrice = 500;
        maxPrice = 1200;
        minPrice = 600;
        profVar = "Tomato_Prof";
        icon = "images\items\ico_tomatop.paa";
        relatedItems[] = {
            "salt_refined",
            "ketchup",
            "sugar"
        };
        dynTracker = true;
    };

    class grapes: blueprint {
        variable = "grapes";
        displayName = "STR_Item_grapes";
        weight = 3;
        buyPrice = 89;
        sellPrice = 69;
        edible = 50;
        profVar = "Fruit_Prof_Gather";
        icon = "images\items\ico_grapes.paa";

    };

    class sugarCane: blueprint {
        variable = "sugarCane";
        displayName = "STR_Item_sugarCane";
        weight = 3;
        buyPrice = 2500;
        sellPrice = 1350;
        profVar = "sugarCane_Prof_Gather";
        icon = "images\items\ico_sugarCane.paa";
    };

    class sugar: blueprint {
        variable = "sugar";
        displayName = "STR_Item_sugar";
        weight = 1;
        buyPrice = 2500;
        sellPrice = 2000;
        maxPrice = 2900;
        minPrice = 1000;
        profVar = "sugarCane_Prof";
        icon = "images\items\ico_sugar.paa";
        relatedItems[] = {
            "salt_refined",
            "ketchup",
            "tomatoP"
        };
        dynTracker = true;
    };

    class silicium: blueprint {
        variable = "silicium";
        displayName = "STR_Item_silicium";
        weight = 3;
        buyPrice = 1001;
        sellPrice = 2000;
        profVar = "silicium_Prof_Gather";
        icon = "images\items\ico_silicium.paa";
    };

    class sulfuric: blueprint {
        variable = "sulfuric";
        displayName = "STR_Item_sulfuric";
        weight = 5;
        buyPrice = 2500;
        sellPrice = 2350;
        profVar = "sulfuric_Prof_Gather";
        icon = "images\items\ico_sulfuric.paa";
    };

    class gunPowder: blueprint {
        variable = "gunPowder";
        displayName = "STR_Item_gunPowder";
        weight = 3;
        buyPrice = 2500;
        sellPrice = 1000;
        maxPrice = 7000;
        minPrice = 3000;
        illegal = true;
        safeToDB = false;
        profVar = "sulfuric_Prof";
        icon = "images\items\ico_gunPowder.paa";
        relatedItems[] = {
            "c4",
            "smartPhone"
        };
        dynTracker = true;
    };

    class plastic: blueprint {
        variable = "plastic";
        displayName = "STR_Item_plastic";
        weight = 3;
        buyPrice = 4000;
        sellPrice = 2400;
        maxPrice = 7899;
        minPrice = 3000;
        profVar = "plastic_Prof";
        icon = "images\items\ico_plastic.paa";
        relatedItems[] = {
            "cement",
            "glass",
            "beton_refined",
            "oil_processed"
        };
        dynTracker = true;
    };

    class trigger: blueprint {
        variable = "trigger";
        displayName = "STR_Item_trigger";
        weight = 2;
        buyPrice = 1800;
        sellPrice = 1400;
        illegal = true;
        safeToDB = false;
        profVar = "trigger_Prof_gather";
        icon = "images\items\ico_trigger.paa";
    };

    class ketchup: blueprint {
        variable = "ketchup";
        displayName = "STR_Item_ketchup";
        weight = 3;
        buyPrice = 2500;
        sellPrice = 1000;
        maxPrice = 8965;
        minPrice = 3000;
        profVar = "ketchup_Prof";
        icon = "images\items\ico_ketchup.paa";
        relatedItems[] = {
            "salt_refined",
            "tomatoP",
            "sugar"
        };
        dynTracker = true;
    };

    class fSalad: blueprint {
        variable = "fSalad";
        displayName = "STR_Item_fSalad";
        weight = 1;
        buyPrice = 1000;
        sellPrice = 500;
        profVar = "fsalad_Prof";
        icon = "images\items\ico_fSalad.paa";
    };

    class wine: blueprint {
        variable = "wine";
        displayName = "STR_Item_wine";
        weight = 2;
        maxPrice = 7500;
        minPrice = 4000;
        profVar = "wine_Prof";
        icon = "images\items\ico_wine.paa";
        relatedItems[] = {
            "moonShine"
        };
        dynTracker = true;
    };

    class corn: blueprint {
        variable = "corn";
        displayName = "STR_Item_corn";
        weight = 3;
        buyPrice = 2500;
        sellPrice = 1000;
        profVar = "Corn_Prof_Gather";
        icon = "images\items\ico_corn.paa";
    };

    class cBoard: blueprint {
        variable = "cBoard";
        displayName = "STR_Item_cBoard";
        weight = 4;
        buyPrice = 5500;
        sellPrice = 4500;
        profVar = "cBoard_Prof";
        icon = "images\items\ico_cBoard.paa";
    };

    class smartPhone: blueprint {
        variable = "smartPhone";
        displayName = "STR_Item_smartPhone";
        weight = 5;
        buyPrice = 1050;
        sellPrice = 900;
        maxPrice = 46000;
        minPrice = 34000;
        profVar = "smartPhone_Prof";
        icon = "images\items\ico_smartPhone.paa";
        relatedItems[] = {
            "c4",
            "gunPowder"
        };
        dynTracker = true;
    };

    class c4 : blueprint {
        variable = "c4";
        displayName = "STR_Item_c4";
        weight = 6;
        buyPrice = 60000;
        sellPrice = 2950;
        maxPrice = 40000;
        minPrice = 18000;
        illegal = true;
        safeToDB = false;
        profVar = "c4_Prof";
        icon = "images\items\ico_c4.paa";
        relatedItems[] = {
            "smartPhone",
            "gunPowder"
        };
        dynTracker = true;
    };

    class moonShine : blueprint {
        variable = "moonShine";
        displayName = "STR_Item_moonShine";
        weight = 3;
        maxPrice = 8000;
        minPrice = 3500;
        illegal = true;
        profVar = "mShine_Prof";
        icon = "images\items\ico_moonShine.paa";
        relatedItems[] = {
            "wine"
        };
        dynTracker = true;
    };
};

/*
*    CLASS:
*        variable = Variable Name
*        oldItem = OldItem
*        oldItems = Array with oldItems. Used for MultiProcessing
*        newItem = NewItem
*        noLicenseCost = Cost to process it without license
*        progressTitel = ProgressBar Titeltext
*        neededLicense = needed License
*/
class ItemProcessing {

    /*
    *    * Base Classes
    *
    */

    class blueprint {
        oldItem = "blueprint";
        oldItems[] = {{"blueprint",0}};
        newItem = "blueprint";
        noLicenseCost = 2000;
        progressTitel = "STR_Default";
        neededLicense = "";
        refinery = "";
    };

    class oil : blueprint {
        oldItem = "oil_unprocessed";
        newItem = "oil_processed";
        progressTitel = "STR_Process_Oil";
        neededLicense = "license_civ_oil";
        refinery = "OilP";
    };

    class gasp : blueprint {
        oldItem = "gas_unrefined";
        newItem = "gas_refined";
        progressTitel = "STR_Process_Gas";
        neededLicense = "license_civ_gas";
        refinery = "OelUndErdgas";
    };

    class diamondc : blueprint {
        oldItem = "diamond_uncut";
        newItem = "diamond_cut";
        progressTitel = "STR_Process_Diamond";
        neededLicense = "license_civ_diamond";
        refinery = "dimond_2";
    };

    class heroin : blueprint {
        oldItem = "heroin_unprocessed";
        newItem = "heroin_processed";
        progressTitel = "STR_Process_Heroin";
        neededLicense = "license_civ_heroin";
        refinery = "heroin_p";
    };

    class copper : blueprint {
        oldItem = "copper_unrefined";
        newItem = "copper_refined";
        progressTitel = "STR_Process_Copper";
        neededLicense = "license_civ_copper";
        refinery = "copper_mine_1";
    };

    class iron : blueprint {
        oldItem = "iron_unrefined";
        newItem = "iron_refined";
        progressTitel = "STR_Process_Iron";
        neededLicense = "license_civ_iron";
        refinery = "iron_processing";
    };

    class gold : blueprint {
        oldItem = "gold_unrefined";
        newItem = "gold_refined";
        progressTitel = "STR_Process_gold";
        neededLicense = "license_civ_gold";
        refinery = "Goldverarbeiter_2";
    };

    class silber : blueprint {
        oldItem = "silver_unrefined";
        newItem = "silver_refined";
        progressTitel = "STR_Process_silber";
        neededLicense = "license_civ_silber";
        refinery = "OilP_1";
    };

    class glass : blueprint {
        oldItem = "sand";
        newItem = "glass";
        progressTitel = "STR_Process_Sand";
        neededLicense = "license_civ_sand";
        refinery = "dimond_1_1";
    };

    class salt_r : blueprint {
        oldItem = "salt_unrefined";
        newItem = "salt_refined";
        progressTitel = "STR_Process_Salt";
        neededLicense = "license_civ_salt";
        refinery = "Salt";
    };

    class cocainep : blueprint {
        oldItem = "cocaine_unprocessed";
        newItem = "cocaine_processed";
        progressTitel = "STR_Process_Cocaine";
        neededLicense = "license_civ_coke";
        refinery = "cocaine processing";
    };

    class methb : blueprint {
        oldItem = "meth_unprocessed";
        newItem = "bluesky";
        progressTitel = "STR_Process_MethB";
        neededLicense = "license_civ_methb";
        refinery = "Walter_White";
    };

    class methn : blueprint {
        oldItem = "meth_unprocessed";
        newItem = "meth_processed";
        progressTitel = "STR_Process_MethN";
        neededLicense = "license_civ_methn";
        refinery = "meth_normal";
    };

    class marijuana : blueprint {
        oldItem = "cannabis";
        newItem = "marijuana";
        progressTitel = "STR_Process_Marijuana";
        neededLicense = "license_civ_marijuana";
        refinery = "Weed_p_1";
    };

    class cement : blueprint {
        oldItem = "rock";
        newItem = "cement";
        progressTitel = "STR_Process_Cement";
        neededLicense = "license_civ_cement";
        refinery = "rock_proc";
    };

    class coalr : blueprint {
        oldItem = "coal_unrefined";
        newItem = "coal_refined";
        progressTitel = "STR_Process_coal";
        neededLicense = "license_civ_coal";
        refinery = "copper_mine_1_1";
    };

    class plastic : blueprint {
        oldItem = "oil_Unprocessed";
        newItem = "plastic";
        progressTitel = "STR_Process_Oil";
        neededLicense = "license_civ_plastic";
        refinery = "dimond_1";
    };

    class sugarProd : blueprint {
        oldItem = "sugarCane";
        newItem = "sugar";
        progressTitel = "STR_Process_sugarCane";
        neededLicense = "license_civ_sugar";
        refinery[] = {"sugarCane_prod","sugarCane_prod_1"};
    };

    class tomatoP : blueprint {
        oldItem = "tomato";
        newItem = "tomatoP";
        progressTitel = "STR_Process_tomato";
        neededLicense = "license_civ_tomatoP";
        refinery = "tomatoP";
    };

    class battery : blueprint {
        oldItem = "silicium";
        newItem = "battery";
        progressTitel = "STR_Process_silicium";
        neededLicense = "license_civ_battery";
        refinery = "battery";
    };

    class gunPowder : blueprint {
        oldItem = "sulfuric";
        newItem = "gunPowder";
        progressTitel = "STR_Process_sulfuric";
        neededLicense = "license_civ_gunPowder";
        refinery = "battery_1";
    };

    class schmiede : blueprint {
        oldItems[] = {{"diamond_cut",1},{"gold_refined",1},{"silver_refined",1}};
        newItem = "schmuck_refined";
        progressTitel = "STR_Process_schmiede";
        neededLicense = "license_civ_schmiede";
        refinery = "OilP_1_2";
    };

    class betonmischer : blueprint {
        oldItems[] = {{"cement",1},{"sand",1}};
        newItem = "beton_refined";
        progressTitel = "STR_Process_betonmischer";
        neededLicense = "license_civ_betonmischer";
        refinery = "Betonmischer_1";
    };

    class stahlschmiede : blueprint {
        oldItems[] = {{"coal_refined",1},{"iron_unrefined",1}};
        newItem = "stahl_refined";
        progressTitel = "STR_Process_stahlschmiede";
        neededLicense = "license_civ_stahlschmiede";
        refinery = "Stahlschmiede_1";
    };

    class ketchup : blueprint {
        oldItems[] = {{"tomatoP",1},{"sugar",1}};
        newItem = "ketchup";
        progressTitel = "STR_Process_ketchup";
        neededLicense = "license_civ_ketchup";
        refinery = "wine:destille_3";
    };

    class fSalad : blueprint {
        oldItems[] = {{"grapes",1},{"apple",1},{"peach",1}};
        newItem = "fSalad";
        progressTitel = "STR_Process_fSalad";
        neededLicense = "license_civ_fSalad";
        refinery = "Fsalad Prod";
    };

    class wine : blueprint {
        oldItems[] = {{"grapes",1},{"sugar",1}};
        newItem = "wine";
        progressTitel = "STR_Process_wine";
        neededLicense = "license_civ_wine";
        refinery = "wine:destille";
    };

    class cBoard : blueprint {
        oldItems[] = {{"copper_refined",1},{"gold_refined",1}};
        newItem = "cBoard";
        progressTitel = "STR_Process_cBoard";
        neededLicense = "license_civ_cBoard";
        refinery = "dimond_3";
    };

    class smartPhone : blueprint {
        oldItems[] = {{"cBoard",1},{"battery",1},{"plastic",1}};
        newItem = "smartPhone";
        progressTitel = "STR_Process_SPhone";
        neededLicense = "license_civ_smartPhone";
        refinery = "dimond_4";
    };

    class c4 : blueprint {
        oldItems[] = {{"gunPowder",1},{"trigger",1},{"plastic",1}};
        newItem = "c4";
        progressTitel = "STR_Process_c4";
        neededLicense = "license_civ_c4";
        refinery = "wine:destille_2";
    };

    class moonShine : blueprint {
        oldItems[] = {{"corn",1},{"sugar",1}};
        newItem = "moonShine";
        progressTitel = "STR_Process_moonShine";
        neededLicense = "license_civ_moonShine";
        refinery = "wine:destille_1";
    };
};
