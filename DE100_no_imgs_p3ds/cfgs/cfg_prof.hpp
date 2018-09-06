/*
*    CLASS:
*        variable = Variable Name
*/
//By Patrick "Lucian" Schmidt
class ProfSys {   
    //Just a Empty Class where the others can be based on.
    class blueprint {
        variable = "blueprint";
        displayName = "";
        flag = "";
        type = "";
        skilltype = "";
        class Levels {};
    };

    class Meth_Prof_Gather : blueprint {
        variable = "Meth_Prof_Gather";
        displayName = "Medizin stehlen";
        flag = "civ";
        type = "illegal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,1};
            };

            class level_3 {
                time = 9;
                value[] = {2,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {2,1};
            };

            class level_5 {
                time = 8;
                value[] = {3,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {3,1};
            };

            class level_7 {
                time = 7;
                value[] = {4,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {4,0};
            };

            class level_9 {
                time = 6;
                value[] = {4,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {4,0};
            };
        };
    };

    class Meth_Prof : blueprint {
        variable = "Meth_Prof";
        displayName = "Meth kochen";
        flag = "civ";
        type = "illegal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 9;
                value[] = {1,1};
            };

            class level_4 {
                time = 8.5;
                value[] = {1,1};
            };

            class level_5 {
                time = 8;
                value[] = {2,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {2,0};
            };

            class level_7 {
                time = 7;
                value[] = {2,1};
            };

            class level_8 {
                time = 6.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 6;
                value[] = {3,0};
            };

            class level_10 {
                time = 5;
                value[] = {3,1};
            };
        };
    };

    class MethB_Prof : blueprint {
        variable = "MethB_Prof";
        displayName = "Blue Sky kochen";
        flag = "civ";
        type = "illegal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 9;
                value[] = {1,1};
            };

            class level_4 {
                time = 8.5;
                value[] = {1,1};
            };

            class level_5 {
                time = 8;
                value[] = {2,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {2,0};
            };

            class level_7 {
                time = 7;
                value[] = {2,1};
            };

            class level_8 {
                time = 6.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 6;
                value[] = {3,0};
            };

            class level_10 {
                time = 5;
                value[] = {3,1};
            };
        };
    };

    class Cocain_Prof_Gather : blueprint {
        variable = "Cocain_Prof_Gather";
        displayName = "Kokablätter sammeln";
        flag = "civ";
        type = "illegal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,1};
            };

            class level_3 {
                time = 9;
                value[] = {2,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {2,1};
            };

            class level_5 {
                time = 8;
                value[] = {3,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {3,1};
            };

            class level_7 {
                time = 7;
                value[] = {4,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {4,0};
            };

            class level_9 {
                time = 6;
                value[] = {4,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {4,0};
            };
        };
    };

    class Cocain_Prof : blueprint {
        variable = "Cocain_Prof";
        displayName = "Kokain herstellung";
        flag = "civ";
        type = "illegal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 9;
                value[] = {1,1};
            };

            class level_4 {
                time = 8.5;
                value[] = {1,1};
            };

            class level_5 {
                time = 8;
                value[] = {2,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {2,0};
            };

            class level_7 {
                time = 7;
                value[] = {2,1};
            };

            class level_8 {
                time = 6.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 6;
                value[] = {3,0};
            };

            class level_10 {
                time = 5;
                value[] = {3,1};
            };
        };
    };

    class Heroin_Prof_Gather : blueprint {
        variable = "Heroin_Prof_Gather";
        displayName = "Schlafmohn Samen sammeln";
        flag = "civ";
        type = "illegal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,1};
            };

            class level_3 {
                time = 9;
                value[] = {2,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {2,1};
            };

            class level_5 {
                time = 8;
                value[] = {3,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {3,1};
            };

            class level_7 {
                time = 7;
                value[] = {4,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {4,0};
            };

            class level_9 {
                time = 6;
                value[] = {4,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {4,0};
            };
        };
    };

    class Heroin_Prof : blueprint {
        variable = "Heroin_Prof";
        displayName = "Heroin herstellung";
        flag = "civ";
        type = "illegal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 9;
                value[] = {1,1};
            };

            class level_4 {
                time = 8.5;
                value[] = {1,1};
            };

            class level_5 {
                time = 8;
                value[] = {2,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {2,0};
            };

            class level_7 {
                time = 7;
                value[] = {2,1};
            };

            class level_8 {
                time = 6.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 6;
                value[] = {3,0};
            };

            class level_10 {
                time = 5;
                value[] = {3,1};
            };
        };
    };

    class Canabis_Prof_Gather : blueprint {
        variable = "Canabis_Prof_Gather";
        displayName = "Kannabis sammeln";
        flag = "civ";
        type = "illegal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,1};
            };

            class level_3 {
                time = 9;
                value[] = {2,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {2,1};
            };

            class level_5 {
                time = 8;
                value[] = {3,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {3,1};
            };

            class level_7 {
                time = 7;
                value[] = {4,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {4,0};
            };

            class level_9 {
                time = 6;
                value[] = {4,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {4,0};
            };
        };
    };

    class Canabis_Prof : blueprint {
        variable = "Canabis_Prof";
        displayName = "Marihuana herstellen";
        flag = "civ";
        type = "illegal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 9;
                value[] = {1,1};
            };

            class level_4 {
                time = 8.5;
                value[] = {1,1};
            };

            class level_5 {
                time = 8;
                value[] = {2,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {2,0};
            };

            class level_7 {
                time = 7;
                value[] = {2,1};
            };

            class level_8 {
                time = 6.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 6;
                value[] = {3,0};
            };

            class level_10 {
                time = 5;
                value[] = {3,1};
            };
        };
    };

    class Fruit_Prof_Gather : blueprint {
        variable = "Fruit_Prof_Gather";
        displayName = "Früchte sammeln";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {3,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {3,1};
            };

