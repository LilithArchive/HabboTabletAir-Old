package
{
   import §_-0tp§.Stage3DManager;
   import §_-0tp§.Stage3DProxy;
   import §_-11h§.§_-49E§;
   import §_-14T§.§_-1UG§;
   import §_-15m§.§_-4f2§;
   import §_-1jS§.CoreComponentContext;
   import §_-1jS§.§_-1TR§;
   import §_-1jS§.§_-2CC§;
   import §_-1jS§.§_-4Sv§;
   import §_-1wE§.§_-4PF§;
   import §_-2En§.§_-0ZE§;
   import §_-2T5§.Alert;
   import §_-2n9§.§_-3ID§;
   import §_-2y8§.DeviceCapabilities;
   import §_-3A1§.§_-dE§;
   import §_-3GI§.§_-2i3§;
   import §_-3Lb§.§_-0ol§;
   import §_-3Lb§.§_-v4§;
   import §_-3V6§.§_-1PG§;
   import §_-3qH§.Core;
   import §_-3yu§.§_-0ek§;
   import §_-3yu§.§_-1a9§;
   import §_-3yu§.§_-37U§;
   import §_-47s§.HabboTracking;
   import §_-4Ye§.§_-8t§;
   import §_-4Ye§.§_-kf§;
   import §_-4bA§.§_-42t§;
   import §_-T6§.§_-2f3§;
   import §_-pM§.§_-7C§;
   import com.mesmotronic.ane.AndroidFullScreen;
   import com.sulake.iid.IIDCoreLocalizationManager;
   import com.sulake.iid.IIDHabboCommunicationDemo;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.desktop.NativeApplication;
   import flash.display.Sprite;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.InvokeEvent;
   import flash.events.KeyboardEvent;
   import flash.filesystem.File;
   import flash.system.Capabilities;
   import flash.system.System;
   import starling.core.Starling;
   import starling.display.DisplayObject;
   import starling.utils.SystemUtil;
   
   [SecureSWF(rename="false")]
   public class HabboTabletMain extends flash.display.Sprite
   {
      
      public static var ubuntu_regular:Class = §Ubuntu-R_ttf$5bae8f5702fc0439bcf0f3af29e9ebd61031082117§;
      
      public static var ubuntu_bold:Class = §Ubuntu-B_ttf$d35e24a2b1b31e186299e9bdcee32cb11958698349§;
      
      public static var ubuntu_italic:Class = §Ubuntu-I_ttf$204fed506ea928adb0a69b4f44d7c46b20089687§;
      
      public static var ubuntu_bold_italic:Class = §Ubuntu-BI_ttf$aab2b25e732344262c9803c521124772897694205§;
      
      public static var ubuntu_condensed:Class = §Ubuntu-C_ttf$89fe4d9da3d229c276f2f43670b888e61430458534§;
      
      private static const LOADING_PROGRESS_STAGE_1:Number = 0.2;
      
      private static const LOADING_PROGRESS_STAGE_2:Number = 0.4;
      
      private static const LOADING_PROGRESS_STAGE_3:Number = 0.6;
      
      private static const LOADING_PROGRESS_STAGE_4:Number = 0.8;
      
      private static const LOADING_PROGRESS_STAGE_COMPLETE:Number = 1;
      
      private static var _lowMemoryWarnCount:int;
       
      
      private var CONTEXT_3D_PROFILE:String = "baseline";
      
      private var _core:§_-1TR§;
      
      private var _preloader:HabboTablet;
      
      private var _tracking:HabboTracking;
      
      private var _configurationManager:§_-0ZE§;
      
      private var _starling:Starling;
      
      private var _stage3DManager:Stage3DManager;
      
      private var _stage3DProxy:Stage3DProxy;
      
      private var _view3D:§_-42t§;
      
      private var _theme:HitchTheme;
      
      private var _memoryMonitor:§_-4PF§;
      
      private var _lowMemoryAlert:Alert;
      
      private var _gradientRenderer:§_-2f3§;
      
      public function HabboTabletMain()
      {
         super();
         addEventListener("addedToStage",this.onAddedToStage);
         addEventListener("complete",this.onCompleteEvent);
         NativeApplication.nativeApplication.addEventListener("invoke",this.invokeHandler);
      }
      
      private static function receiveQueuedInterface(param1:§_-4Sv§, param2:§_-2CC§) : void
      {
         §_-v4§.localizationManager = param2 as §_-4f2§;
         §_-0ol§.localizationManager = param2 as §_-4f2§;
      }
      
      private function invokeHandler(param1:InvokeEvent) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         Logger.log("InvokeHandler " + param1.reason + ". Arguments: " + param1.arguments[0]);
         if(param1.arguments && param1.arguments.length)
         {
            _loc4_ = 0;
            _loc3_ = param1.arguments[0];
            for(_loc2_ in param1.arguments[0])
            {
               Logger.log("param " + _loc2_ + ": " + param1.arguments[0][_loc2_]);
            }
         }
      }
      
      public function dispose() : void
      {
         Core.dispose();
         this._core = null;
         this._tracking = null;
         this._configurationManager = null;
         if(this._theme)
         {
            this._theme.dispose();
            this._theme = null;
         }
         if(this._starling)
         {
            this._starling.dispose();
            this._starling = null;
         }
         this._stage3DManager = null;
         if(this._stage3DManager)
         {
            this._stage3DProxy.dispose();
            this._stage3DProxy = null;
         }
         if(this._view3D)
         {
            this._view3D.dispose();
            this._view3D = null;
         }
         if(this._lowMemoryAlert)
         {
            this._lowMemoryAlert.removeFromParent();
            this._lowMemoryAlert.dispose();
            this._lowMemoryAlert = null;
         }
         if(§_-7C§.§_-0L2§)
         {
            §_-7C§.§_-0L2§.dispose();
            §_-7C§.§_-0L2§ = null;
         }
         NativeApplication.nativeApplication.removeEventListener("keyDown",this.onKeyDown);
         NativeApplication.nativeApplication.removeEventListener("deactivate",this.onApplicationDeactivated);
         NativeApplication.nativeApplication.removeEventListener("activate",this.onApplicationActivated);
      }
      
      protected function onAddedToStage(param1:flash.events.Event = null) : void
      {
         var _loc3_:XML = NativeApplication.nativeApplication.applicationDescriptor;
         var _loc5_:Namespace = _loc3_.namespace();
         var _loc2_:String = _loc3_._loc5_::copyright;
         var _loc4_:String = _loc3_._loc5_::versionLabel;
         var _loc6_:String = _loc3_._loc5_::versionNumber;
         Logger.log("AIR Runtime version: " + NativeApplication.nativeApplication.runtimeVersion);
         Logger.log("Application ID: " + NativeApplication.nativeApplication.applicationID);
         Logger.log("Copyright: " + _loc2_);
         Logger.log("Version: " + _loc4_);
         Logger.log("VersionNumber: " + _loc6_);
         Logger.log("Application Directory: " + File.applicationDirectory.nativePath);
         Logger.log("Application Storage: " + File.applicationStorageDirectory.nativePath);
         Logger.log("OS: " + Capabilities.os);
         Logger.log("Architecture: " + Capabilities.cpuArchitecture);
         Logger.log("Manufacturer: " + Capabilities.manufacturer);
         Logger.log("PlayerType: " + Capabilities.playerType);
         Logger.log("Debug: " + Capabilities.isDebugger);
         Logger.log("Language: " + Capabilities.language);
         Logger.log("Languages: " + Capabilities.languages);
         Logger.log("Pixel Aspect Ratio: " + Capabilities.pixelAspectRatio);
         Logger.log("ScreenDPI: " + Capabilities.screenDPI);
         Logger.log("ScreenResX: " + Capabilities.screenResolutionX);
         Logger.log("ScreenResY: " + Capabilities.screenResolutionY);
         Logger.log("ScreenRatio: " + Capabilities.screenResolutionX / (Capabilities.screenResolutionY * 1));
         Logger.log("StageWidth: " + stage.fullScreenWidth);
         Logger.log("StageHeight: " + stage.fullScreenHeight);
         Logger.log("AIR Version: " + Capabilities.version);
         Logger.log("Using 3D profile: " + this.CONTEXT_3D_PROFILE);
         Logger.log("Core version: " + Core.version);
         Logger.log("DeviceCapabilities.dpi: " + DeviceCapabilities.§_-1-Z§);
         Logger.log("DeviceCapabilities.isPhone: " + DeviceCapabilities.§_-4OE§(stage));
         Logger.log("DeviceCapabilities.isTablet: " + DeviceCapabilities.§_-0J8§(stage));
         Logger.log("DeviceCapabilities.screenInchesX: " + DeviceCapabilities.§_-Ek§(stage));
         Logger.log("DeviceCapabilities.screenInchesY: " + DeviceCapabilities.§_-3KF§(stage));
         Logger.log("DeviceCapabilities.screenPixelWidth: " + DeviceCapabilities.§_-3X8§);
         Logger.log("DeviceCapabilities.screenPixelHeight: " + DeviceCapabilities.§_-3PD§);
         Logger.log("DeviceCapabilities.tabletScreenMinimumInches: " + DeviceCapabilities.§_-4AN§);
         this.goFullScreen();
         this.init();
      }
      
      private function goFullScreen() : void
      {
         var _loc1_:* = null;
         try
         {
            _loc1_ = Capabilities.version.toLowerCase();
            if(_loc1_.indexOf("and") > -1)
            {
               if(AndroidFullScreen.isSupported)
               {
                  if(AndroidFullScreen.isImmersiveModeSupported)
                  {
                     AndroidFullScreen.immersiveMode();
                     stage.displayState = "normal";
                  }
                  else
                  {
                     stage.displayState = "fullScreenInteractive";
                  }
               }
               else
               {
                  stage.displayState = "fullScreenInteractive";
               }
            }
            return;
         }
         catch(error:Error)
         {
            Logger.log("Not Supported on iOS");
            return;
         }
      }
      
      private function init() : void
      {
         var NativeWindow:* = stage.nativeWindow;
         NativeWindow.maximize();
         var _loc4_:* = null;
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc2_:String = Capabilities.version.toLowerCase();
         if(_loc2_.indexOf("win") > -1 || _loc2_.indexOf("mac") > -1)
         {
            DeviceCapabilities.§_-1-Z§ = 132;
         }
         stage.addEventListener("resize",this.onStageResize);
         this.updateLoadingProgressTo(0.2);
         if(this._stage3DManager == null)
         {
            this._stage3DManager = Stage3DManager.getInstance(stage);
            this._stage3DProxy = this._stage3DManager.§_-1re§(false,this.CONTEXT_3D_PROFILE);
            if(this._stage3DProxy.profile == null)
            {
               this._stage3DProxy = this._stage3DManager.§_-1re§(false);
            }
            this._stage3DProxy.addEventListener("Context3DCreated",this.onContext3DCreated);
            this._stage3DProxy.addEventListener("Context3DRecreated",this.onContext3DProxyRecreated);
            this._stage3DProxy.addEventListener("Context3DDisposed",this.onContext3DDisposed);
            this._stage3DProxy.addEventListener("error",this.onStage3DError);
            this._stage3DProxy.§_-Zi§ = 0;
            this._stage3DProxy.§_-1AC§ = true;
         }
         else
         {
            this.onContext3DCreated();
         }
      }
      
      private function onMemoryWarning(param1:flash.events.Event) : void
      {
         SystemUtil.executeWhenApplicationIsActive(this.onMemoryWarningBufferedCall);
      }
      
      private function onMemoryWarningBufferedCall() : void
      {
         if(this._lowMemoryAlert)
         {
            this._lowMemoryAlert.removeFromParent();
            this._lowMemoryAlert.dispose();
         }
         _lowMemoryWarnCount = int(int(int(Number(_lowMemoryWarnCount) + 1)));
         if(this._core && this._core.events)
         {
            this._core.events.dispatchEvent(new §_-2i3§(_lowMemoryWarnCount));
         }
      }
      
      private function onAlertClosed(param1:starling.events.Event) : void
      {
         (param1.target as Alert).dispose();
      }
      
      private function onStageResize(param1:flash.events.Event) : void
      {
         if(!stage)
         {
            return;
         }
         var _loc2_:* = stage.stageWidth;
         var _loc3_:* = stage.stageHeight;
         if(this._stage3DProxy)
         {
            this._stage3DProxy.width = int(int(_loc2_));
            this._stage3DProxy.height = int(int(_loc3_));
         }
         if(this._view3D)
         {
            this._view3D.width = Number(Number(Number(_loc2_)));
            this._view3D.height = Number(Number(Number(_loc3_)));
         }
         if(this._starling)
         {
            this._starling.stage.stageWidth = int(int(_loc2_));
            this._starling.stage.stageHeight = int(int(_loc3_));
            this._starling.viewPort.width = _loc2_;
            this._starling.viewPort.height = _loc3_;
         }
      }
      
      protected function onStage3DError(param1:ErrorEvent) : void
      {
         Logger.log("Hello, error!" + param1);
      }
      
      private function onContext3DDisposed(param1:§_-1UG§ = null) : void
      {
         Logger.log("Context 3d was Disposed!");
      }
      
      private function onContext3DProxyRecreated(param1:§_-1UG§ = null) : void
      {
         Logger.log("Context 3d Proxy was recreated!");
      }
      
      private function onContext3DCreated(param1:§_-1UG§ = null) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(this._view3D == null)
         {
            this._view3D = new §_-42t§(null,null,null,false,this.CONTEXT_3D_PROFILE);
            this._view3D.stage3DProxy = this._stage3DProxy;
            this._view3D.shareContext = true;
            this._view3D.§_-Zi§ = uint(uint(uint(0)));
            this._view3D.mouseEnabled = false;
            this._view3D.mouseChildren = false;
            stage.addChild(this._view3D);
         }
         if(this._starling == null)
         {
            Starling.multitouchEnabled = false;
            _loc3_ = Capabilities.version.toLowerCase();
            if(_loc3_.indexOf("and") > -1)
            {
               Starling.handleLostContext = true;
            }
            else
            {
               Starling.handleLostContext = true;
            }
            _loc2_ = this._stage3DProxy.context3D.profile;
            Logger.log("Creating Starling with profile " + _loc2_);
            this._starling = new Starling(starling.display.Sprite,stage,this._stage3DProxy.viewPort,this._stage3DProxy.stage3D,"auto",_loc2_);
            this._starling.showStats = false;
            this._starling.shareContext = true;
            this._starling.enableErrorChecking = false;
            this._starling.addEventListener("context3DCreate",this.onStarlingContext3DCreated);
            Logger.log("Created Starling with \n\tprofile " + this._starling.profile + " \n\tshared: " + this._starling.shareContext + " \n\tcontext: " + this._starling.context);
            §_-3ID§.§_-26P§ = new §_-49E§(stage);
            §_-3ID§.§_-0XP§(DisplayObject,new §_-8t§());
            §_-3ID§.§_-2Eg§(new §_-kf§(this._starling),-1);
         }
         else
         {
            this.onStarlingRootCreated();
         }
         this.goFullScreen();
      }
      
      protected function onStarlingContext3DCreated(param1:starling.events.Event) : void
      {
         this._starling.removeEventListener("context3DCreate",this.onStarlingContext3DCreated);
         if(this._starling.context)
         {
         }
         if(!this._starling.isStarted)
         {
            this._starling.start();
         }
         this._starling.addEventListener("rootCreated",this.onStarlingRootCreated);
      }
      
      private function onContext3DRecreated(param1:starling.events.Event = null) : void
      {
         if(this._gradientRenderer && this._stage3DProxy)
         {
            if(this._stage3DProxy.context3D.profile != null || this._stage3DProxy.context3D.driverInfo != null)
            {
               this._gradientRenderer.context = this._stage3DProxy.context3D;
            }
            §_-7C§.init();
         }
      }
      
      private function onStarlingRootCreated(param1:starling.events.Event = null) : void
      {
         §_-7C§.init();
         this._starling.removeEventListener("rootCreated",this.onStarlingRootCreated);
         if(§_-7C§.§_-4Em§())
         {
            NativeApplication.nativeApplication.addEventListener("keyDown",this.onKeyDown,false,0,true);
            NativeApplication.nativeApplication.addEventListener("deactivate",this.onApplicationDeactivated);
            NativeApplication.nativeApplication.addEventListener("activate",this.onApplicationActivated);
         }
         if(this._theme == null)
         {
            this._theme = new HitchTheme();
         }
         if(!this._gradientRenderer)
         {
            this._gradientRenderer = new §_-2f3§(this._stage3DProxy.context3D);
            this._gradientRenderer.colors(527374,1318180);
         }
         this._starling.addEventListener("context3DCreate",this.onContext3DRecreated);
         var _loc2_:Boolean = true;
         if(_loc2_)
         {
            this.prepareCore();
         }
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != 16777238)
         {
            return;
         }
         param1.preventDefault();
         param1.stopImmediatePropagation();
      }
      
      private function onApplicationDeactivated(param1:flash.events.Event) : void
      {
         Logger.log("Application deactivated");
      }
      
      private function onApplicationActivated(param1:flash.events.Event) : void
      {
         Logger.log("Application activated");
         if(Starling.current != null && Starling.current.context != null)
         {
            Starling.current.context.clear();
            Starling.current.context.present();
         }
         this.goFullScreen();
      }
      
      private function onEnterFrame(param1:flash.events.Event) : void
      {
         if(this._stage3DProxy && this._starling)
         {
            this._stage3DProxy.clear();
            this._starling.nextFrame();
            this._stage3DProxy.present();
         }
      }
      
      private function onCachedErrorAlertClosed(param1:starling.events.Event) : void
      {
         (param1.target as Alert).dispose();
         removeEventListener("enterFrame",this.onEnterFrame);
         this.prepareCore();
      }
      
      private function prepareCore() : void
      {
         var _loc1_:* = 0;
         try
         {
            _loc1_ = uint(uint(1));
            this._core = Core.§_-4i9§(stage,_loc1_,new HabboCoreErrorReporter());
            this._core.events.addEventListener("COMPONENT_EVENT_ERROR",this.onCoreError);
            this._core.events.addEventListener("COMPONENT_EVENT_REBOOT",this.onCoreReboot);
            (this._core as CoreComponentContext).§_-37o§(this._stage3DProxy,this._starling,this._view3D,this._gradientRenderer);
            (this._core as CoreComponentContext).fileProxy = new §_-0ek§();
            if(§_-1a9§.isSupported())
            {
               §_-dE§.§_-2qa§ = new §_-1a9§();
            }
            if(§_-7C§.§_-0L2§)
            {
               §_-7C§.§_-0L2§.dispose();
            }
            §_-7C§.§_-0L2§ = new §_-37U§();
            this._core.queueInterface(new IIDHabboCommunicationDemo(),this.onCommunicationDemoReady);
            this._core.queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
            this._core.queueInterface(new IIDCoreLocalizationManager(),receiveQueuedInterface);
            this._core.§_-1-y§(CoreCommunicationFrameworkLib);
            this._core.§_-1-y§(RoomManagerLib);
            this._core.§_-1-y§(RoomSpriteRendererLib);
            this._core.§_-1-y§(HabboConfigurationCom);
            this._core.§_-1-y§(HabboLocalizationCom);
            this._core.§_-1-y§(HabboCommunicationCom);
            this._core.§_-1-y§(HabboCommunicationDemoCom,1);
            this._core.§_-1-y§(HabboTrackingLib);
            this._core.§_-1-y§(HabboUI3dCom);
            this._core.§_-1-y§(HabboRoomEngineCom,2 | 1 | 4);
            this._core.§_-1-y§(HabboRoomSessionManagerLib);
            this._core.§_-1-y§(HabboRoomObjectLogicLib);
            this._core.§_-1-y§(HabboRoomObjectVisualizationLib);
            this._core.§_-1-y§(HabboSessionDataManagerLib);
            this._core.§_-1-y§(HabboAvatarRenderLib);
            this._core.§_-1-y§(HabboTabletNavigatorCom);
            this._core.§_-1-y§(HabboAdManagerCom);
            this._core.§_-1-y§(HabboTabletInventoryCom);
            this._core.§_-1-y§(HabboTabletCatalogCom);
            this._core.§_-1-y§(HabboSoundManagerFlash10Com);
            this._core.§_-1-y§(HabboUserDefinedRoomEventsCom);
            this._core.§_-1-y§(HabboQuestEngineCom);
            this._tracking = HabboTracking.getInstance();
            this.updateLoadingProgressTo(0.4);
            this._core.§_-1JS§(new XML(),this);
            return;
         }
         catch(error:Error)
         {
            Core.dispose();
            return;
         }
      }
      
      private function onCommunicationDemoReady(param1:§_-4Sv§, param2:§_-2CC§) : void
      {
         this.updateLoadingProgressTo(1);
         if(this._preloader)
         {
            this._preloader.hideLoadingScreen();
         }
         param2.release(param1);
      }
      
      private function onConfigurationManagerReady(param1:§_-4Sv§, param2:§_-0ZE§) : void
      {
         this._configurationManager = param2;
         this._configurationManager.events.addEventListener("complete",this.onConfigurationsReady);
      }
      
      private function onConfigurationsReady(param1:flash.events.Event) : void
      {
         this._configurationManager.events.removeEventListener("complete",this.onConfigurationsReady);
         if(this._configurationManager.getBoolean("tablet.low_mem_event.enabled"))
         {
            this._memoryMonitor = new §_-4PF§();
            this._memoryMonitor.addEventListener("MemoryWarning",this.onMemoryWarning);
         }
      }
      
      private function onCoreReboot(param1:flash.events.Event) : void
      {
         Logger.log("Reboot application! " + System.privateMemory,System.totalMemory,System.totalMemoryNumber);
         Core.dispose();
         this._core = null;
         Logger.log("Application ready for restart! " + System.privateMemory,System.totalMemory,System.totalMemoryNumber);
         this.init();
      }
      
      public function set preloader(param1:HabboTablet) : void
      {
         this._preloader = param1;
      }
      
      private function updateLoadingProgressTo(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         if(this._preloader)
         {
            _loc2_ = 0.7 + param1 * (1 - 0.7);
            Logger.log("**** Updating after core ratio to: " + _loc2_);
            this._preloader.updateLoadingBarProgressTo(_loc2_);
         }
      }
      
      private function onCompleteEvent(param1:flash.events.Event) : void
      {
         this.updateLoadingProgressTo(0.8);
         this.initializeCore();
      }
      
      private function initializeCore() : void
      {
         try
         {
            this._core.initialize();
            return;
         }
         catch(error:Error)
         {
            Core.§_-2Kk§("Failed to initialize the core: " + error.message,10,error);
            return;
         }
      }
      
      public function onCoreError(param1:flash.events.Event) : void
      {
         Logger.log("TabletMain: onCoreError " + param1.type);
      }
   }
}

import §_-1jS§.§_-1zw§;
import §_-1jS§.§_-H5§;

class HabboCoreErrorReporter implements §_-1zw§
{
    
   
   private var _logger:§_-H5§;
   
   function HabboCoreErrorReporter()
   {
      super();
   }
   
   public function logError(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
   {
      HabboTablet.reportCrash(param1,param3,param2,param4,this._logger);
   }
   
   public function set errorLogger(param1:§_-H5§) : void
   {
      this._logger = param1;
   }
}
