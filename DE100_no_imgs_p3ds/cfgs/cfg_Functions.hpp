class CfgFunctions {
    class Socket_Reciever {
        tag = "SOCK";
        class SQL_Socket {
            file = "core\session";
            class banned {};
            class dataQuery {};
            class insertPlayerInfo {};
            class ping {};
            class requestReceived {};
            class syncData {};
            class updatePartial {};
            class updateRequest {};
        };
    };

	class Misc_String {
        tag = "STR";
        class String {
            file = "core\string";
            class cutText {};
            class replace {};
            class toArray {};
        };
    };

	class Misc_Array {
        tag = "ARR";
        class Array {
            file = "core\array";
            class toUpLow {};
        };
    };

    class lockpicking {
        tag = "lpick";
        class lockpick {
            file = "core\lockpick";
            class breakLPick {};
            class checkLock {};
            class keyDown {};
            class keyUp {};
            class mBtnDown {};
            class mBtnUp {};
            class moveLPick {};
            class openLPick {};
            class prepare {};
            class rotateLPick {};
            class shakeLPick {};
        };
    };

    class Life_Client_Core {
        tag = "life";
        class MasterDirectory {
            file = "core";
            class initCiv {};
            class initCop {};
            class initThr {};
            class setupActions {};
            class survival {};
            class threadControl {};
            class welcomeNotification {};
        };

        class DynMarket {
            file = "core\DynMarket";
            class dynMarketChangePrice {};
        };

        class farmingSim {
            file = "core\farmingSim";
            class fs_animMap {};
            class fs_calcValue {};
            class fs_itemView {};
            class fs_LbSelChanged {};
            class fs_onItemClick {};
            class fs_onMouseEnter {};
            class fs_onMouseExit {};
            class fs_prepare {};
            class fs_setItem {};
            class fs_sliderPosChange {};
            class fs_vehicleView {};
        };

        class Admin {
            file = "core\admin";
            class adminmode {};
        };

        class heist {
            file = "core\heist";
            class flyingCameraView {};
            class handleHeist {};
            class handleRadiation {};
            class heistPrepAction {};
            class lightSwitch {};
            class setTrader {};
            class smokeCanon {};
            class takeOOI {};
        };

        class animations {
            file = "core\animations";
            class doAnimation {};
            class getDeathAnimation {};
            class getDefaultAnimation {};
        };

        class 3dGraphics {
            file = "core\3dGraphics";
            class 3dGraphicsPosition {};
            class add3dGraphics {};
            class build3dCache {};
        };

        class auctions {
            file = "core\auctions";
            class articleData {};
            class buyArticle {};
            class buyNowCb {};
            class calcDebts {};
            class calcHistory {};
            class createAuction {};
            class createPrevObj {};
            class deleteAuction {};
            class distributeArticle {};
            class favAuction {};
            class fetchAucClothing {};
            class fetchAucOthers {};
            class fetchAucVirtualItems {};
            class fetchAucWeapons {};
            class handleCam {};
            class handleFilter {};
            class handleMenu {};
            class handleTables {};
            class housePrev {};
            class loadAucData {};
            class openView {};
            class refreshAuction {};
            class saveDescEdit {};
            class searchTable {};
            class sellItemLbChange {};
            class setSections {};
            class setupAucCategory {};
            class setupAucInv {};
            class setupAucSection {};
            class setupSellHouse {};
            class setupSellVeh {};
            class sortTable {};
            class timeLbChange {};
        };

        class EventHandlers {
            file = "core\eventHandlers";
            class getInMan {};
            class getOutMan {};
            class handleDamage {};
            class Map {};
            class draw3D {};
            class mapSingleClick {};
            class onFired {};
            class onInventoryClosed {};
            class onInventoryOpened {};
            class onPlayerKilled {};
            class onPlayerRespawn {};
            class onTake {};
            class onPut {};
            class PlayerTags {};
            class RopeBoxCheck {};
            class RscDisplayMPInterrupt {};
            class setupPlayerEVH {};
            class setupVehicleEVH {};
            class weaponAssembled {};
        };

        class KeyHandler {
            file = "core\keyhandler";
            class keyHandler {};
        };

        class Jackpot {
            file = "core\gamble";
            class bet {};
            class reciveWinnings {};
            class RefreshPot {};
            class BugOccored {};
        };

        class InteractionMenu {
            file = "core\interactionMenu";
            class civIM {};
            class copIM {};
            class houseIM {};
            class licenseIM {};
            class lockersIM {};
            class medIM {};
            class openMenu {};
            class vehIM {};
        };

        class Nobody {
            file = "core\nobody";
            class initNobody {};
        };

        class revive {
            file = "core\revive";
            class carry {};
            class drag {};
            class revive {};
            class setUnconscious {};
        };

        class THR {
            file = "core\thr";
            class deathScreen {};
            class respawned {};
            class revived {};
            class revivePlayer {};
            class thrAccept {};
            class thrHandleRequest {};
            class thrHQ {};
            class thrHQLoadPlayers {};
            class thrHQSelChange {};
            class thrLoadout {};
            class thrMarker {};
            class thrRepair {};
            class thrRequest {};
            class thrSiren {};
        };

        class GangSystem {
            file = "core\gang_system";
            class createGang {};
            class renameGang {};
            class gangLevelUp {};
            class gangMenu {};
            class gangMenuCbChange {};
            class gangMenuLbChange {};
            class initGangLocal {};
            class invitePlayer {};
            class kickOut {};
            class kickOutLocal {};
            class leaveGang {};
            class newLeader {};
            class promoted {};
            class removeStorehoselocal {};
            class storeHouseInitLocal {};
            class terminateGang {};
            class validNameTag {};
        };

        class PaintJob {
            file = "core\repaint";
            class Repaintcolor {};
            class RepaintMenu {};
            class RepaintVehicle {};
        };

        class Taxi {
            file = "core\taxi";
            class callTaxi {};
            class customer_info {};
            class handleTaxiJob {};
            class inform_customer {};
            class load_Customers {};
            class taxi_answer {};
        };

        class IDSystem {
            file = "core\idCard";
            class confirm_formular {};
            class handleIDCard {};
            class fillBox {};
            class reapply {};
            class setup_formular {};
        };

        class StaffManager {
            file = "core\staffManager";
            class staffManager {};
            class staffManagerLbChange {};
            class changeRank {};
        };

        class Firework {
            file = "core\rockets";
            class callFirework {};
            class GRAD_Fireworks {};
        };

        class ProfSystem {
            file = "core\profSystem";
            class addExp {};
            class prof_LB_art_change {};
            class prof_LB_res_change {};
            class prof_LB_type_change {};
            class profsetup {};
            class getProf {};
        };

        class GroupSystem {
            file = "core\JoinerUI";
            class showJoiner {};
        };

        class Garage {
            file = "core\garage";
            class openDepository {};
            class openGarage {};
            class garageLBChange {};
            class unimpound {};
            class sellGarage {};
        };

        class Market {
            file = "core\market";
            class marketGetPrice {};
            class marketShortView {};
            class openMarketView {};
            class refreshMarketView {};
        };

        class pattern_array {
            file = "core\pattern_array";
            class applyCodeAtKey {};
            class applyPattern {};
            class dataFromKey {};
            class setDataAtKey {};
        };

        class Actions {
            file = "core\actions";
            class arrestAction {};
            class buyLicense {};
            class catchFish {};
            class catchTurtle {};
            class dpFinish {};
            class dropFishingNet {};
            class endGather {};
            class endMultiProcessing {};
            class endPickaxe {};
            class endProcessing {};
            class escortAction {};
            class getDPMissio1n {};
            class handleGroundPod {};
            class handlePod {};
            class healHospital {};
            class impoundAction {};
            class packupobjekt {};
            class packupSpikes {};
            class pickupItem {};
            class postBail {};
            class progressBar {};
            class pulloutAction {};
            class pushVehicle {};
            class putInCar {};
            class repairTruck {};
            class restrainAction {};
            class robAction {};
            class searchAction {};
            class searchVehAction {};
            class serviceChopper {};
            class setupApprove {};
            class setupCancel {};
            class startGather {};
            class startMultiProcessing {};
            class startPickaxe {};
            class startProcessing {};
            class stopEscorting {};
            class stopEscorting_addAction {};
            class storeVehicle {};
            class surrender {};
            class ticketAction {};
            class unrestrain {};
        };

        class HouseMenu {
            file = "core\house_menu";
            class fetchClothing {};
            class fetchErrorText {};
            class fetchOthers {};
            class fetchVirtualItems {};
            class fetchWeapons {};
            class getItemType {};
            class getSpace {};
            class getUsedSpace {};
            class handleDeleteat {};
            class handlePushback {};
            class handleTransfer {};
            class openLocker {};
            class screenItem {};
            class screenItemContainer {};
            class setupCategory {};
            class setupHousDisplay {};
            class setupSection {};
        };

        class Housing {
            file = "core\housing";
            class buyHouse {};
            class buyStoreHouse {};
            class copBreakDoor {};
            class copHouseOwner {};
            class deleteBoxes {};
            class getBuildingPositions {};
            class initHouses {};
            class lightHouse {};
            class lightHouseAction {};
            class lockHouse {};
            class lockupHouse {};
            class raidHouse {};
            class sellHouse {};
            class sellStorehouse {};
            class setVehSpawnPoint {};
            class showBoxes {};
            class showBoxesLbChange {};
            class updateHouseContainer {};
            class upgradeStorehouse {};
        };

        class Config {
            file = "core\config";
            class houseConfig {};
            class itemWeight {};
            class updateclothing {};
            class vehicleAnimate {};
            class vehicleColorStr {};
        };

        class PlayerMenu {
            file = "core\pmenu";
            class giveItem {};
            class giveMoney {};
            class keyDrop {};
            class keyGive {};
            class keyMenu {};
            class p_openMenu {};
            class p_updateMenu {};
            class removeItem {};
            class s_onCheckedChange {};
            class s_onSliderChange {};
            class settingsMenu {};
            class updateViewDistance {};
            class useItem {};
        };

        class MarkerSystem {
            file = "core\markerSystem";
            class createMarkerSystem {};
            class handleEdit {};
            class hideMarkerSystem {};
            class lbSelChange {};
            class searchEdit {};
            class showMarkerSystem {};
            class treeDblClickMarkerSystem {};
        };

        class Functions {
            file = "core\functions";
            class accType {};
            class actionKeyHandler {};
            class addAchievExp {};
            class addSit {};
            class advent {};
            class bBoxDistance {};
            class canAdd {};
            class clearVehicleAmmo {};
            class clientBool {};
            class clientGetKey {};
            class clientMresToArray {};
            class clientWireTransfer {};
            class dealerAddaction {};
            class deCrypt {preInit = 1;};
            class doppelXp {};
            class drawLine3D {};
            class drawText3D {};
            class dropItems {};
            class dummy {};
            class fetchCfgDetails {};
            class fetchVehInfo {};
            class giveDiff {};
            class handleInv {};
            class handleItem {};
            class handleItem_new {};
            class handleLicense {};
            class handleVItem {};
            class hudHide {};
            class hudSetup {};
            class hudShow {};
            class hudUpdate {};
            class index {};
            class inputMessage {};
            class intro {};
            class isnumber {};
            class isUIDActive {};
            class itemMax {};
            class licenseInfo {};
            class loadGear {};
            class logout {};
            class manageSC {};
            class name {};
            class nameUID {};
            class nearestDoor {};
            class nearUnits {};
            class notification_system {};
            class notification_system_cCords {};
            class number {};
            class numberText {};
            class numberWord {};
            class player_query {};
            class playerCount {};
            class pullOutVeh {};
            class pushObject {};
            class randomRound {};
            class receiveItem {};
            class receiveMoney {};
            class refund {};
            class repackMags {};
            class resetClothing {};
            class revealObjects {};
            class saveGear {};
            class screenshot {};
            class scrollWheel {};
            class searchPosEmpty {};
            class stripDownUnit {};
            class timeAdd {};
            class timeDiff {};
            class timeToStr {};
            class timeUnix {};
            class torture {};
            class unitFromUid {};
            class verifyts {};
        };

        class SmartphoneSystem {
            file = "core\smartphone";
            class Achiv_setup {};
            class Achiv_tree_changed {};
            class addContact {};
            class akkucheck {};
            class callPlayer {};
            class emoji {};
            class clientMessage {};
            class end_call {};
            class handleTimes {};
            class LoadMobileBanking {};
            class network_overloaded {};
            class offline_mode {};
            class recive_answer {};
            class recive_call {};
            class send_answer {};
            class send_msg {};
            class SetTitle {};
            class smartphoneAddContact {};
            class smartphoneCall {};
            class smartphoneincommingCall {};
            class smartphoneKontakte {};
            class smartphoneMsgView {};
            class smartphoneNotruf {};
            class statusAnzeige {};
        };

        class Network {
            file = "core\functions\network";
            class broadcast {};
            class jumpFnc {};
        };

        class Truckjob {
            file = "core\jobs\truckjob";
            class getFuel {};
            class refuelStation {};
            class truckJobMarker {};
        };

        class Taxijob {
            file = "core\jobs\taxijob";
            class anfrageAnTaxifahrer {};
            class deleteTaxi {};
            class handleTaxifahrerAntwort {};
            class handletaxifahrerDuty {};
            class setTaxisArray {};
            class taxiAction {};
            class taxijobAktivKunde {};
            class taxijobAktivTaxifahrer {};
            class taxijobMarker {};
            class taxirufen {};
            class taxiwagenleihen {};
        };

        class JobCenter {
            file = "core\jobs\jobcenter";
            class jobAccept {};
            class jobLeave {};
            class jobMenu {};
        };

        class Radar {
            file = "core\radar";
            class createRadar {};
            class initRadars {};
            class radarAdd {};
            class radarRemove {};
        };

        class Civilian {
            file = "core\civilian";
            class addCrime {};
            class changePlate {};
            class civescortAction {};
            class civLoadout {};
            class civmarker {};
            class civstopEscorting {};
            class disarm {};
            class jail {};
            class jailMe {};
            class knockedOut {};
            class knockoutAction {};
            class removeCrime {};
            class removeLicenses {};
            class robPerson {};
            class robReceive {};
            class tazed {};
            class waterChargeTimer {};
        };

        class Vehicle {
            file = "core\vehicle";
            class colorVehicle {};
            class deviceMine {};
            class fuelStationAdd {};
            class fuelStationFill {};
            class fuelStationMenu {};
            class fuelStationSelect {};
            class fuelStationSliderChange {};
            class initFuelstations {};
            class lights {};
            class lockVehicle {};
            class openTrunk {};
            class safeKey {};
            class sirenLights {};
            class updateTrunk {};
            class updateTrunkView {};
            class vehiclecolor3DRefresh {};
            class vehicleWeight {};
            class vehStoreItem {};
            class vehTakeItem {};
        };

        class Cop {
            file = "core\cop";
            class arrestDialog_Arrest {};
            class bountyReceive {};
            class checkLicense {};
            class copenter {};
            class copHQLoad {};
            class copHQSel {};
            class copLoadout {};
            class copMarkers {};
            class copopener {};
            class copSearch {};
            class copSiren {};
            class doorAnimate {};
            class fedCamDisplay {};
            class getBounty {};
            class getPlateNumber {};
            class licenseCheck {};
            class licensesRead {};
            class questionDealer {};
            class radar {};
            class radarfallemenu {};
            class repairDoor {};
            class restrain {};
            class requestOwner {};
            class searchClient {};
            class seizeObjects {};
            class showArrestDialog {};
            class spikeStripEffect {};
            class ticketGive {};
            class ticketPaid {};
            class ticketPay {};
            class ticketPrompt {};
            class vehInvSearch {};
        };

        class ShopSystem {
            file = "core\shops";
            class atmMenu {};
            class chopShopBuyBack {};
            class chopShopMenu {};
            class chopShopSelection {};
            class chopShopSell {};
            class clothingBuy {};
            class clothingCart {};
            class clothingLoad {};
            class clothingMenu {};
            class clothingMouse {};
            class clothingSkinsMenu {};
            class clothingunLoad {};
            class clothingValue {};
            class licenses {};
            class setClothingSkin {};
            class vehicleShop3DPreview {};
            class vehicleShopBuy {};
            class vehicleShopEnd3DPreview {};
            class vehicleShopInit3DPreview {};
            class vehicleShopLBChange {};
            class vehicleShopMenu {};
            class virt_buy {};
            class virt_menu {};
            class virt_sell {};
            class virt_update {};
            class weaponShopBuy {};
            class weaponShopClose {};
            class weaponShopMenu {};
            class weaponShopSelChange {};
        };

        class Items {
            file = "core\items";
            class bag {};
            class boltcutter {};
            class flashbang {};
            class gpstracker {};
            class heroin {};
            class jerryRefuel {};
            class kokain {};
            class lockpick {};
            class marihuana {};
            class placeObjekt {};
            class smokeWall {};
            class spikeStrip {};
            class sprayPaint {};
            class storageBox {};
            class teargas {};
            class vehicleBox {};
        };

        class JailSystem {
            file = "core\jail_esc";
            class BlowUp {};
            class Boom {};
            class cutFence {};
        };

        class BankSystem {
            file = "core\bank";
            class bankDeposit {};
            class bankLbChange {};
            class bankTransfer {};
            class bankWithdraw {};
            class gangDeposit {};
            class gangWithdraw {};
        };

        class Dialog_Controls {
            file = "dialog\function";
            class bgBlure {};
            class escBlock {};
            class faq_init {};
            class faq_lbChange {};
            class goldTake {};
            class introCamCreate {};
            class introCamDestroy {};
            class introCamSetPerc {};
            class jobLBChange {};
            class logoutBox {};
            class moveUi {};
            class setMapPosition {};
            class smartphone_map {};
            class SpawnCam {};
            class spawnConfirm {};
            class spawnMenu {};
            class spawnPointCfg {};
            class spawnPointSelected {};
            class vehicleGarage {};
        };
    };
};