            class level_3 {
                time = 9;
                value[] = {4,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {4,1};
            };

            class level_5 {
                time = 8;
                value[] = {5,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {5,1};
            };

            class level_7 {
                time = 7;
                value[] = {6,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {6,0};
            };

            class level_9 {
                time = 6;
                value[] = {6,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {6,0};
            };
        };
    };

    class Rock_Prof_Gather : blueprint {
        variable = "Rock_Prof_Gather";
        displayName = "Steine abbauen";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {2,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {2,1};
            };

            class level_3 {
                time = 9;
                value[] = {3,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {3,1};
            };

            class level_5 {
                time = 8;
                value[] = {4,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {4,1};
            };

            class level_7 {
                time = 7;
                value[] = {5,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {5,0};
            };

            class level_9 {
                time = 6;
                value[] = {5,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {5,0};
            };
        };
    };

    class Rock_Prof : blueprint {
        variable = "Rock_Prof";
        displayName = "Zement mischen";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 6;
                value[] = {1,0};
            };

            class level_2 {
                time = 5.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 5;
                value[] = {1,1};
            };

            class level_4 {
                time = 4.8;
                value[] = {1,1};
            };

            class level_5 {
                time = 4.3;
                value[] = {2,0};
            };

            class level_6 {
                time = 4;
                value[] = {2,0};
            };

            class level_7 {
                time = 3.8;
                value[] = {2,1};
            };

            class level_8 {
                time = 3.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 3.2;
                value[] = {3,0};
            };

            class level_10 {
                time = 3;
                value[] = {3,1};
            };
        };
    };

    class Gas_Prof_Gather : blueprint {
        variable = "Gas_Prof_Gather";
        displayName = "Gas verladen";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,1};
            };

            class level_3 {
                time = 9;
                value[] = {2,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {2,1};
            };

            class level_5 {
                time = 8;
                value[] = {3,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {3,1};
            };

            class level_7 {
                time = 7;
                value[] = {4,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {4,0};
            };

            class level_9 {
                time = 6;
                value[] = {4,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {4,0};
            };
        };
    };

    class Gas_Prof : blueprint {
        variable = "Gas_Prof";
        displayName = "Gas Aufbereiten";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 6;
                value[] = {1,0};
            };

            class level_2 {
                time = 5.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 5;
                value[] = {1,1};
            };

            class level_4 {
                time = 4.8;
                value[] = {1,1};
            };

            class level_5 {
                time = 4.3;
                value[] = {2,0};
            };

            class level_6 {
                time = 4;
                value[] = {2,0};
            };

            class level_7 {
                time = 3.8;
                value[] = {2,1};
            };

            class level_8 {
                time = 3.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 3.2;
                value[] = {3,0};
            };

            class level_10 {
                time = 3;
                value[] = {3,1};
            };
        };
    };

    class Oil_Prof_Gather : blueprint {
        variable = "Oil_Prof_Gather";
        displayName = "Rohöl abbauen";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,1};
            };

            class level_3 {
                time = 9;
                value[] = {2,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {2,1};
            };

            class level_5 {
                time = 8;
                value[] = {3,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {3,1};
            };

            class level_7 {
                time = 7;
                value[] = {4,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {4,0};
            };

            class level_9 {
                time = 6;
                value[] = {4,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {4,0};
            };
        };
    };

    class Oil_Prof : blueprint {
        variable = "Oil_Prof";
        displayName = "Rohöl aufbereiten";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 6;
                value[] = {1,0};
            };

            class level_2 {
                time = 5.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 5;
                value[] = {1,1};
            };

            class level_4 {
                time = 4.8;
                value[] = {1,1};
            };

            class level_5 {
                time = 4.3;
                value[] = {2,0};
            };

            class level_6 {
                time = 4;
                value[] = {2,0};
            };

            class level_7 {
                time = 3.8;
                value[] = {2,1};
            };

            class level_8 {
                time = 3.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 3.2;
                value[] = {3,0};
            };

            class level_10 {
                time = 3;
                value[] = {3,1};
            };
        };
    };

    class Diamond_Prof_Gather : blueprint {
        variable = "Diamond_Prof_Gather";
        displayName = "Diamanten abbauen";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,1};
            };

            class level_3 {
                time = 9;
                value[] = {2,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {2,1};
            };

            class level_5 {
                time = 8;
                value[] = {3,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {3,1};
            };

            class level_7 {
                time = 7;
                value[] = {4,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {4,0};
            };

            class level_9 {
                time = 6;
                value[] = {4,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {4,0};
            };
        };
    };

    class Diamond_Prof : blueprint {
        variable = "Diamond_Prof";
        displayName = "Diamanten schleifen";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 6;
                value[] = {1,0};
            };

            class level_2 {
                time = 5.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 5;
                value[] = {1,1};
            };

            class level_4 {
                time = 4.8;
                value[] = {1,1};
            };

            class level_5 {
                time = 4.3;
                value[] = {2,0};
            };

            class level_6 {
                time = 4;
                value[] = {2,0};
            };

            class level_7 {
                time = 3.8;
                value[] = {2,1};
            };

            class level_8 {
                time = 3.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 3.2;
                value[] = {3,0};
            };

            class level_10 {
                time = 3;
                value[] = {3,1};
            };
        };
    };

    class Sand_Prof_Gather : blueprint {
        variable = "Sand_Prof_Gather";
        displayName = "Sand schaufeln";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {4,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {4,1};
            };

            class level_3 {
                time = 9;
                value[] = {5,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {5,1};
            };

            class level_5 {
                time = 8;
                value[] = {6,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {6,1};
            };

            class level_7 {
                time = 7;
                value[] = {7,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {7,0};
            };

            class level_9 {
                time = 6;
                value[] = {7,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {7,0};
            };
        };
    };

