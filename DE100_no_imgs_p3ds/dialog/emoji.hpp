class Life_Emoji
{
    idd = 574132;
    movingEnabled = 0;
    enableSimulation = 1;
    onUnload = "removeMissionEventHandler ['EachFrame',(_this select 0) getVariable ['frameEVH',-1]];";

    class controlsBackground
    {
        class Title: Life_RscStructuredText
        {
            idc = -1;
            text = "EMOJI AUSWÄHLEN";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
           };
        class Background: Life_RscBackground
        {
            idc = -1;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.275 * safezoneH;
            colorBackground[] = {0,0,0,0.5};
        };
    };
    
    class Controls
    {
        class EMOJI_1: Life_RscPicture
        {
            idc = 1;
            text = "images\icons\emoji\1.paa";
            x = 0.0125;
            y = 0.06;
            w = 0.05;
            h = 0.068;
        };
        class EMOJI_2: EMOJI_1 {idc=2;};
        class EMOJI_3: EMOJI_1 {idc=3;};
        class EMOJI_4: EMOJI_1 {idc=4;};
        class EMOJI_5: EMOJI_1 {idc=5;};
        class EMOJI_6: EMOJI_1 {idc=6;};
        class EMOJI_7: EMOJI_1 {idc=7;};
        class EMOJI_8: EMOJI_1 {idc=8;};
        class EMOJI_9: EMOJI_1 {idc=9;};
        class EMOJI_10: EMOJI_1 {idc=10;};
        class EMOJI_11: EMOJI_1 {idc=11;};
        class EMOJI_12: EMOJI_1 {idc=12;};
        class EMOJI_13: EMOJI_1 {idc=13;};
        class EMOJI_14: EMOJI_1 {idc=14;};
        class EMOJI_15: EMOJI_1 {idc=15;};
        class EMOJI_16: EMOJI_1 {idc=16;};
        class EMOJI_17: EMOJI_1 {idc=17;};
        class EMOJI_18: EMOJI_1 {idc=18;};
        class EMOJI_19: EMOJI_1 {idc=19;};
        class EMOJI_20: EMOJI_1 {idc=20;};
        class EMOJI_21: EMOJI_1 {idc=21;};
        class EMOJI_22: EMOJI_1 {idc=22;};
        class EMOJI_23: EMOJI_1 {idc=23;};
        class EMOJI_24: EMOJI_1 {idc=24;};
        class EMOJI_25: EMOJI_1 {idc=25;};
        class EMOJI_26: EMOJI_1 {idc=26;};
        class EMOJI_27: EMOJI_1 {idc=27;};
        class EMOJI_28: EMOJI_1 {idc=28;};
        class EMOJI_29: EMOJI_1 {idc=29;};
        class EMOJI_30: EMOJI_1 {idc=30;};
        class EMOJI_31: EMOJI_1 {idc=31;};
        class EMOJI_32: EMOJI_1 {idc=32;};
        class EMOJI_33: EMOJI_1 {idc=33;};
        class EMOJI_34: EMOJI_1 {idc=34;};
        class EMOJI_35: EMOJI_1 {idc=35;};
        class EMOJI_36: EMOJI_1 {idc=36;};
        class EMOJI_37: EMOJI_1 {idc=37;};
        class EMOJI_38: EMOJI_1 {idc=38;};
        class EMOJI_39: EMOJI_1 {idc=39;};
        class EMOJI_40: EMOJI_1 {idc=40;};
        class EMOJI_41: EMOJI_1 {idc=41;};
        class EMOJI_42: EMOJI_1 {idc=42;};
        class EMOJI_43: EMOJI_1 {idc=43;};
        class EMOJI_44: EMOJI_1 {idc=44;};
        class EMOJI_45: EMOJI_1 {idc=45;};
        class EMOJI_46: EMOJI_1 {idc=46;};
        class EMOJI_47: EMOJI_1 {idc=47;};
        class EMOJI_48: EMOJI_1 {idc=48;};
        class EMOJI_49: EMOJI_1 {idc=49;};
        class EMOJI_50: EMOJI_1 {idc=50;};
        class EMOJI_51: EMOJI_1 {idc=51;};
        class EMOJI_52: EMOJI_1 {idc=52;};
        class EMOJI_53: EMOJI_1 {idc=53;};
        class EMOJI_54: EMOJI_1 {idc=54;};
        class EMOJI_55: EMOJI_1 {idc=55;};
    };
};