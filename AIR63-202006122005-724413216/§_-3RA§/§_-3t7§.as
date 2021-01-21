package §_-3RA§
{
   import §_-05d§.§_-00n§;
   import §_-05d§.§_-3fJ§;
   import §_-05d§.§_-Ps§;
   import §_-05d§.§_-hp§;
   import §_-0Jq§.§_-0NB§;
   import §_-0Jq§.§_-zb§;
   import §_-0u3§.§_-Dn§;
   import §_-0u3§.§_-OH§;
   import §_-1la§.§_-1H2§;
   import §_-1la§.§_-4Pn§;
   import §_-1tx§.§_-06B§;
   import §_-2T5§.LayoutGroup;
   import §_-2T5§.§_-0mH§;
   import §_-2T5§.§_-11E§;
   import §_-2T5§.§_-3-o§;
   import §_-2T5§.§_-a6§;
   import §_-2T5§.§_-eo§;
   import §_-3CR§.§_-1qS§;
   import §_-3CR§.§_-27Y§;
   import §_-4Sp§.GestureEvent;
   import §_-Dk§.§_-2u6§;
   import §_-Dk§.§_-4jI§;
   import §_-pM§.§_-7C§;
   import §_-va§.§_-0La§;
   import flash.utils.setTimeout;
   import starling.core.Starling;
   import starling.display.Button;
   import starling.display.Quad;
   import starling.events.Event;
   import starling.events.Touch;
   import starling.events.TouchEvent;
   import starling.textures.Texture;
   
   public class §_-3t7§
   {
      
      private static const §_-4UC§:int = 800;
      
      private static const §_-24w§:int = 0;
      
      private static const §_-0EO§:int = 1;
      
      private static const §_-1cp§:String = "speak";
      
      private static const §_-1FO§:String = "shout";
      
      private static const §_-1D5§:String = "whisper";
      
      private static var §_-3KZ§:Boolean;
       
      
      private var §_-4Ri§:§_-0La§;
      
      private var §_-0JI§:LayoutGroup;
      
      private var §_-0eE§:LayoutGroup;
      
      private var §_-4RW§:§_-U§;
      
      private var §_-aU§:starling.display.Button;
      
      private var §_-3lT§:§_-eo§;
      
      private var §_-3fx§:§_-0mH§;
      
      private var §_-0ww§:§_-06B§;
      
      private var §_-2Rs§:§_-3-o§;
      
      private var §_-2rl§:§_-OH§;
      
      private var §_-1FX§:§_-a6§;
      
      private var §_-3qp§:Quad;
      
      private var _state:int = -1;
      
      private var §_-2XU§:Array;
      
      private var §_-A1§:Boolean;
      
      private var _disposed:Boolean;
      
      private var §_-3fM§:§_-2T5§.Button;
      
      public function §_-3t7§(param1:§_-0La§)
      {
         super();
         §_-4Ri§ = param1;
         §_-4RW§ = new §_-U§(param1);
         §_-2XU§ = [];
         §_-3KZ§ = !§_-7C§.§_-4Em§();
         §_-2oM§();
         createView();
      }
      
      public function dispose() : void
      {
         Starling.current.stage.removeEventListener("resize",onResize);
         if(§_-4RW§)
         {
            §_-4RW§.dispose();
            §_-4RW§ = null;
         }
         if(§_-3lT§)
         {
            §_-3lT§.removeEventListener("enter",§_-009§);
            §_-3lT§.removeEventListener("softKeyboardActivate",§_-46b§);
            §_-3lT§.removeEventListener("softKeyboardDeactivate",§_-4Hk§);
            §_-3lT§.removeFromParent();
            §_-3lT§.dispose();
            §_-3lT§ = null;
         }
         if(§_-aU§)
         {
            §_-aU§.removeFromParent();
            §_-aU§.dispose();
            §_-aU§ = null;
         }
         if(§_-3fx§)
         {
            §_-3fx§.removeFromParent();
            §_-3fx§.dispose();
            §_-3fx§ = null;
         }
         if(§_-2Rs§)
         {
            §_-2Rs§.close(true);
            §_-2Rs§ = null;
         }
         if(§_-0ww§)
         {
            §_-0ww§.removeAll();
            §_-0ww§ = null;
         }
         if(§_-0JI§)
         {
            §_-0JI§.removeFromParent();
            §_-0JI§.dispose();
            §_-0JI§ = null;
         }
         if(§_-3qp§)
         {
            §_-3qp§.dispose();
            §_-3qp§ = null;
         }
         if(§_-0eE§)
         {
            if(§_-zb§.§_-3HU§(§_-0eE§))
            {
               §_-zb§.§_-08-§(§_-0eE§);
            }
            §_-0eE§.dispose();
            §_-0eE§ = null;
         }
         §_-2XU§ = null;
         §_-4Ri§ = null;
         _disposed = true;
      }
      
      public function get view() : §_-0NB§
      {
         return §_-0JI§;
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(_disposed)
         {
            return;
         }
         §_-1Mx§();
         §_-0JI§.visible = param1;
      }
      
      public function §_-4RO§(param1:String) : void
      {
         var _loc6_:* = 0;
         var _loc5_:* = null;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         if(§_-2XU§.indexOf(param1) != -1)
         {
            return;
         }
         §_-2XU§.push(param1);
         if(§_-2XU§.length > 5)
         {
            §_-2XU§.shift();
         }
         if(§_-3fx§)
         {
            _loc6_ = 0;
            _loc5_ = §_-30K§();
            §_-3fx§.dataProvider = _loc5_;
            _loc2_ = _loc5_.length;
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = _loc5_.getItemAt(_loc4_);
               if(_loc3_.target == param1)
               {
                  _loc6_ = _loc4_;
                  break;
               }
               _loc4_++;
            }
            §_-3fx§.selectedIndex = _loc6_;
         }
      }
      
      private function createView() : void
      {
         §_-33b§();
         §_-wQ§();
      }
      
      private function §_-33b§() : void
      {
         §_-0JI§ = new LayoutGroup();
         §_-0JI§.addEventListener("initialize",§_-2-J§);
         var _loc4_:int = §_-7C§.§_-kn§(500);
         var _loc3_:Texture = HitchTheme.getTexture("toolbar_chatinput_button");
         §_-aU§ = new starling.display.Button(_loc3_);
         §_-aU§.addEventListener("touch",§_-3rf§);
         var _loc8_:* = §_-7C§.§_-2Tc§();
         §_-aU§.scaleY = _loc8_;
         §_-aU§.scaleX = _loc8_;
         var _loc1_:§_-eo§ = new §_-eo§();
         _loc1_.§_-1BV§ = false;
         _loc1_.prompt = "${just.say.hi}";
         _loc1_.addEventListener("touch",§_-3rf§);
         _loc1_.styleNameList.add("toolbar_chatinput");
         _loc1_.height = §_-aU§.height;
         _loc1_.width = _loc4_;
         §_-0JI§.addChild(_loc1_);
         var _loc2_:LayoutGroup = new LayoutGroup();
         var _loc7_:§_-1H2§ = new §_-1H2§();
         _loc7_.horizontalAlign = "right";
         _loc2_.layout = _loc7_;
         _loc2_.width = _loc4_;
         §_-0JI§.addChild(_loc2_);
         _loc2_.addChild(§_-aU§);
         var _loc5_:§_-2u6§ = new §_-2u6§(§_-aU§);
         _loc5_.§if § = 800;
         _loc5_.addEventListener("gestureBegan",§_-a§,false,0,true);
         var _loc6_:§_-4jI§ = new §_-4jI§(§_-aU§);
         _loc6_.direction = 4;
         _loc6_.addEventListener("gestureRecognized",§_-9F§);
      }
      
      private function §_-wQ§() : void
      {
         §_-0eE§ = §_-1qS§.§_-4Pq§();
         var _loc1_:int = §_-7C§.§_-kn§(20);
         var _loc2_:§_-a6§ = HitchTheme.§_-1EG§("chat_history");
         _loc2_.§_-3nI§ = §_-7C§.§_-kn§(150);
         _loc2_.addEventListener("touch",§_-41x§);
         _loc2_.layoutData = new §_-4Pn§(NaN,NaN,NaN,0,NaN,0);
         §_-0eE§.addChild(_loc2_);
         §_-1FX§ = new §_-a6§();
         §_-1FX§.addEventListener("touch",§_-2zH§);
         §_-1FX§.§_-3nI§ = §_-7C§.§_-kn§(150);
         §_-1FX§.§_-0Yg§ = §_-7C§.§_-kn§(150);
         §_-1FX§.layoutData = §_-27Y§.§_-0k8§(_loc1_,_loc2_,0);
         §_-1FX§.width = 55;
         §_-0m§(§_-26c§());
         §_-0eE§.addChild(§_-1FX§);
         §_-3fx§ = new §_-0mH§();
         §_-3fx§.dataProvider = §_-30K§();
         §_-3fx§.selectedIndex = 0;
         §_-3fx§.styleNameList.add("alternate-chat-picker");
         §_-3fx§.§_-1Wq§ = "alternate-no-border-picker-list";
         §_-3fx§.§_-3LS§ = "alternate-secondary-picker";
         §_-3fx§.addEventListener("change",§_-BC§);
         §_-3fx§.addEventListener("scroll",§_-BC§);
         §_-3fx§.addEventListener("open",§_-BC§);
         §_-3fx§.layoutData = §_-27Y§.§_-0k8§(_loc1_,§_-1FX§,0);
         §_-0eE§.addChild(§_-3fx§);
         §_-3fM§ = new §_-2T5§.Button();
         §_-3fM§.label = "${send}";
         §_-3fM§.addEventListener("triggered",§_-12Q§);
         §_-3fM§.layoutData = new §_-4Pn§(NaN,3,NaN,NaN,NaN,0);
         §_-0eE§.addChild(§_-3fM§);
         §_-3lT§ = new §_-eo§();
         §_-3lT§.§_-1BV§ = true;
         §_-3lT§.isFocusEnabled = true;
         §_-3lT§.maxChars = 150;
         §_-3lT§.addEventListener("enter",§_-009§);
         §_-3lT§.addEventListener("softKeyboardActivate",§_-46b§);
         §_-3lT§.styleNameList.add("alternate-chat-input");
         §_-3lT§.layoutData = §_-27Y§.§_-2g-§(_loc1_,§_-3fx§,§_-3fM§,0);
         §_-3lT§.§_-2Pq§.multiline = false;
         §_-3lT§.§_-2Pq§.returnKeyLabel = "go";
         §_-0eE§.addChild(§_-3lT§);
         if(§_-7C§.§_-4Em§())
         {
            §_-3lT§.addEventListener("softKeyboardDeactivate",§_-4Hk§);
         }
         §_-0eE§.validate();
         Starling.current.stage.addEventListener("resize",onResize);
         onResize(null);
      }
      
      private function §_-2-J§(param1:Event) : void
      {
         if(!§_-4Ri§)
         {
            return;
         }
         §_-1Mx§();
      }
      
      private function onResize(param1:Event) : void
      {
         var _loc4_:int = §_-7C§.§_-12T§();
         if(_loc4_ == 2)
         {
            §_-1Zd§();
         }
         else
         {
            §_-1Zd§();
         }
         var _loc3_:int = §_-7C§.§_-kn§(100);
         var _loc5_:int = §_-7C§.§_-kn§(2000);
         var _loc2_:int = Starling.current.stage.stageWidth;
         if(_loc2_ > _loc5_ + 2 * _loc3_)
         {
            §_-0eE§.width = _loc5_;
            _loc3_ = _loc2_ - _loc5_ - 2 * _loc3_;
         }
         else
         {
            §_-0eE§.width = int(_loc2_ - 2 * _loc3_);
         }
         §_-0eE§.x = _loc3_;
      }
      
      private function §_-3rf§(param1:TouchEvent) : void
      {
         var _loc3_:Touch = param1.touches[0];
         var _loc2_:Boolean = param1.ctrlKey || param1.shiftKey;
         if(_loc3_.phase == "ended")
         {
            if(§_-A1§)
            {
               §_-A1§ = false;
               return;
            }
            §_-3rL§(_loc2_);
         }
      }
      
      private function §_-12Q§(param1:Event) : void
      {
         if(§_-3KR§())
         {
            §_-1Mx§();
            Starling.current.nativeStage.focus = null;
         }
      }
      
      private function §_-41x§(param1:TouchEvent) : void
      {
         if(param1.touches[0].phase == "ended")
         {
            §_-0Es§();
         }
      }
      
      private function §_-a§(param1:GestureEvent) : void
      {
         §_-0Es§();
      }
      
      private function §_-9F§(param1:GestureEvent) : void
      {
         §_-0Es§();
      }
      
      private function §_-46b§(param1:Event) : void
      {
         var _loc2_:int = 0;
         if(!§_-7C§.§_-4Em§())
         {
            _loc2_ = Starling.current.nativeStage.softKeyboardRect.height;
            §_-0eE§.y = Starling.current.stage.stageHeight - _loc2_ - §_-0eE§.height;
         }
      }
      
      private function §_-4Hk§(param1:Event) : void
      {
         §_-009§(param1);
      }
      
      private function §_-0Es§() : void
      {
         if(!§_-4Ri§ || !§_-4Ri§.desktop)
         {
            return;
         }
         §_-A1§ = true;
         §_-4Ri§.desktop.§_-46V§();
      }
      
      private function §_-2zH§(param1:TouchEvent) : void
      {
         if(param1.touches[0].phase == "ended")
         {
            §_-0yY§();
         }
         §_-VU§();
      }
      
      private function §_-BC§(param1:Event) : void
      {
         §_-VU§();
      }
      
      private function §_-009§(param1:Event) : void
      {
         if(§_-3KR§())
         {
            if(!§_-3KZ§)
            {
               §_-1Mx§();
               Starling.current.nativeStage.focus = null;
            }
         }
      }
      
      public function §_-3rL§(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(_disposed || _state == 1)
         {
            return;
         }
         §_-4Ri§.habboUI.§_-2RH§();
         if(param1)
         {
            §_-1Zd§();
         }
         else
         {
            _loc2_ = Starling.current.nativeStage.softKeyboardRect.height;
            if(_loc2_ == 0)
            {
               §_-1Zd§();
            }
         }
         _state = 1;
         if(!§_-zb§.§_-3HU§(§_-0eE§))
         {
            §_-zb§.§_-3oz§(§_-0eE§,true,false,§_-2lV§);
         }
         setTimeout(§_-VU§,100);
      }
      
      private function §_-1Mx§() : void
      {
         if(_disposed || _state == 0)
         {
            return;
         }
         _state = 0;
         if(§_-0eE§)
         {
            if(§_-zb§.§_-3HU§(§_-0eE§))
            {
               §_-zb§.§_-08-§(§_-0eE§);
            }
         }
         §_-3lT§.§_-30S§();
         §_-4Ri§.communication.connection.send(new §_-00n§());
      }
      
      private function §_-1Zd§() : void
      {
         var _loc1_:int = §_-7C§.§_-kn§(160);
         §_-0eE§.y = Starling.current.stage.stageHeight - _loc1_ - §_-0eE§.height;
      }
      
      private function §_-VU§() : void
      {
         if(_disposed || _state == 0)
         {
            return;
         }
         if(!§_-3lT§.§_-042§)
         {
            §_-3lT§.setFocus();
         }
      }
      
      private function §_-3KR§() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:String = §_-3lT§.text;
         if(_loc1_ && _loc1_ != "")
         {
            if(!§_-4RW§.§_-3k5§(_loc1_))
            {
               _loc2_ = §_-3fx§.§_-yW§;
               _loc3_ = §_-26c§();
               var _loc4_:* = _loc2_.type;
               switch(_loc4_)
               {
                  case "speak":
                     §_-4Ri§.communication.connection.send(new §_-3fJ§(§_-3lT§.text,_loc3_.§_-4Yc§));
                     break;
                  case "shout":
                     §_-4Ri§.communication.connection.send(new §_-Ps§(§_-3lT§.text,_loc3_.§_-4Yc§));
                     break;
                  case "whisper":
                     §_-4Ri§.communication.connection.send(new §_-hp§(_loc2_.target,§_-3lT§.text,_loc3_.§_-4Yc§));
               }
            }
            §_-3lT§.text = "";
            return true;
         }
         return false;
      }
      
      private function §_-2lV§() : Quad
      {
         if(!§_-3qp§)
         {
            §_-3qp§ = new Quad(4,4,0);
            §_-3qp§.alpha = 0.01;
         }
         §_-3qp§.removeEventListeners();
         §_-3qp§.addEventListener("touch",§_-4-f§);
         return §_-3qp§;
      }
      
      private function §_-4-f§(param1:TouchEvent) : void
      {
         var _loc2_:Touch = param1.touches[0];
         if(_loc2_.phase == "ended")
         {
            §_-1Mx§();
         }
      }
      
      private function §_-0yY§() : void
      {
         if(!§_-1FX§.stage)
         {
            return;
         }
         var _loc1_:§_-11E§ = new §_-11E§();
         _loc1_.styleNameList.add("list-grid-layout");
         _loc1_.styleNameList.add("list-grid-no-square-tiles");
         _loc1_.horizontalScrollPolicy = "off";
         _loc1_.scrollBarDisplayMode = "fixed";
         _loc1_.itemRendererProperties.labelField = "emptyLabel";
         _loc1_.itemRendererProperties.iconSourceField = "selectorPreview";
         _loc1_.addEventListener("change",§_-3ff§);
         _loc1_.addEventListener("scroll",§_-BC§);
         _loc1_.dataProvider = §_-0ww§;
         _loc1_.maxWidth = Starling.current.stage.stageWidth - §_-7C§.§_-kn§(100);
         _loc1_.maxHeight = §_-7C§.§_-kn§(300);
         §_-2Rs§ = §_-3-o§.show(_loc1_,§_-1FX§,"up",true,§_-47e§);
         §_-2Rs§.addEventListener("removedFromStage",§_-t6§);
         §_-2Rs§.§_-1zM§ = true;
      }
      
      private function §_-47e§() : §_-3-o§
      {
         var _loc1_:§_-3-o§ = §_-3-o§.§_-2Ij§();
         _loc1_.styleNameList.add("alternate-secondary-callout");
         _loc1_.§_-1zM§ = true;
         return _loc1_;
      }
      
      private function §_-t6§(param1:Event) : void
      {
         if(§_-2Rs§)
         {
            §_-2Rs§.dispose();
            §_-2Rs§ = null;
         }
      }
      
      private function §_-3ff§(param1:Event) : void
      {
         var _loc2_:§_-11E§ = param1.target as §_-11E§;
         §_-0m§(_loc2_.§_-yW§ as §_-OH§);
         if(§_-2Rs§)
         {
            §_-2Rs§.close();
         }
         §_-VU§();
      }
      
      private function §_-26c§() : §_-OH§
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(!§_-2rl§)
         {
            §_-2rl§ = §_-0ww§.getItemAt(0) as §_-OH§;
            _loc1_ = 0;
            while(_loc1_ < §_-0ww§.length)
            {
               _loc2_ = §_-0ww§.getItemAt(_loc1_) as §_-OH§;
               if(_loc2_.§_-4Yc§ == §_-4Ri§.habboUI.sessionDataManager.§_-0q-§)
               {
                  §_-2rl§ = _loc2_;
                  break;
               }
               _loc1_++;
            }
         }
         return §_-2rl§;
      }
      
      private function §_-0m§(param1:§_-OH§) : void
      {
         if(param1)
         {
            §_-4Ri§.habboUI.sessionDataManager.§_-0q-§ = param1.§_-4Yc§;
         }
         §_-2rl§ = param1;
         §_-1FX§.source = param1.selectorPreview;
      }
      
      private function §_-30K§() : §_-06B§
      {
         var _loc2_:§_-06B§ = new §_-06B§();
         _loc2_.addItem({
            "label":"${widgets.chatinput.say}",
            "type":"speak",
            "target":null
         });
         _loc2_.addItem({
            "label":"${widgets.chatinput.shout}",
            "type":"shout",
            "target":null
         });
         var _loc1_:String = §_-4Ri§.habboUI.localization.getLocalization("infostand.button.whisper");
         var _loc5_:int = 0;
         var _loc4_:* = §_-2XU§;
         for each(var _loc3_ in §_-2XU§)
         {
            _loc2_.addItem({
               "label":_loc1_ + " " + _loc3_,
               "type":"whisper",
               "target":_loc3_
            });
         }
         return _loc2_;
      }
      
      private function §_-2oM§() : void
      {
         var _loc8_:* = null;
         §_-0ww§ = new §_-06B§();
         var _loc4_:Array = §_-4Ri§.habboUI.getProperty("disabled.custom.chat.styles").split(",");
         var _loc6_:§_-Dn§ = §_-4Ri§.§_-3v-§.§_-0FQ§;
         var _loc1_:Array = _loc6_.§_-18P§();
         var _loc7_:Boolean = §_-4Ri§.habboUI.sessionDataManager.§_-1G2§;
         var _loc2_:* = §_-4Ri§.habboUI.sessionDataManager.§_-0Q9§ >= 1;
         var _loc3_:Boolean = §_-4Ri§.habboUI.sessionDataManager.§_-2Qt§(4);
         var _loc10_:int = 0;
         var _loc9_:* = _loc1_;
         for each(var _loc5_ in _loc1_)
         {
            _loc8_ = _loc6_.§_-0Rq§(_loc5_);
            if(!_loc8_.§_-1N8§ && _loc4_.indexOf(_loc5_.toString()) == -1)
            {
               if(_loc8_.§_-3I8§)
               {
                  if(_loc7_ || _loc3_)
                  {
                     §_-0ww§.push(_loc8_);
                  }
               }
               else if(!_loc8_.§_-M9§ || _loc2_)
               {
                  §_-0ww§.push(_loc8_);
               }
            }
            else if(_loc8_.§_-1iZ§ && _loc3_)
            {
               §_-0ww§.push(_loc8_);
            }
         }
      }
   }
}