    class Sand_Prof : blueprint {
        variable = "Sand_Prof";
        displayName = "Sand schmelzen";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 6;
                value[] = {1,0};
            };

            class level_2 {
                time = 5.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 5;
                value[] = {1,1};
            };

            class level_4 {
                time = 4.8;
                value[] = {1,1};
            };

            class level_5 {
                time = 4.3;
                value[] = {2,0};
            };

            class level_6 {
                time = 4;
                value[] = {2,0};
            };

            class level_7 {
                time = 3.8;
                value[] = {2,1};
            };

            class level_8 {
                time = 3.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 3.2;
                value[] = {3,0};
            };

            class level_10 {
                time = 3;
                value[] = {3,1};
            };
        };
    };

    class Salt_Prof_Gather : blueprint {
        variable = "Salt_Prof_Gather";
        displayName = "Salz abbauen";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {4,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {4,1};
            };

            class level_3 {
                time = 9;
                value[] = {5,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {5,1};
            };

            class level_5 {
                time = 8;
                value[] = {6,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {6,1};
            };

            class level_7 {
                time = 7;
                value[] = {7,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {7,0};
            };

            class level_9 {
                time = 6;
                value[] = {7,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {7,0};
            };
        };
    };

    class Salt_Prof : blueprint {
        variable = "Salt_Prof";
        displayName = "Salz verarbeiten";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 6;
                value[] = {1,0};
            };

            class level_2 {
                time = 5.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 5;
                value[] = {1,1};
            };

            class level_4 {
                time = 4.8;
                value[] = {1,1};
            };

            class level_5 {
                time = 4.3;
                value[] = {2,0};
            };

            class level_6 {
                time = 4;
                value[] = {2,0};
            };

            class level_7 {
                time = 3.8;
                value[] = {2,1};
            };

            class level_8 {
                time = 3.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 3.2;
                value[] = {3,0};
            };

            class level_10 {
                time = 3;
                value[] = {3,1};
            };
        };
    };

    class Copper_Prof_Gather : blueprint {
        variable = "Copper_Prof_Gather";
        displayName = "Kupfererz abbauen";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {2,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {2,1};
            };

            class level_3 {
                time = 9;
                value[] = {3,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {3,1};
            };

            class level_5 {
                time = 8;
                value[] = {4,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {4,1};
            };

            class level_7 {
                time = 7;
                value[] = {5,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {5,0};
            };

            class level_9 {
                time = 6;
                value[] = {5,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {5,0};
            };
        };
    };

    class Copper_Prof : blueprint {
        variable = "Copper_Prof";
        displayName = "Kupfererz verarbeiten";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 6;
                value[] = {1,0};
            };

            class level_2 {
                time = 5.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 5;
                value[] = {1,1};
            };

            class level_4 {
                time = 4.8;
                value[] = {1,1};
            };

            class level_5 {
                time = 4.3;
                value[] = {2,0};
            };

            class level_6 {
                time = 4;
                value[] = {2,0};
            };

            class level_7 {
                time = 3.8;
                value[] = {2,1};
            };

            class level_8 {
                time = 3.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 3.2;
                value[] = {3,0};
            };

            class level_10 {
                time = 3;
                value[] = {3,1};
            };
        };
    };

    class Iron_Prof_Gather : blueprint {
        variable = "Iron_Prof_Gather";
        displayName = "Eisenerz abbauen";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {2,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {2,1};
            };

            class level_3 {
                time = 9;
                value[] = {3,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {3,1};
            };

            class level_5 {
                time = 8;
                value[] = {4,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {4,1};
            };

            class level_7 {
                time = 7;
                value[] = {5,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {5,0};
            };

            class level_9 {
                time = 6;
                value[] = {5,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {5,0};
            };
        };
    };

    class Iron_Prof : blueprint {
        variable = "Iron_Prof";
        displayName = "Eisenerz verarbeiten";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 6;
                value[] = {1,0};
            };

            class level_2 {
                time = 5.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 5;
                value[] = {1,1};
            };

            class level_4 {
                time = 4.8;
                value[] = {1,1};
            };

            class level_5 {
                time = 4.3;
                value[] = {2,0};
            };

            class level_6 {
                time = 4;
                value[] = {2,0};
            };

            class level_7 {
                time = 3.8;
                value[] = {2,1};
            };

            class level_8 {
                time = 3.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 3.2;
                value[] = {3,0};
            };

            class level_10 {
                time = 3;
                value[] = {3,1};
            };
        };
    };

    class silber_Prof_Gather : blueprint {
        variable = "silber_Prof_Gather";
        displayName = "Silbererz abbauen";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,1};
            };

            class level_3 {
                time = 9;
                value[] = {2,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {2,1};
            };

            class level_5 {
                time = 8;
                value[] = {3,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {3,1};
            };

            class level_7 {
                time = 7;
                value[] = {4,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {4,0};
            };

            class level_9 {
                time = 6;
                value[] = {4,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {4,0};
            };
        };
    };

    class silber_Prof : blueprint {
        variable = "silber_Prof";
        displayName = "Silbererz verarbeiten";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 6;
                value[] = {1,0};
            };

            class level_2 {
                time = 5.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 5;
                value[] = {1,1};
            };

            class level_4 {
                time = 4.8;
                value[] = {1,1};
            };

            class level_5 {
                time = 4.3;
                value[] = {2,0};
            };

            class level_6 {
                time = 4;
                value[] = {2,0};
            };

            class level_7 {
                time = 3.8;
                value[] = {2,1};
            };

            class level_8 {
                time = 3.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 3.2;
                value[] = {3,0};
            };

            class level_10 {
                time = 3;
                value[] = {3,1};
            };
        };
    };

    class gold_Prof_Gather : blueprint {
        variable = "gold_Prof_Gather";
        displayName = "Golderz abbauen";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,1};
            };

