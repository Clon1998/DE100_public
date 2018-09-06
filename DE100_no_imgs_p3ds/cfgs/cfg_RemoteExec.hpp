#define F(NAME,TARGET) class NAME { \
allowedTargets = TARGET; \
clientCompile = 0; \
};

#define CF(NAME,TARGET) class NAME { \
allowedTargets = TARGET; \
clientCompile = 1; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2
#define HC HC_Life

class CfgRemoteExec {
    class Functions {
        mode = 1;
        jip = 0;

        F(life_fnc_addAchievExp,CLIENT)
        F(life_fnc_adminid,CLIENT)
        F(life_fnc_admininfo,CLIENT)
        F(life_fnc_anfrageAnTaxifahrer,CLIENT)
        F(life_fnc_atmMenu,CLIENT)
        F(life_fnc_bountyReceive,CLIENT)
        F(life_fnc_BugOccored,CLIENT)
        F(life_fnc_checkLicense,CLIENT)
        F(life_fnc_copLights,CLIENT)
        F(life_fnc_copSearch,CLIENT)
        F(life_fnc_copSiren,CLIENT) 
        F(life_fnc_dealerAddaction,CLIENT)
        F(life_fnc_execJailTimer,CLIENT)
        F(life_fnc_fuelStationAdd,CLIENT)
        F(life_fnc_giveDiff,CLIENT) 
        F(life_fnc_GRAD_Fireworks,CLIENT) 
        F(life_fnc_handleTaxiFahrerAntwort,CLIENT)
        F(life_fnc_staffManager,CLIENT)
        F(life_fnc_openGarage,CLIENT)
        F(life_fnc_jail,CLIENT) 
        F(life_fnc_jailMe,CLIENT) 
        F(life_fnc_knockedOut,CLIENT) 
        F(life_fnc_licenseCheck,CLIENT) 
        F(life_fnc_licensesRead,CLIENT) 
        F(life_fnc_lightHouse,CLIENT) 
        F(life_fnc_thrLights,CLIENT)
        F(life_fnc_thrSiren,CLIENT)
        F(life_fnc_moveIn,CLIENT) 
        F(life_fnc_receiveItem,CLIENT)
        F(life_fnc_receiveMoney,CLIENT) 
        F(life_fnc_reciveWinnings,CLIENT)
        F(life_fnc_removeLicenses,CLIENT) 
        F(life_fnc_restrain,CLIENT) 
        F(life_fnc_revived,CLIENT)
        F(life_fnc_robPerson,CLIENT)
        F(life_fnc_robReceive,CLIENT) 
        F(life_fnc_RopeBoxCheck,CLIENT)
        F(life_fnc_searchClient,CLIENT) 
        F(life_fnc_setTaxisArray,CLIENT)
        F(life_fnc_handleIdCard,CLIENT) 
        F(life_fnc_spikeStripEffect,CLIENT) 
        F(life_fnc_taxijobAktivKunde,CLIENT)
        F(life_fnc_ticketPaid,CLIENT)
        F(life_fnc_ticketPrompt,CLIENT) 
        F(life_fnc_trappedFlash,CLIENT)
        F(life_fnc_bag,CLIENT)
        F(life_fnc_marihuana,CLIENT)
        F(SOCK_fnc_dataQuery,CLIENT)
        F(SOCK_fnc_requestReceived,CLIENT)
        F(SOCK_fnc_banned,CLIENT)
        F(life_fnc_clientGetKey,CLIENT)
        F(life_fnc_clientWireTransfer,CLIENT)
        F(life_fnc_clientMessage,CLIENT)
        F(life_fnc_callTaxi,CLIENT)
        F(life_fnc_inform_customer,CLIENT)
        F(life_fnc_recive_call,CLIENT)
        F(life_fnc_recive_answer,CLIENT)
        F(life_fnc_network_overloaded,CLIENT)
        F(life_fnc_end_call,CLIENT)
        F(life_fnc_notification_system,CLIENT)
        F(life_fnc_broadcast,CLIENT)
        F(life_fnc_refund,CLIENT)
        F(life_fnc_promoted,CLIENT)
        F(life_fnc_invitePlayer,CLIENT)
        F(life_fnc_leaveGang,CLIENT)
        F(life_fnc_storeHouseInitLocal,CLIENT)
        F(life_fnc_removeStorehoselocal,CLIENT)
        F(life_fnc_thrHandleRequest,CLIENT) 
        F(life_fnc_gangMenu,CLIENT) 
        F(life_fnc_lights,CLIENT) 
        F(life_fnc_torture,CLIENT)
        F(life_fnc_createRadar,CLIENT) 
        F(life_fnc_distributeArticle,CLIENT)
        F(life_fnc_drag,CLIENT)
        F(life_fnc_carry,CLIENT)
        F(life_fnc_disarm,CLIENT)
        F(life_fnc_handleHeist,CLIENT)
        F(life_fnc_smokeCanon,CLIENT)

