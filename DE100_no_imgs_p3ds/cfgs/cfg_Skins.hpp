class skins {
	class Default  {
        type = -1;//0-Uniform,1-Backpack
        class TextureSources {};
	};
	//(CIV,GUER,WEST)
    class U_I_HeliPilotCoveralls : Default {
        type = 0;
		class TextureSources {
			class Admin {
				displayName = "Admin";
				factions[] = {};
		    texture = "images\clothing\team_admin_u.paa";
        tier = 0;
				permission = "true";
			};
		};
	};

	class U_B_HeliPilotCoveralls : Default {
        type = 0;
		class TextureSources {
			class RadSuit {
				displayName = "RadSuit";
				factions[] = {};
		    texture = "images\clothing\RadSuitDE.paa";
        tier = 0;
				permission = "true";
			};
		};
	};

	class U_Rangemaster : Default {
		type = 0;
		class TextureSources {
			class Cop {
				displayName = "Cop";
				factions[] = {"WEST"};
		    texture = "images\clothing\cop_standard_u.paa";
        tier = 0;
				permission = "true";
			};

			class JR {
				displayName = "Jean Royce";
				factions[] = {"CIV"};
		    texture = "images\clothing\Jean_Royce.paa";
        tier = 1;
				permission = "true";
			};
		};
	};

	class U_B_GEN_Commander_F : Default {
		type = 0;
		class TextureSources {
			class Cop {
				displayName = "Cop";
				factions[] = {"WEST"};
		    texture = "images\clothing\cop_patrol.paa";
        tier = 0;
				permission = "true";
			};
		};
	};

	class U_B_CTRG_Soldier_F : Default {
		type = 0;
		class TextureSources {
			class Cop5 {
				displayName = "Cop5";
				factions[] = {"WEST"};
		    texture = "images\clothing\cop_sek_u.paa";
        tier = 0;
				permission = "call(missionNamespace getVariable['life_coplevel',{0}]) >= 5";
			};
		};
	};

	class U_C_Poloshirt_stripped : Default {
		type = 0;
		class TextureSources {
			class DE100 {
				displayName = "DE100";
				factions[] = {"CIV"};
		    texture = "images\clothing\civ_newbie_u.paa";
        tier = 0;
				permission = "true";
			};

			class Fucci1 {
				displayName = "Fucci I";
				factions[] = {"CIV"};
				texture = "images\clothing\fucci_flash.paa";
				tier = 1;
				permission = "true";
			};

			class Fucci2 {
				displayName = "Fucci II";
				factions[] = {"CIV"};
				texture = "images\clothing\fucci_smash.paa";
				tier = 1;
				permission = "true";
			};

			class Fucci3 {
				displayName = "Fucci III";
				factions[] = {"CIV"};
				texture = "images\clothing\fucci_source.paa";
				tier = 1;
				permission = "true";
			};

			class FundW1 {
				displayName = "F&W I";
				factions[] = {"CIV"};
				texture = "images\clothing\fundw_shirt_bluesplash.paa";
				tier = 1;
				permission = "true";
			};

			class FundW2 {
				displayName = "F&W II";
				factions[] = {"CIV"};
				texture = "images\clothing\fundw_shirt_weareno1.paa";
				tier = 1;
				permission = "true";
			};

			class FundW3 {
				displayName = "F&W III";
				factions[] = {"CIV"};
				texture = "images\clothing\fundw_shirt_whatareyou.paa";
				tier = 1;
				permission = "true";
			};

			class ILove {
				displayName = "I Love DE100";
				factions[] = {"CIV"};
				texture = "images\clothing\ilove_shirt.paa";
				tier = 1;
				permission = "true";
			};
		};
	};

	class U_B_SpecopsUniform_sgg : Default {
		type = 0;
		class TextureSources {
			class Cop0 {
				displayName = "Cop0";
				factions[] = {"WEST"};
		    texture = "images\clothing\cop_schupo_u.paa";
        tier = 0;
				permission = "true";
			};
			class Cop7 {
				displayName = "Cop7";
				factions[] = {"WEST"};
		    texture = "images\clothing\cop_sek_u.paa";
        tier = 0;
				permission = "call(missionNamespace getVariable['life_coplevel',{0}]) >= 7";
			};
		};
	};

	class U_B_CombatUniform_mcam : U_B_SpecopsUniform_sgg {
		type = 0;
		class TextureSources:TextureSources {
			class THR {
				displayName = "THR";
				factions[] = {"GUER"};
		    texture = "images\clothing\thr_u.paa";
        tier = 0;
				permission = "true";
			};

			class Nobody {
				displayName = "Nobody";
				factions[] = {};
		    texture = "images\clothing\nobody_ca.paa";
        tier = 0;
				permission = "true";
			};

			class Blueprint {
				displayName = "Blueprint";
				factions[] = {"CIV"};
		    texture = "images\clothing\blueprint_suit.paa";
        tier = 1;
				permission = "true";
			};

			class desert {
				displayName = "Desert Suit";
				factions[] = {"CIV"};
		    texture = "images\clothing\desert_suit.paa";
        tier = 1;
				permission = "true";
			};

			class dust {
				displayName = "Dust Suit";
				factions[] = {"CIV"};
		    texture = "images\clothing\dust_suit.paa";
        tier = 1;
				permission = "true";
			};

			class forest {
				displayName = "Forest Suit";
				factions[] = {"CIV"};
		    texture = "images\clothing\forest_suit.paa";
        tier = 1;
				permission = "true";
			};

			class pink {
				displayName = "Pink Suit";
				factions[] = {"CIV"};
		    texture = "images\clothing\pink_suit.paa";
        tier = 1;
				permission = "true";
			};

			class SWR {
				displayName = "Schwarz Weiß Rot";
				factions[] = {"CIV"};
		    texture = "images\clothing\swr.paa";
        tier = 1;
				permission = "true";
			};

		};
	};

	class U_B_CombatUniform_mcam_vest : U_B_CombatUniform_mcam {
		type = 0;
		class TextureSources:TextureSources {};
	};

	class B_Bergen_mcamo : Default {
		type = 1;
		class TextureSources:TextureSources {
			class THR {
				displayName = "THR";
				factions[] = {"GUER"};
		    texture = "images\clothing\thr_u.paa";
        tier = 0;
				permission = "true";
			};
		};
	};
};