            class level_3 {
                time = 9;
                value[] = {2,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {2,1};
            };

            class level_5 {
                time = 8;
                value[] = {3,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {3,1};
            };

            class level_7 {
                time = 7;
                value[] = {4,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {4,0};
            };

            class level_9 {
                time = 6;
                value[] = {4,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {4,0};
            };
        };
    };

    class gold_Prof : blueprint {
        variable = "gold_Prof";
        displayName = "Golderz verarbeiten";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 6;
                value[] = {1,0};
            };

            class level_2 {
                time = 5.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 5;
                value[] = {1,1};
            };

            class level_4 {
                time = 4.8;
                value[] = {1,1};
            };

            class level_5 {
                time = 4.3;
                value[] = {2,0};
            };

            class level_6 {
                time = 4;
                value[] = {2,0};
            };

            class level_7 {
                time = 3.8;
                value[] = {2,1};
            };

            class level_8 {
                time = 3.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 3.2;
                value[] = {3,0};
            };

            class level_10 {
                time = 3;
                value[] = {3,1};
            };
        };
    };

    class coal_Prof_Gather : blueprint {
        variable = "coal_Prof_Gather";
        displayName = "Kohle abbauen";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {2,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {2,1};
            };

            class level_3 {
                time = 9;
                value[] = {3,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {3,1};
            };

            class level_5 {
                time = 8;
                value[] = {4,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {4,1};
            };

            class level_7 {
                time = 7;
                value[] = {5,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {5,0};
            };

            class level_9 {
                time = 6;
                value[] = {5,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {5,0};
            };
        };
    };

    class coal_Prof : blueprint {
        variable = "coal_Prof";
        displayName = "Kohle verarbeiten";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 6;
                value[] = {1,0};
            };

            class level_2 {
                time = 5.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 5;
                value[] = {1,1};
            };

            class level_4 {
                time = 4.8;
                value[] = {1,1};
            };

            class level_5 {
                time = 4.3;
                value[] = {2,0};
            };

            class level_6 {
                time = 4;
                value[] = {2,0};
            };

            class level_7 {
                time = 3.8;
                value[] = {2,1};
            };

            class level_8 {
                time = 3.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 3.2;
                value[] = {3,0};
            };

            class level_10 {
                time = 3;
                value[] = {3,1};
            };
        };
    };

    class schmuck_Prof : blueprint {
        variable = "schmuck_Prof";
        displayName = "Schmuck herstellung";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 9;
                value[] = {1,1};
            };

            class level_4 {
                time = 8.5;
                value[] = {1,1};
            };

            class level_5 {
                time = 8;
                value[] = {2,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {2,0};
            };

            class level_7 {
                time = 7;
                value[] = {2,1};
            };

            class level_8 {
                time = 6.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 6;
                value[] = {3,0};
            };

            class level_10 {
                time = 5;
                value[] = {3,1};
            };
        };
    };

    class beton_Prof : blueprint {
        variable = "beton_Prof";
        displayName = "Beton herstellung";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 9;
                value[] = {1,1};
            };

            class level_4 {
                time = 8.5;
                value[] = {1,1};
            };

            class level_5 {
                time = 8;
                value[] = {2,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {2,0};
            };

            class level_7 {
                time = 7;
                value[] = {2,1};
            };

            class level_8 {
                time = 6.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 6;
                value[] = {3,0};
            };

            class level_10 {
                time = 5;
                value[] = {3,1};
            };
        };
    };

    class stahl_Prof : blueprint {
        variable = "stahl_Prof";
        displayName = "Stahl herstellung";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 9;
                value[] = {1,1};
            };

            class level_4 {
                time = 8.5;
                value[] = {1,1};
            };

            class level_5 {
                time = 8;
                value[] = {2,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {2,0};
            };

            class level_7 {
                time = 7;
                value[] = {2,1};
            };

            class level_8 {
                time = 6.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 6;
                value[] = {3,0};
            };

            class level_10 {
                time = 5;
                value[] = {3,1};
            };
        };
    };

    class revive_Prof : blueprint {
        variable = "revive_Prof";
        displayName = "Reanimieren";
        flag = "thr";
        type = "skill";
        skilltype = "Character";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"}};
            class level_1 {
                time = 60;
            };

            class level_2 {
                time = 50;
            };

            class level_3 {
                time = 45;
            };

            class level_4 {
                time = 42;
            };

            class level_5 {
                time = 38;
            };

            class level_6 {
                time = 33;
            };

            class level_7 {
                time = 30;
            };

            class level_8 {
                time = 26;
            };

            class level_9 {
                time = 23;
            };

            class level_10 {
                time = 20;
            };
        };
    };

    class revive_civ_Prof : blueprint {
        variable = "revive_Prof";
        displayName = "Reanimieren";
        flag = "civ";
        type = "skill";
        skilltype = "Character";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"}};
            class level_1 {
                time = 100;
            };

            class level_2 {
                time = 95;
            };

            class level_3 {
                time = 80;
            };

            class level_4 {
                time = 75;
            };

            class level_5 {
                time = 70;
            };

            class level_6 {
                time = 65;
            };

            class level_7 {
                time = 60;
            };

            class level_8 {
                time = 55;
            };

            class level_9 {
                time = 50;
            };

            class level_10 {
                time = 45;
            };
        };
    };

    class revive_cop_Prof : blueprint {
        variable = "revive_Prof";
        displayName = "Reanimieren";
        flag = "cop";
        type = "skill";
        skilltype = "Character";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"}};
            class level_1 {
                time = 100;
            };

            class level_2 {
                time = 95;
            };

            class level_3 {
                time = 80;
            };

            class level_4 {
                time = 75;
            };

            class level_5 {
                time = 70;
            };

            class level_6 {
                time = 65;
            };

            class level_7 {
                time = 60;
            };

