package §_-1md§
{
   import §_-0Jq§.§_-0NB§;
   import §_-1Pm§.§_-1OW§;
   import §_-1Pm§.§_-2Y2§;
   import §_-1Pm§.§_-lp§;
   import §_-1la§.§_-1H2§;
   import §_-1la§.§_-4Pn§;
   import §_-1la§.§_-l-§;
   import §_-2RF§.§_-3TZ§;
   import §_-2T5§.Button;
   import §_-2T5§.LayoutGroup;
   import §_-2T5§.§_-0n7§;
   import §_-2T5§.§_-2UZ§;
   import §_-2T5§.§_-3-o§;
   import §_-2T5§.§_-a6§;
   import §_-2T5§.§_-eo§;
   import §_-2bm§.FacebookLoginHelper;
   import §_-2bm§.§_-00P§;
   import §_-3A1§.§_-dE§;
   import §_-3CR§.§_-27Y§;
   import §_-3Lb§.§_-v4§;
   import §_-4Sp§.GestureEvent;
   import §_-Dk§.§_-2u6§;
   import §_-pM§.§_-7C§;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.utils.Dictionary;
   import starling.display.DisplayObject;
   import starling.display.Image;
   import starling.events.Event;
   import starling.events.Touch;
   import starling.events.TouchEvent;
   
   public class §_-0s§ extends §_-0bl§ implements §_-1OW§
   {
       
      
      private var §_-42§:§_-2UZ§;
      
      private var §_-Vb§:§_-2UZ§;
      
      private var §_-O2§:§_-2UZ§;
      
      private var §_-1XC§:§_-2UZ§;
      
      private var §_-0Ym§:§_-eo§;
      
      private var §_-43c§:§_-eo§;
      
      private var §_-2nE§:§_-0n7§;
      
      private var §_-3xL§:Button;
      
      private var §_-482§:Button;
      
      private var §_-0Dg§:§_-3-o§;
      
      private var §_-43X§:§_-3-o§;
      
      private var _icon:§_-a6§;
      
      private var §_-26f§:Object;
      
      private var §_-0-K§:§_-2u6§;
      
      private var §_-Ug§:§_-2Y2§;
      
      public function §_-0s§(param1:§_-lp§, param2:§_-3TZ§)
      {
         super(param1,param2,false);
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         addEventListener("addedToStage",onAddedToStage);
      }
      
      override public function dispose() : void
      {
         if(§_-3xL§)
         {
            §_-3xL§.removeEventListener("triggered",§_-2CQ§);
            §_-3xL§.dispose();
            §_-3xL§ = null;
         }
         if(§_-0Ym§)
         {
            §_-0Ym§.removeEventListener("enter",§_-4ZI§);
            §_-0Ym§.dispose();
            §_-0Ym§ = null;
         }
         if(§_-43c§)
         {
            §_-43c§.removeEventListener("enter",§_-es§);
            §_-43c§.dispose();
            §_-43c§ = null;
         }
         if(§_-0Dg§)
         {
            §_-0Dg§.dispose();
            §_-0Dg§ = null;
         }
         if(§_-43X§)
         {
            §_-43X§.dispose();
            §_-43X§ = null;
         }
         if(_controller && _controller.fbLoginHelper)
         {
            _controller.fbLoginHelper.removeEventListener("FLE_SESSION_READY",§_-0oR§);
            _controller.fbLoginHelper.removeEventListener("FLE_FACEBOOK_DISABLED",§_-WX§);
            _controller.fbLoginHelper.removeEventListener("FLE_SESSION_ERROR",§_-0UX§);
         }
         §_-Vb§ = null;
         §_-42§ = null;
         §_-Vb§ = null;
         §_-O2§ = null;
         §_-1XC§ = null;
         §_-0Ym§ = null;
         §_-43c§ = null;
         super.dispose();
      }
      
      public function §_-4Jq§() : void
      {
         var _loc1_:String = _controller.getProperty("environment.id");
         if(HitchTheme.§_-16V§(_loc1_))
         {
            _icon.source = HitchTheme.getTexture(_loc1_);
         }
         else
         {
            _icon.source = HitchTheme.getTexture("H_logo_small");
         }
      }
      
      public function §_-20U§(param1:Object = null) : void
      {
         var _loc2_:* = null;
         if(§_-0Ym§ != null && §_-0Ym§.stage != null)
         {
            if(param1 != null)
            {
               §_-4jj§(param1);
            }
            else
            {
               _loc2_ = §_-v4§.localizationManager.getLocalization("connection.login.error.-3.desc","login error");
               §_-4gv§(_loc2_,§_-0Ym§,"up",true,true);
            }
         }
         else
         {
            §_-26f§ = param1;
         }
      }
      
      private function §_-4gv§(param1:String, param2:DisplayObject, param3:String = "any", param4:Boolean = true, param5:Boolean = false) : void
      {
         var _loc8_:* = null;
         if(param2 == null || param2.stage == null)
         {
            return;
         }
         var _loc12_:LayoutGroup = new LayoutGroup();
         var _loc6_:§_-l-§ = new §_-l-§();
         var _loc13_:* = §_-7C§.§_-kn§(40);
         _loc6_.paddingBottom = _loc13_;
         _loc13_ = _loc13_;
         _loc6_.paddingRight = _loc13_;
         _loc13_ = _loc13_;
         _loc6_.paddingLeft = _loc13_;
         _loc6_.paddingTop = _loc13_;
         _loc6_.gap = §_-7C§.§_-kn§(20);
         _loc12_.layout = _loc6_;
         var _loc7_:§_-4Pn§ = new §_-4Pn§();
         _loc7_.top = §_-7C§.§_-kn§(20);
         _loc7_.left = §_-7C§.§_-kn§(20);
         var _loc9_:String = §_-v4§.localizationManager.getLocalization("connection.login.to.environment","Connecting to");
         var _loc11_:String = _loc9_ + " " + _controller.getProperty("connection.info.name." + §_-15k§.environmentId) + "  ";
         var _loc10_:§_-2UZ§ = new §_-2UZ§();
         _loc10_.styleNameList.add("LABEL_WARNING");
         _loc10_.text = param1 + (!!param4?"  \r" + _loc11_:"");
         _loc10_.wordWrap = true;
         _loc10_.maxWidth = §_-7C§.§_-kn§(900);
         _loc12_.addChild(_loc10_);
         if(param5)
         {
            _loc8_ = new §_-2UZ§();
            _loc8_.text = "${login.environment.forgot.password}";
            _loc8_.styleNameList.add("LABEL_LINK_LIGHT_GRAY");
            _loc8_.layoutData = §_-27Y§.§_-22n§();
            (_loc8_.layoutData as §_-4Pn§).horizontalCenter = 0;
            _loc8_.addEventListener("touch",§_-2kE§);
            _loc12_.addChild(_loc8_);
         }
         §_-3-o§.show(_loc12_,param2,param3);
      }
      
      private function §_-4jj§(param1:Object) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc5_:Array = param1.errors;
         var _loc3_:String = _loc5_ && _loc5_.length > 0?_loc5_[0]:"";
         if(_loc3_ == "" && param1 != null)
         {
            if(param1.error != null)
            {
               _loc3_ = param1.error;
            }
            else if(param1.message != null)
            {
               _loc3_ = param1.message;
            }
         }
         §_-1rS§();
         var _loc6_:* = _loc3_;
         switch(_loc6_)
         {
            case "invalid-captcha":
               _controller.showCaptchaView();
               break;
            case "login.user_banned":
               _loc4_ = §_-v4§.localizationManager.getLocalization("connection.login.error.banned.desc","login.user_banned");
               §_-4gv§(_loc4_,§_-0Ym§,"up");
               break;
            case "login.blocked":
               _loc4_ = §_-v4§.localizationManager.getLocalization("connection.login.error.blocked.desc","login.blocked");
               §_-4gv§(_loc4_,§_-0Ym§,"up");
               break;
            case "unauthorized-staff-login":
               _loc4_ = §_-v4§.localizationManager.getLocalization("connection.login.error.unauthorized.staff","unauthorized-staff-login");
               §_-4gv§(_loc4_,§_-0Ym§,"up");
               break;
            case "pocket.auth.login_failed":
               _loc4_ = §_-v4§.localizationManager.getLocalization("connection.login.error.-3.desc","pocket.auth.login_failed");
               §_-4gv§(_loc4_,§_-0Ym§,"up",true,true);
               break;
            case "pocket.auth.no_avatars":
               §_-17s§("${connection.login.error.noavatars.title}","${connection.login.error.noavatars.desc}");
               break;
            case "pocket.auth.valid_email_required":
               _loc4_ = §_-v4§.localizationManager.getLocalization("connection.login.missing_credentials","pocket.auth.valid_email_required");
               §_-4gv§(_loc4_,§_-0Ym§,"up",true,true);
               break;
            case "pocket.auth.password_required":
               _loc4_ = §_-v4§.localizationManager.getLocalization("connection.login.missing_credentials","pocket.auth.password_required");
               §_-4gv§(_loc4_,§_-43c§,"up",true,true);
               break;
            case "pocket.auth.facebook_disabled":
               _loc4_ = §_-v4§.localizationManager.getLocalization("connection.login.error.facebook_disabled.desc","pocket.auth.facebook_disabled");
               §_-4gv§(_loc4_,§_-482§,"up");
               break;
            case "pocket.auth.facebook_not_connected":
               _loc2_ = _controller.getProperty("url.prefix");
               §_-v4§.localizationManager.registerParameter("facebook.link_creation_description","url",_loc2_);
               §_-17s§("${facebook.link_creation_title}","${facebook.link_creation_description}");
               break;
            case "pocket.auth.access_token_required":
               _loc4_ = §_-v4§.localizationManager.getLocalization("connection.login.error.facebook_accesstoken.desc","pocket.auth.access_token_required");
               §_-4gv§(_loc4_,§_-482§,"up");
               break;
            case "ioError":
               _loc4_ = §_-v4§.localizationManager.getLocalization("connection.login.error.-400.desc","pocket.auth.login_failed");
               §_-4gv§(_loc4_,§_-0Ym§,"up",true,true);
               break;
            case "account_issue":
               §_-17s§("${generic.alert.title}","${login.account_issue_description}","${generic.ok}",false,false);
               break;
            default:
               §_-20U§();
         }
      }
      
      private function §_-1rS§() : void
      {
         if(§_-482§)
         {
            §_-482§.isEnabled = FacebookLoginHelper.isFacebookSupported;
         }
      }
      
      private function §_-17s§(param1:String, param2:String, param3:String = "${facebook.create_link_in_web}", param4:Boolean = true, param5:Boolean = true) : void
      {
         var _loc8_:* = null;
         var _loc10_:LayoutGroup = new LayoutGroup();
         var _loc6_:§_-l-§ = new §_-l-§();
         _loc6_.padding = §_-7C§.§_-kn§(20);
         _loc6_.gap = §_-7C§.§_-kn§(20);
         _loc6_.horizontalAlign = "center";
         _loc10_.layout = _loc6_;
         var _loc11_:§_-2UZ§ = new §_-2UZ§();
         _loc11_.styleNameList.add("LABEL_M_LIGHT_BLUE");
         _loc11_.text = param1;
         _loc10_.addChild(_loc11_);
         var _loc7_:§_-2UZ§ = new §_-2UZ§();
         _loc7_.width = §_-7C§.§_-kn§(600);
         _loc7_.textRendererProperties.wordWrap = true;
         _loc7_.text = param2;
         _loc10_.addChild(_loc7_);
         var _loc9_:Button = new Button();
         _loc9_.styleNameList.add("alternate-blue-button");
         _loc9_.addEventListener("triggered",§_-2UW§);
         _loc9_.label = param3;
         if(param4)
         {
            _loc8_ = new §_-a6§();
            _loc8_.source = HitchTheme.getTexture("fb_icon");
            _loc9_.defaultIcon = _loc8_;
         }
         _loc10_.addChild(_loc9_);
         var _loc12_:§_-0NB§ = !!param5?§_-482§:§_-3xL§;
         §_-43X§ = §_-3-o§.show(_loc10_,_loc12_,"up",false);
      }
      
      protected function §_-WX§(param1:§_-00P§) : void
      {
         var _loc2_:§_-2UZ§ = new §_-2UZ§();
         _loc2_.styleNameList.add("LABEL_WARNING");
         _loc2_.text = "${connection.login.facebook.canceled}";
         if(§_-482§ && §_-482§.stage)
         {
            §_-3-o§.show(_loc2_,§_-482§,"up");
         }
      }
      
      protected function §_-0UX§(param1:§_-00P§) : void
      {
         var _loc2_:§_-2UZ§ = new §_-2UZ§();
         _loc2_.styleNameList.add("LABEL_WARNING");
         _loc2_.text = "${connection.login.facebook.error}";
         if(§_-482§ && §_-482§.stage)
         {
            §_-3-o§.show(_loc2_,§_-482§,"up");
         }
      }
      
      override protected function initializeHandler(param1:Event) : void
      {
         super.initializeHandler(param1);
         var _loc3_:* = §_-7C§.§_-12T§() == 0;
         var _loc4_:§_-l-§ = new §_-l-§();
         _loc4_.horizontalAlign = "justify";
         _loc4_.gap = §_-lp§.§_-3Kv§;
         §_-3FO§.layout = _loc4_;
         §_-3FO§.scrollBarDisplayMode = "fixed";
         addChild(§_-3FO§);
         var _loc16_:LayoutGroup = new LayoutGroup();
         var _loc2_:§_-1H2§ = new §_-1H2§();
         _loc2_.verticalAlign = "middle";
         _loc2_.gap = §_-lp§.§_-1o7§;
         _loc16_.layout = _loc2_;
         §_-3FO§.addChild(_loc16_);
         _icon = new §_-a6§();
         _loc16_.addChild(_icon);
         §_-1XC§ = new §_-2UZ§();
         §_-1XC§.text = "${connection.login.login}";
         §_-1XC§.styleNameList.add("LABEL_XXL_CONDENSED_LIGHT_GRAY");
         _loc16_.addChild(§_-1XC§);
         §_-Vb§ = new §_-2UZ§();
         §_-Vb§.text = "${connection.login.information}";
         §_-Vb§.styleNameList.add("LABEL_S_BOLD_LIGHT_BLUE");
         §_-3FO§.addChild(§_-Vb§);
         §_-0Ym§ = new §_-eo§();
         §_-0Ym§.prompt = "${connection.login.email}";
         §_-0Ym§.addEventListener("enter",§_-4ZI§);
         §_-0Ym§.paddingTop = !!_loc3_?§_-7C§.§_-kn§(20):int(§_-7C§.§_-kn§(50));
         §_-0Ym§.§_-2Pq§.softKeyboardType = "email";
         §_-0Ym§.width = §_-3FO§.width;
         §_-3FO§.addChild(§_-0Ym§);
         §_-43c§ = new §_-eo§();
         §_-43c§.prompt = "${connection.login.password}";
         §_-43c§.displayAsPassword = true;
         §_-43c§.width = §_-3FO§.width;
         §_-43c§.addEventListener("enter",§_-es§);
         §_-3FO§.addChild(§_-43c§);
         §_-0Ym§.text = !!_controller.loginName?_controller.loginName:"";
         var _loc11_:LayoutGroup = new LayoutGroup();
         var _loc6_:§_-1H2§ = new §_-1H2§();
         _loc6_.gap = §_-lp§.§_-3Kv§;
         _loc6_.§_-3ef§ = true;
         _loc6_.verticalAlign = "middle";
         _loc11_.layout = _loc6_;
         var _loc15_:LayoutGroup = new LayoutGroup();
         var _loc9_:§_-1H2§ = new §_-1H2§();
         _loc9_.horizontalAlign = "right";
         _loc9_.verticalAlign = "middle";
         _loc9_.gap = §_-lp§.§_-3Kv§;
         _loc15_.layout = _loc9_;
         §_-3FO§.addChild(_loc15_);
         var _loc8_:§_-2UZ§ = new §_-2UZ§();
         _loc8_.styleNameList.add("LABEL_S_BOLD_LIGHT_GRAY");
         _loc8_.text = "${connection.login.remember_me}";
         _loc15_.addChild(_loc8_);
         §_-2nE§ = new §_-0n7§();
         §_-2nE§.§_-0aO§ = "${toggle.off}";
         §_-2nE§.§_-3XR§ = "${toggle.on}";
         §_-2nE§.isSelected = §_-dE§.§_-2dp§("autologin");
         _loc15_.addChild(§_-2nE§);
         §_-3FO§.addChild(§_-3Gd§(§_-lp§.§_-3Kv§,!!§_-7C§.§_-4OE§()?§_-lp§.§_-48o§:int(§_-lp§.§_-3Kv§)));
         §_-3FO§.addChild(_loc11_);
         var _loc7_:Button = §_-2KX§("generic.cancel",new §_-4Pn§(),_loc11_);
         _loc7_.styleNameList.add("feathers-danger-button");
         _loc7_.addEventListener("triggered",§_-0Ry§);
         §_-3xL§ = §_-2KX§("connection.login.letsgo",new §_-4Pn§(),_loc11_);
         §_-3xL§.addEventListener("triggered",§_-2CQ§);
         §_-3FO§.addChild(§_-3Gd§(§_-lp§.§_-3Kv§,§_-lp§.§_-3Kv§));
         var _loc10_:Image = HitchTheme.createImage(HitchTheme.getTexture("fb_icon"));
         §_-482§ = new Button();
         §_-482§.styleNameList.add("alternate-blue-button");
         §_-482§.addEventListener("triggered",§_-2et§);
         §_-482§.label = "${connection.login.facebook}";
         §_-482§.defaultIcon = _loc10_;
         §_-482§.defaultLabelProperties.isHTML = false;
         §_-482§.layoutData = new §_-4Pn§();
         §_-482§.isEnabled = false;
         §_-3FO§.addChild(§_-482§);
         var _loc13_:Image = new Image(HitchTheme.getTexture("fb_icon"));
         _loc13_.smoothing = "none";
         var _loc17_:* = §_-7C§.§_-2Tc§();
         _loc13_.scaleY = _loc17_;
         _loc13_.scaleX = _loc17_;
         §_-3FO§.addChild(§_-3Gd§(§_-lp§.§_-3Kv§,§_-lp§.§_-48o§));
         var _loc14_:LayoutGroup = new LayoutGroup();
         var _loc5_:§_-l-§ = new §_-l-§();
         _loc5_.horizontalAlign = "center";
         _loc5_.gap = §_-lp§.§_-3Kv§;
         _loc14_.layout = _loc5_;
         §_-3FO§.addChild(_loc14_);
         var _loc12_:§_-2UZ§ = HitchTheme.§_-0yn§("${login.environment.create.account}","LABEL_LINK_LARGE");
         _loc12_.addEventListener("touch",§_-0qF§);
         _loc12_.backgroundSkin = HitchTheme.createScale9Image(HitchTheme.§_-1RG§("shop_list_main_disabled"));
         _loc12_.padding = §_-7C§.§_-kn§(20);
         _loc14_.addChild(_loc12_);
         §_-0oh§ = true;
      }
      
      private function §_-a§(param1:GestureEvent) : void
      {
      }
      
      override protected function onBackButtonTriggered(param1:Event) : void
      {
         §_-15k§.showEnvironmentSelect();
      }
      
      override protected function onAddedToStage(param1:Event) : void
      {
         §_-4Jq§();
         §_-1rS§();
         var _loc2_:Boolean = §_-dE§.§_-2dp§("autologin");
         if(_loc2_ && _controller.password)
         {
            §_-43c§.text = _controller.password;
         }
         else
         {
            §_-43c§.text = "";
         }
         if(§_-26f§)
         {
            §_-20U§(§_-26f§);
            §_-26f§ = null;
         }
         _controller.tracking.trackGoogle("Application","OPEN_VIEW","Login");
      }
      
      private function §_-4ZI§(param1:Event) : void
      {
         §_-0Ym§.§_-30S§();
      }
      
      private function §_-es§(param1:Event) : void
      {
         §_-0Ym§.§_-30S§();
         §_-43c§.§_-30S§();
      }
      
      private function §_-0qF§(param1:TouchEvent) : void
      {
         var _loc2_:Touch = param1.touches[0];
         if(_loc2_ && _loc2_.phase == "ended")
         {
            §_-15k§.showTOS(true);
         }
      }
      
      private function §_-2kE§(param1:TouchEvent) : void
      {
         var _loc2_:Touch = param1.touches[0];
         if(_loc2_ && _loc2_.phase == "ended")
         {
            §_-15k§.showResetPassword();
         }
      }
      
      private function §_-0Ry§(param1:Event) : void
      {
         §_-15k§.showEnvironmentSelect();
      }
      
      private function §_-2CQ§(param1:Event) : void
      {
         var _loc4_:* = null;
         var _loc3_:String = §_-0Ym§.text;
         var _loc2_:String = §_-43c§.text;
         if(_loc3_ == "" || _loc2_ == "")
         {
            _loc4_ = §_-v4§.localizationManager.getLocalization("connection.login.missing_credentials","connection.login.missing_credentials");
            §_-4gv§(_loc4_,§_-0Ym§,"up",false,true);
         }
         else
         {
            §_-15k§.tryLogin(_loc3_,_loc2_,§_-2nE§.isSelected);
         }
      }
      
      private function §_-2et§(param1:Event) : void
      {
         var _loc4_:* = null;
         var _loc3_:String = "HabboFacebookAIR";
         var _loc2_:String = "HabboFacebookAIR";
         if(_loc3_ == "" || _loc2_ == "")
         {
            _loc4_ = §_-v4§.localizationManager.getLocalization("connection.login.missing_credentials","connection.login.missing_credentials");
            §_-4gv§(_loc4_,§_-0Ym§,"up",false,true);
         }
         else
         {
            §_-15k§.tryLogin(_loc3_,_loc2_,false);
         }
      }
      
      private function §_-0oR§(param1:§_-00P§) : void
      {
         var _loc10_:LayoutGroup = new LayoutGroup();
         var _loc2_:§_-l-§ = new §_-l-§();
         _loc2_.padding = §_-7C§.§_-kn§(20);
         _loc2_.gap = §_-7C§.§_-kn§(20);
         _loc2_.horizontalAlign = "center";
         _loc10_.layout = _loc2_;
         var _loc11_:§_-2UZ§ = new §_-2UZ§();
         _loc11_.styleNameList.add("LABEL_M_LIGHT_BLUE");
         _loc11_.text = "${connection.login.facebook}";
         _loc10_.addChild(_loc11_);
         var _loc6_:§_-2UZ§ = new §_-2UZ§();
         _loc6_.width = §_-3FO§.width;
         _loc6_.textRendererProperties.wordWrap = true;
         var _loc7_:String = _controller.fbLoginHelper.getFBName();
         §_-v4§.localizationManager.registerParameter("connection.login.facebook.desc","name",_loc7_);
         _loc6_.text = "${connection.login.facebook.desc}";
         _loc10_.addChild(_loc6_);
         var _loc4_:LayoutGroup = new LayoutGroup();
         var _loc5_:§_-1H2§ = new §_-1H2§();
         _loc5_.gap = §_-lp§.§_-3Kv§;
         _loc5_.§_-3ef§ = true;
         _loc5_.verticalAlign = "middle";
         _loc4_.layout = _loc5_;
         _loc10_.addChild(_loc4_);
         var _loc3_:Button = new Button();
         _loc3_.styleNameList.add("alternate-blue-button");
         _loc3_.addEventListener("triggered",§_-0m6§);
         _loc3_.label = "${connection.logout.facebook}";
         var _loc8_:§_-a6§ = new §_-a6§();
         _loc8_.source = HitchTheme.getTexture("fb_icon");
         _loc3_.defaultIcon = _loc8_;
         _loc4_.addChild(_loc3_);
         var _loc9_:Button = new Button();
         _loc9_.styleNameList.add("alternate-blue-button");
         _loc9_.addEventListener("triggered",§_-H4§);
         _loc7_ = _loc7_ != null?_loc7_.split(" ")[0]:"";
         §_-v4§.localizationManager.registerParameter("connection.login.facebook.asuser","name",_loc7_);
         _loc9_.label = "${connection.login.facebook.asuser}";
         _loc4_.addChild(_loc9_);
         if(§_-482§ && §_-482§.stage)
         {
            §_-0Dg§ = §_-3-o§.show(_loc10_,§_-482§,"up",false);
         }
      }
      
      private function §_-H4§(param1:Event) : void
      {
         §_-0Dg§.close(true);
         §_-0Dg§ = null;
         §_-15k§.sendFacebookAccessToken(_controller.fbLoginHelper.getAccessToken());
      }
      
      private function §_-0m6§(param1:Event) : void
      {
         §_-0Dg§.close(true);
         §_-0Dg§ = null;
         _controller.fbLoginHelper.closeSession();
      }
      
      private function §_-4RR§(param1:Event) : void
      {
         §_-43X§.close(true);
         §_-43X§ = null;
         var _loc2_:String = _controller.getProperty("url.prefix");
      }
      
      private function §_-2UW§(param1:Event) : void
      {
         if(§_-43X§ != null)
         {
            §_-43X§.close(true);
            §_-43X§ = null;
         }
         §_-0Pc§();
         §_-Ug§ = new §_-2Y2§(this);
      }
      
      private function §_-0Pc§() : void
      {
         if(§_-Ug§)
         {
            §_-Ug§.dispose();
            §_-Ug§ = null;
         }
      }
      
      public function §_-bX§() : void
      {
         §_-0Pc§();
      }
      
      public function getProperty(param1:String, param2:Dictionary = null) : String
      {
         return !!_controller?_controller.getProperty(param1,param2):"";
      }
   }
}