        /* Server only functions */
        F(bis_fnc_execvm,SERVER) 
        F(life_fnc_jailSys,SERVER)//Skiped
        F(TON_fnc_addHouse,SERVER)
        F(TON_fnc_cleanupMessages,SERVER)
        F(TON_fnc_getID,SERVER)//Skiped
        F(TON_fnc_fetchStaff,SERVER)
        F(TON_fnc_getVehicles,SERVER)
        F(TON_fnc_getDepository,SERVER)
        F(TON_fnc_handlealleTaxis,SERVER)//Skiped
        F(TON_fnc_updateRank,SERVER)
        F(TON_fnc_insertKontoAuzug,SERVER)
        F(TON_fnc_requestKontoAuzug,SERVER)//<----- Stoped!
        F(TON_fnc_savefuelstation,SERVER)
        F(TON_fnc_sellHouse,SERVER)
        F(TON_fnc_spikeStrip,SERVER)
        F(TON_fnc_startJackpot,SERVER)
        F(TON_fnc_addBet,SERVER)
        F(TON_fnc_update_perso,SERVER)
        F(TON_fnc_updateVehSpawnPoint,SERVER)
        F(TON_fnc_transferID,SERVER)
        F(TON_fnc_execGlobal,SERVER)
        F(TON_fnc_VehSpawnerSpawn,SERVER)
        F(TON_fnc_invisible,SERVER)
        F(TON_fnc_report,SERVER)
        F(TON_fnc_confirm,SERVER)
        F(TON_fnc_Nobody,SERVER)
        F(TON_fnc_gangUpdatePartial,SERVER)
        F(TON_fnc_addStoreHouse,SERVER)
        F(TON_fnc_sellStoreHouse,SERVER)
        F(TON_fnc_fetchOfflineMembers,SERVER)
        F(MSC_fnc_enableSimulation,SERVER)
        
        /* HeadlessClient only functions */
        F(A3Log,HC)
        F(HC_fnc_addHouse,HC)//Tested
        F(HC_fnc_cleanupMessages,HC)//Tested
        F(HC_fnc_fetchStaff,HC)//Tested
        F(HC_fnc_getVehicles,HC)//Tested
        F(HC_fnc_getDepository,HC)//Tested
        F(HC_fnc_updateRank,HC)//Tested
        F(HC_fnc_insertKontoAuzug,HC)//Tested
        F(HC_fnc_requestKontoAuzug,HC)
        F(HC_fnc_savefuelstation,HC)//Tested
        F(HC_fnc_sellHouse,HC)//Tested
        F(HC_fnc_spikeStrip,HC)//Tested
        F(HC_fnc_startJackpot,SERVER)
        F(HC_fnc_addBet,SERVER)
        F(HC_fnc_update_perso,HC)//Tested
        F(HC_fnc_updateVehSpawnPoint,HC)//Tested
        F(HC_fnc_Nobody,HC)
        F(HC_fnc_gangUpdatePartial,HC)
        F(HC_fnc_addStoreHouse,HC)
        F(HC_fnc_sellStoreHouse,HC)
        F(HC_fnc_fetchOfflineMembers,HC)

        //Shared FNC, Hopefully BI will add a HC+Server key
        CF(AC_fnc_buy,ANYONE)
        CF(AC_fnc_create,ANYONE)
        CF(AC_fnc_delete,ANYONE)
        CF(AC_fnc_distribute,ANYONE)
        CF(AC_fnc_fetchVeh,ANYONE)
        CF(AC_fnc_getAuctions,ANYONE)
        CF(AD_fnc_callAirDrop,ANYONE)
        CF(AD_fnc_delAirDrop,ANYONE)
        CF(AH_fnc_pardon,ANYONE)
        CF(CS_fnc_buy,ANYONE)
        CF(CS_fnc_get,ANYONE)
        CF(CS_fnc_sell,ANYONE)
        CF(GS_fnc_checkName,ANYONE)
        CF(GS_fnc_insert,ANYONE)
        CF(GS_fnc_rename,ANYONE)
        CF(MSC_fnc_deathTracker,ANYONE)
        CF(MSC_fnc_execStack,ANYONE)
        CF(MSC_fnc_itemTracker,ANYONE)
        CF(MSC_fnc_log,ANYONE)
        CF(MSC_fnc_pong,ANYONE)
        CF(MSC_fnc_teamspeak,ANYONE)
        CF(PL_fnc_insert,ANYONE)
        CF(PL_fnc_request,ANYONE)
        CF(PL_fnc_updateC,ANYONE)
        CF(PL_fnc_updateP,ANYONE)
        CF(SS_fnc_addLocker,ANYONE)
        CF(SS_fnc_saveinventory,ANYONE)
        CF(VEH_fnc_delete,ANYONE)
        CF(VEH_fnc_insert,ANYONE)
        CF(VEH_fnc_spawn,ANYONE)
        CF(VEH_fnc_store,ANYONE)
        CF(VEH_fnc_updateC,ANYONE)
        CF(VEH_fnc_updateF,ANYONE)
        CF(VEH_fnc_updateT,ANYONE)

        /* Functions for everyone */
        F(BIS_fnc_effectKilledAirDestruction,ANYONE)
        F(BIS_fnc_effectKilledSecondaries,ANYONE)
        F(life_fnc_colorVehicle,ANYONE)
        F(life_fnc_flashbang,ANYONE)
        F(life_fnc_jumpFnc,ANYONE)
        F(life_fnc_lockVehicle,ANYONE)
        F(life_fnc_pulloutVeh,ANYONE) 
        F(life_fnc_pushFunction,ANYONE)
        F(life_fnc_teargas,ANYONE)

    };

    class Commands {
        mode = 1;
        jip = 0;

        F(setFuel,ANYONE)
        F(switchMove,ANYONE)
        F(deleteGroup,ANYONE)
        F(moveOut,ANYONE)
        F(say3D,ANYONE)
        F(setCurrentChannel,ANYONE)
        F(radioChannelAdd,ANYONE)
        F(setMimic,ANYONE)
        F(radioChannelRemove,ANYONE)
        F(selectLeader,ANYONE)
    };
};