            class level_8 {
                time = 55;
            };

            class level_9 {
                time = 50;
            };

            class level_10 {
                time = 45;
            };
        };
    };

    class repair_Prof : blueprint {
        variable = "repair_Prof";
        displayName = "Reparieren";
        flag = "civ";
        type = "skill";
        skilltype = "Character";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"}};
            class level_1 {
                time = 60;
            };

            class level_2 {
                time = 50;
            };

            class level_3 {
                time = 45;
            };

            class level_4 {
                time = 42;
            };

            class level_5 {
                time = 38;
            };

            class level_6 {
                time = 33;
            };

            class level_7 {
                time = 30;
            };

            class level_8 {
                time = 26;
            };

            class level_9 {
                time = 23;
            };

            class level_10 {
                time = 20;
            };
        };
    };

    class repair_thr_Prof : blueprint {
        variable = "repair_thr_Prof";
        displayName = "THR - Reparieren";
        flag = "thr";
        type = "skill";
        skilltype = "Character";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"}};
            class level_1 {
                time = 30;
            };

            class level_2 {
                time = 27;
            };

            class level_3 {
                time = 24;
            };

            class level_4 {
                time = 22;
            };

            class level_5 {
                time = 20;
            };

            class level_6 {
                time = 19;
            };

            class level_7 {
                time = 17;
            };

            class level_8 {
                time = 15;
            };

            class level_9 {
                time = 14;
            };

