/*
  File: MouseHint.hpp
  Date:   15.07.16
  Author: Patrick "Lucian" Schmidt
  Disclaimer: No one has the permission to use and edit my scripts without my permission.
*/

class MouseHint {
  idd = 9930;
  enableSimulation = 1;
  movingEnable = 0;
  fadeIn=0.5;
  fadeOut=0.5;
  duration = 10e10;
  onLoad = "uiNamespace setVariable ['MouseHint_Display', _this select 0];";

  class controls {
    class SelectIcon: RscInteractionHelperIcon{
      idc = 1200;
      text = "images\ui\mouse_left_ca.paa";
      y = 17.5 * GUI_GRID_H;
      w = 1 * GUI_GRID_W;
      h = 1 * GUI_GRID_H;
    };
    class SelectText: RscInteractionText{
      idc = 1000;
      y = 17 * GUI_GRID_H;
      //text = $STR_AGM_Interaction_MakeSelection;
    };
    class GoBackIcon: RscInteractionHelperIcon{
      idc = 1201;
      text = "images\ui\mouse_right_ca.paa";
      y = 19.5 * GUI_GRID_H;
      w = 1 * GUI_GRID_W;
      h = 1 * GUI_GRID_H;
    };
    class GoBackText: RscInteractionText{
      idc = 1001;
      y = 19 * GUI_GRID_H;
      //text = $STR_AGM_Interaction_Back;
    };
    class ScrollIcon: RscInteractionHelperIcon{
      idc = 1202;
      text = "images\ui\mouse_scroll_ca.paa";
      y = 18.5 * GUI_GRID_H;
      w = 1 * GUI_GRID_W;
      h = 1 * GUI_GRID_H;
    };
    class ScrollText: RscInteractionText{
      idc = 1002;
      y = 18 * GUI_GRID_H;
      //text = $STR_AGM_Interaction_ScrollHint;
    };
  };
};