            class level_10 {
                time = 12;
            };
        };
    };

    class repair_cop_Prof : blueprint {
        variable = "repair_cop_Prof";
        displayName = "Cop - Reparieren";
        flag = "cop";
        type = "skill";
        skilltype = "Character";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"}};
            class level_1 {
                time = 60;
            };

            class level_2 {
                time = 50;
            };

            class level_3 {
                time = 45;
            };

            class level_4 {
                time = 42;
            };

            class level_5 {
                time = 38;
            };

            class level_6 {
                time = 33;
            };

            class level_7 {
                time = 30;
            };

            class level_8 {
                time = 26;
            };

            class level_9 {
                time = 23;
            };

            class level_10 {
                time = 20;
            };
        };
    };

    class abschlepp_Prof : blueprint {
        variable = "abschlepp_Prof";
        displayName = "Cop - Abschleppen";
        flag = "cop";
        type = "skill";
        skilltype = "Character";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"}};
            class level_1 {
                time = 30;
            };

            class level_2 {
                time = 27;
            };

            class level_3 {
                time = 24;
            };

            class level_4 {
                time = 22;
            };

            class level_5 {
                time = 20;
            };

            class level_6 {
                time = 19;
            };

            class level_7 {
                time = 17;
            };

            class level_8 {
                time = 15;
            };

            class level_9 {
                time = 14;
            };

            class level_10 {
                time = 12;
            };
        };
    };

    class abschlepp_thr_Prof : blueprint {
        variable = "abschlepp_thr_Prof";
        displayName = "THR - Abschleppen";
        flag = "thr";
        type = "skill";
        skilltype = "Character";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"}};
            class level_1 {
                time = 30;
            };

            class level_2 {
                time = 27;
            };

            class level_3 {
                time = 24;
            };

            class level_4 {
                time = 22;
            };

            class level_5 {
                time = 20;
            };

            class level_6 {
                time = 19;
            };

            class level_7 {
                time = 17;
            };

            class level_8 {
                time = 15;
            };

            class level_9 {
                time = 14;
            };

            class level_10 {
                time = 12;
            };
        };
    };

    class running_Prof : blueprint {
        variable = "running_Prof";
        displayName = "Ausdauer";
        flag = "civ";
        type = "body";
        skilltype = "Character";
        class Levels {
            params[] = {{"meter","INT","Reichweite: "," Meter"}};
            class level_1 {
                meter = 200;
            };

            class level_2 {
                meter = 250;
            };

            class level_3 {
                meter = 300;
            };

            class level_4 {
                meter = 350;
            };

            class level_5 {
                meter = 400;
            };

            class level_6 {
                meter = 450;
            };

            class level_7 {
                meter = 500;
            };

            class level_8 {
                meter = 550;
            };

            class level_9 {
                meter = 600;
            };

            class level_10 {
                meter = 650;
            };
        };
    };

    class running_cop_Prof : blueprint {
        variable = "running_cop_Prof";
        displayName = "Ausdauer";
        flag = "cop";
        type = "body";
        skilltype = "Character";
        class Levels {
            params[] = {{"meter","INT","Reichweite: "," Meter"}};
            class level_1 {
                meter = 200;
            };

            class level_2 {
                meter = 250;
            };

            class level_3 {
                meter = 300;
            };

            class level_4 {
                meter = 350;
            };

            class level_5 {
                meter = 400;
            };

            class level_6 {
                meter = 450;
            };

            class level_7 {
                meter = 500;
            };

            class level_8 {
                meter = 550;
            };

            class level_9 {
                meter = 600;
            };

            class level_10 {
                meter = 650;
            };
        };
    };

    class running_thr_Prof : blueprint {
        variable = "running_thr_Prof";
        displayName = "Ausdauer";
        flag = "thr";
        type = "body";
        skilltype = "Character";
        class Levels {
            params[] = {{"meter","INT","Reichweite: "," Meter"}};
            class level_1 {
                meter = 200;
            };

            class level_2 {
                meter = 250;
            };

            class level_3 {
                meter = 300;
            };

            class level_4 {
                meter = 350;
            };

            class level_5 {
                meter = 400;
            };

            class level_6 {
                meter = 450;
            };

            class level_7 {
                meter = 500;
            };

            class level_8 {
                meter = 550;
            };

            class level_9 {
                meter = 600;
            };

            class level_10 {
                meter = 650;
            };
        };
    };

    class carrying_Prof : blueprint {
        variable = "carrying_Prof";
        displayName = "Stärke";
        flag = "civ";
        type = "body";
        skilltype = "Character";
        class Levels {
            params[] = {{"factor","INTP","Tragekraft: ","%"}};
            class level_1 {
                factor = 1;
            };

            class level_2 {
                factor = 1.1;
            };

            class level_3 {
                factor = 1.2;
            };

            class level_4 {
                factor = 1.3;
            };

            class level_5 {
                factor = 1.4;
            };

            class level_6 {
                factor = 1.5;
            };

            class level_7 {
                factor = 1.6;
            };

            class level_8 {
                factor = 1.7;
            };

            class level_9 {
                factor = 1.8;
            };

            class level_10 {
                factor = 2;
            };
        };
    };

    class carrying_cop_Prof : blueprint {
        variable = "carrying_cop_Prof";
        displayName = "Stärke";
        flag = "cop";
        type = "body";
        skilltype = "Character";
        class Levels {
            params[] = {{"factor","INTP","Gewicht: ","%"}};
            class level_1 {
                factor = 1;
            };

            class level_2 {
                factor = 1.1;
            };

            class level_3 {
                factor = 1.2;
            };

            class level_4 {
                factor = 1.3;
            };

            class level_5 {
                factor = 1.4;
            };

            class level_6 {
                factor = 1.5;
            };

            class level_7 {
                factor = 1.6;
            };

            class level_8 {
                factor = 1.7;
            };

            class level_9 {
                factor = 1.8;
            };

            class level_10 {
                factor = 2;
            };
        };
    };

    class carrying_thr_Prof : blueprint {
        variable = "carrying_thr_Prof";
        displayName = "Stärke";
        flag = "thr";
        type = "body";
        skilltype = "Character";
        class Levels {
            params[] = {{"factor","INTP","Dauer: ","%"}};
            class level_1 {
                factor = 1;
            };

            class level_2 {
                factor = 1.1;
            };

            class level_3 {
                factor = 1.2;
            };

            class level_4 {
                factor = 1.3;
            };

            class level_5 {
                factor = 1.4;
            };

            class level_6 {
                factor = 1.5;
            };

            class level_7 {
                factor = 1.6;
            };

            class level_8 {
                factor = 1.7;
            };

            class level_9 {
                factor = 1.8;
            };

            class level_10 {
                factor = 2;
            };
        };
    };

    class Tomato_Prof_Gather : blueprint {
        variable = "Tomato_Prof_Gather";
        displayName = "Tomaten sammeln";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {3,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {3,1};
            };

            class level_3 {
                time = 9;
                value[] = {4,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {4,1};
            };

            class level_5 {
                time = 8;
                value[] = {5,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {5,1};
            };

            class level_7 {
                time = 7;
                value[] = {6,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {6,0};
            };

            class level_9 {
                time = 6;
                value[] = {6,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {6,0};
            };
        };
    };

    class Corn_Prof_Gather : blueprint {
        variable = "Corn_Prof_Gather";
        displayName = "Mais sammeln";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {3,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {3,1};
            };

            class level_3 {
                time = 9;
                value[] = {4,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {4,1};
            };

            class level_5 {
                time = 8;
                value[] = {5,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {5,1};
            };

            class level_7 {
                time = 7;
                value[] = {6,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {6,0};
            };

            class level_9 {
                time = 6;
                value[] = {6,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {6,0};
            };
        };
    };

    class Tomato_Prof : blueprint {
        variable = "Tomato_Prof";
        displayName = "Tomaten verarbeiten";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 6;
                value[] = {1,0};
            };

            class level_2 {
                time = 5.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 5;
                value[] = {1,1};
            };

            class level_4 {
                time = 4.8;
                value[] = {1,1};
            };

            class level_5 {
                time = 4.3;
                value[] = {2,0};
            };

            class level_6 {
                time = 4;
                value[] = {2,0};
            };

            class level_7 {
                time = 3.8;
                value[] = {2,1};
            };

            class level_8 {
                time = 3.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 3.2;
                value[] = {3,0};
            };

            class level_10 {
                time = 3;
                value[] = {3,1};
            };
        };
    };

    class ketchup_Prof : blueprint {
        variable = "ketchup_Prof";
        displayName = "Ketchup herstellung";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 9;
                value[] = {1,1};
            };

            class level_4 {
                time = 8.5;
                value[] = {1,1};
            };

            class level_5 {
                time = 8;
                value[] = {2,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {2,0};
            };

            class level_7 {
                time = 7;
                value[] = {2,1};
            };

            class level_8 {
                time = 6.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 6;
                value[] = {3,0};
            };

            class level_10 {
                time = 5;
                value[] = {3,1};
            };
        };
    };

    class sugarCane_Prof_Gather : blueprint {
        variable = "sugarCane_Prof_Gather";
        displayName = "Zuckerrohr sammeln";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {3,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {3,1};
            };

            class level_3 {
                time = 9;
                value[] = {4,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {4,1};
            };

            class level_5 {
                time = 8;
                value[] = {5,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {5,1};
            };

            class level_7 {
                time = 7;
                value[] = {6,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {6,0};
            };

            class level_9 {
                time = 6;
                value[] = {6,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {6,0};
            };
        };
    };

    class sugarCane_Prof : blueprint {
        variable = "sugarCane_Prof";
        displayName = "Zuckerrohr verarbeitung";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 6;
                value[] = {1,0};
            };

            class level_2 {
                time = 5.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 5;
                value[] = {1,1};
            };

            class level_4 {
                time = 4.8;
                value[] = {1,1};
            };

            class level_5 {
                time = 4.3;
                value[] = {2,0};
            };

            class level_6 {
                time = 4;
                value[] = {2,0};
            };

            class level_7 {
                time = 3.8;
                value[] = {2,1};
            };

            class level_8 {
                time = 3.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 3.2;
                value[] = {3,0};
            };

            class level_10 {
                time = 3;
                value[] = {3,1};
            };
        };
    };

    class silicium_Prof_Gather : blueprint {
        variable = "silicium_Prof_Gather";
        displayName = "Silizium abbauen";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {3,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {3,1};
            };

            class level_3 {
                time = 9;
                value[] = {4,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {4,1};
            };

            class level_5 {
                time = 8;
                value[] = {5,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {5,1};
            };

            class level_7 {
                time = 7;
                value[] = {6,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {6,0};
            };

            class level_9 {
                time = 6;
                value[] = {6,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {6,0};
            };
        };
    };

    class sulfuric_Prof : blueprint {
        variable = "sulfuric_Prof";
        displayName = "Schwefel verarbeitung";
        flag = "civ";
        type = "illegal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 8;
                value[] = {1,0};
            };

            class level_2 {
                time = 7.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 7;
                value[] = {1,1};
            };

            class level_4 {
                time = 6.5;
                value[] = {1,1};
            };

            class level_5 {
                time = 6;
                value[] = {2,0};
            };

            class level_6 {
                time = 5.5;
                value[] = {2,0};
            };

            class level_7 {
                time = 5.5;
                value[] = {2,1};
            };

            class level_8 {
                time = 5;
                value[] = {2,1};
            };

            class level_9 {
                time = 5;
                value[] = {3,0};
            };

            class level_10 {
                time = 4;
                value[] = {3,1};
            };
        };
    };

    class plastic_Prof : blueprint {
        variable = "plastic_Prof";
        displayName = "Plastik herstellung";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 6;
                value[] = {1,0};
            };

            class level_2 {
                time = 5.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 5;
                value[] = {1,1};
            };

            class level_4 {
                time = 4.8;
                value[] = {1,1};
            };

            class level_5 {
                time = 4.3;
                value[] = {2,0};
            };

            class level_6 {
                time = 4;
                value[] = {2,0};
            };

            class level_7 {
                time = 3.8;
                value[] = {2,1};
            };

            class level_8 {
                time = 3.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 3.2;
                value[] = {3,0};
            };

            class level_10 {
                time = 3;
                value[] = {3,1};
            };
        };
    };

    class fsalad_Prof : blueprint {
        variable = "fsalad_Prof";
        displayName = "Obstsalat herstellung";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 9;
                value[] = {1,1};
            };

            class level_4 {
                time = 8.5;
                value[] = {1,1};
            };

            class level_5 {
                time = 8;
                value[] = {2,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {2,0};
            };

            class level_7 {
                time = 7;
                value[] = {2,1};
            };

            class level_8 {
                time = 6.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 6;
                value[] = {3,0};
            };

            class level_10 {
                time = 5;
                value[] = {3,1};
            };
        };
    };

    class wine_Prof : blueprint {
        variable = "wine_Prof";
        displayName = "Wein herstellung";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 9;
                value[] = {1,1};
            };

            class level_4 {
                time = 8.5;
                value[] = {1,1};
            };

            class level_5 {
                time = 8;
                value[] = {2,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {2,0};
            };

            class level_7 {
                time = 7;
                value[] = {2,1};
            };

            class level_8 {
                time = 6.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 6;
                value[] = {3,0};
            };

            class level_10 {
                time = 5;
                value[] = {3,1};
            };
        };
    };

    class cBoard_Prof : blueprint {
        variable = "cBoard_Prof";
        displayName = "Platinen herstellung";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 9;
                value[] = {1,1};
            };

            class level_4 {
                time = 8.5;
                value[] = {1,1};
            };

            class level_5 {
                time = 8;
                value[] = {2,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {2,0};
            };

            class level_7 {
                time = 7;
                value[] = {2,1};
            };

            class level_8 {
                time = 6.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 6;
                value[] = {3,0};
            };

            class level_10 {
                time = 5;
                value[] = {3,1};
            };
        };
    };

    class smartPhone_Prof : blueprint {
        variable = "smartPhone_Prof";
        displayName = "Smartphone herstellung";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 9;
                value[] = {1,1};
            };

            class level_4 {
                time = 8.5;
                value[] = {1,1};
            };

            class level_5 {
                time = 8;
                value[] = {2,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {2,0};
            };

            class level_7 {
                time = 7;
                value[] = {2,1};
            };

            class level_8 {
                time = 6.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 6;
                value[] = {3,0};
            };

            class level_10 {
                time = 5;
                value[] = {3,1};
            };
        };
    };

    class battery_Prof : blueprint {
        variable = "battery_Prof";
        displayName = "Batterie herstellung";
        flag = "civ";
        type = "legal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 6;
                value[] = {1,0};
            };

            class level_2 {
                time = 5.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 5;
                value[] = {1,1};
            };

            class level_4 {
                time = 4.8;
                value[] = {1,1};
            };

            class level_5 {
                time = 4.3;
                value[] = {2,0};
            };

            class level_6 {
                time = 4;
                value[] = {2,0};
            };

            class level_7 {
                time = 3.8;
                value[] = {2,1};
            };

            class level_8 {
                time = 3.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 3.2;
                value[] = {3,0};
            };

            class level_10 {
                time = 3;
                value[] = {3,1};
            };
        };
    };

    class c4_Prof : blueprint {
        variable = "c4_Prof";
        displayName = "C4 herstellung";
        flag = "civ";
        type = "illegal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 9;
                value[] = {1,1};
            };

            class level_4 {
                time = 8.5;
                value[] = {1,1};
            };

            class level_5 {
                time = 8;
                value[] = {2,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {2,0};
            };

            class level_7 {
                time = 7;
                value[] = {2,1};
            };

            class level_8 {
                time = 6.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 6;
                value[] = {3,0};
            };

            class level_10 {
                time = 5;
                value[] = {3,1};
            };
        };
    };

    class mShine_Prof : blueprint {
        variable = "mShine_Prof";
        displayName = "Schwarzgebranntes herstellen";
        flag = "civ";
        type = "illegal";
        skilltype = "Process";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,0};
            };

            class level_3 {
                time = 9;
                value[] = {1,1};
            };

            class level_4 {
                time = 8.5;
                value[] = {1,1};
            };

            class level_5 {
                time = 8;
                value[] = {2,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {2,0};
            };

            class level_7 {
                time = 7;
                value[] = {2,1};
            };

            class level_8 {
                time = 6.5;
                value[] = {2,1};
            };

            class level_9 {
                time = 6;
                value[] = {3,0};
            };

            class level_10 {
                time = 5;
                value[] = {3,1};
            };
        };
    };

    class sulfuric_Prof_Gather : blueprint {
        variable = "sulfuric_Prof_Gather";
        displayName = "Schwefel abbauen";
        flag = "civ";
        type = "legal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {3,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {3,1};
            };

            class level_3 {
                time = 9;
                value[] = {4,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {4,1};
            };

            class level_5 {
                time = 8;
                value[] = {5,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {5,1};
            };

            class level_7 {
                time = 7;
                value[] = {6,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {6,0};
            };

            class level_9 {
                time = 6;
                value[] = {6,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {6,0};
            };
        };
    };

    class trigger_Prof_gather : blueprint {
        variable = "trigger_Prof_gather";
        displayName = "Sprengkomponente stehlen";
        flag = "civ";
        type = "illegal";
        skilltype = "Gather";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"},{"value","ARRAY","Menge: "," Einheiten"}};
            class level_1 {
                time = 10;
                value[] = {1,0};
            };

            class level_2 {
                time = 9.5;
                value[] = {1,1};
            };

            class level_3 {
                time = 9;
                value[] = {2,0};
            };

            class level_4 {
                time = 8.5;
                value[] = {2,1};
            };

            class level_5 {
                time = 8;
                value[] = {3,0};
            };

            class level_6 {
                time = 7.5;
                value[] = {3,1};
            };

            class level_7 {
                time = 7;
                value[] = {4,0};
            };

            class level_8 {
                time = 6.5;
                value[] = {4,0};
            };

            class level_9 {
                time = 6;
                value[] = {4,0};
            };

            class level_10 {
                time = 5.5;
                value[] = {4,0};
            };
        };
    };

    class mag_Prof : blueprint {
        variable = "mag_Prof";
        displayName = "Magazine-Zusammenpacken";
        flag = "civ";
        type = "skill";
        skilltype = "Character";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"}};
            class level_1 {
                time = 60;
            };

            class level_2 {
                time = 50;
            };

            class level_3 {
                time = 45;
            };

            class level_4 {
                time = 40;
            };

            class level_5 {
                time = 35;
            };

            class level_6 {
                time = 30;
            };

            class level_7 {
                time = 25;
            };

            class level_8 {
                time = 20;
            };

            class level_9 {
                time = 15;
            };

            class level_10 {
                time = 10;
            };
        };
    };

    class mag_Prof_cop : blueprint {
        variable = "mag_Prof_cop";
        displayName = "Magazine-Zusammenpacken";
        flag = "cop";
        type = "skill";
        skilltype = "Character";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"}};
            class level_1 {
                time = 60;
            };

            class level_2 {
                time = 50;
            };

            class level_3 {
                time = 45;
            };

            class level_4 {
                time = 40;
            };

            class level_5 {
                time = 35;
            };

            class level_6 {
                time = 30;
            };

            class level_7 {
                time = 25;
            };

            class level_8 {
                time = 20;
            };

            class level_9 {
                time = 15;
            };

            class level_10 {
                time = 10;
            };
        };
    };

    class search_player : blueprint {
        variable = "search_player";
        displayName = "Personen-Durchsuchung";
        flag = "cop";
        type = "skill";
        skilltype = "Character";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"}};
            class level_1 {
                time = 30;
            };

            class level_2 {
                time = 20;
            };

            class level_3 {
                time = 18;
            };

            class level_4 {
                time = 16;
            };

            class level_5 {
                time = 14;
            };

            class level_6 {
                time = 12;
            };

            class level_7 {
                time = 11;
            };

            class level_8 {
                time = 10;
            };

            class level_9 {
                time = 8;
            };

            class level_10 {
                time = 5;
            };
        };
    };


    class search_veh : blueprint {
        variable = "search_veh";
        displayName = "Fahrzeug-Durchsuchung";
        flag = "cop";
        type = "skill";
        skilltype = "Character";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"}};
            class level_1 {
                time = 60;
            };

            class level_2 {
                time = 50;
            };

            class level_3 {
                time = 45;
            };

            class level_4 {
                time = 40;
            };

            class level_5 {
                time = 35;
            };

            class level_6 {
                time = 30;
            };

            class level_7 {
                time = 25;
            };

            class level_8 {
                time = 20;
            };

            class level_9 {
                time = 15;
            };

            class level_10 {
                time = 10;
            };
        };
    };

    class mag_Prof_thr : blueprint {
        variable = "mag_Prof_thr";
        displayName = "Magazine-Zusammenpacken";
        flag = "cop";
        type = "skill";
        skilltype = "Character";
        class Levels {
            params[] = {{"time","INTP","Dauer: ","%"}};
            class level_1 {
                time = 60;
            };

            class level_2 {
                time = 50;
            };

            class level_3 {
                time = 45;
            };

            class level_4 {
                time = 40;
            };

            class level_5 {
                time = 35;
            };

            class level_6 {
                time = 30;
            };

            class level_7 {
                time = 25;
            };

            class level_8 {
                time = 20;
            };

            class level_9 {
                time = 15;
            };

            class level_10 {
                time = 10;
            };
        };
    };
};