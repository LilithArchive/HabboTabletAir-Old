package §_-2bm§
{
   import §_-3A1§.§_-dE§;
   import §_-pM§.§_-7C§;
   import com.distriqt.extension.core.Core;
   import com.distriqt.extension.facebookapi.AccessToken;
   import com.distriqt.extension.facebookapi.FacebookAPI;
   import com.distriqt.extension.facebookapi.Profile;
   import com.distriqt.extension.facebookapi.events.FacebookAPISessionEvent;
   import com.distriqt.extension.facebookapi.events.GraphAPIRequestEvent;
   import com.distriqt.extension.facebookapi.graphapi.GraphAPIRequest;
   import com.distriqt.extension.facebookapi.graphapi.builders.GraphAPIRequestBuilder;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   [SecureSWF(rename="false")]
   public class FacebookLoginHelper extends EventDispatcher implements IEventDispatcher
   {
      
      private static const ANE_DEVELOPER_KEY:String = "66c181391b50be1b11165827b2762f962714f4a3Xi/Sq09vwrzu6K4HYYSR6cJtnB+FvRom1EKQl9AepUwjSTAzToYAxqbhB+2JDGjhCtT6lXRppBsRDDwnAj7RqQFhYxSjUQGFV1DHM5Rys6/KnSjKnx4Lmmyj7zYlcjfPc0P5jrYzcOz8fpnlljIrFxLNI93DU5xHvNRQrFyTCv8Kfbh1KtI8HpzGKA1HCkJvsLjAkksdY5dzrSsnomrdNfrko+DeQdkyiG4A38CMGv8yAsL6nZXLYK9Up4XWfe27680iMWB975/ysXKuwyJVnj1kHH2SFScmEo7AQ1XtcJUlSfFhk4+q1LjD6oVVYO8Y/QqBBk1l3whW7OsS7nJ+CQ==";
      
      private static const URL_SCHEME_SUFFIX:String = "";
       
      
      private var _isFacebookInitialized:Boolean;
      
      private var _appId:String;
      
      private var _firstName:String;
      
      private var _name:String;
      
      private var _lastName:String;
      
      public function FacebookLoginHelper(param1:String)
      {
         super();
         this._appId = param1;
         this.initFacebook();
      }
      
      public static function get isFacebookSupported() : Boolean
      {
         return true;
      }
      
      public function get appId() : String
      {
         return this._appId;
      }
      
      public function dispose() : void
      {
         if(this._isFacebookInitialized)
         {
            if(!§_-dE§.§_-2dp§("autologin"))
            {
               this.closeSession();
            }
            if(!§_-7C§.isDesktop() && FacebookAPI.isSupported)
            {
               FacebookAPI.service.removeEventListener("facebookapi:session:opened",this.onFacebookSessionEvent);
               FacebookAPI.service.removeEventListener("facebookapi:session:open:error",this.onFacebookSessionEvent);
               FacebookAPI.service.removeEventListener("facebookapi:session:open:disabled",this.onFacebookSessionEvent);
               FacebookAPI.service.removeEventListener("facebookapi:session:open:cancelled",this.onFacebookSessionEvent);
               FacebookAPI.service.removeEventListener("facebookapi:session:closed",this.onFacebookSessionEvent);
               FacebookAPI.service.removeEventListener("facebookapi:session:close:error",this.onFacebookSessionEvent);
               FacebookAPI.service.removeEventListener("facebookapi:permissions:request:cancelled",this.onFacebookSessionEvent);
               FacebookAPI.service.removeEventListener("facebookapi:permissions:request:completed",this.onFacebookSessionEvent);
               FacebookAPI.service.removeEventListener("facebookapi:permissions:request:error",this.onFacebookSessionEvent);
            }
         }
      }
      
      public function isSessionOpen() : Boolean
      {
         if(isFacebookSupported)
         {
            return FacebookAPI.service.isSessionOpen();
         }
         return false;
      }
      
      public function getAccessToken() : String
      {
         var _loc1_:* = null;
         if(isFacebookSupported)
         {
            _loc1_ = FacebookAPI.service.getAccessToken();
            return !!_loc1_?_loc1_.token:"";
         }
         return "";
      }
      
      public function getFBName() : String
      {
         return this._name;
      }
      
      public function closeSession() : void
      {
         if(isFacebookSupported)
         {
            FacebookAPI.service.closeSession();
         }
      }
      
      public function startFacebookLogin() : void
      {
         var _loc1_:* = null;
         var _loc2_:Boolean = false;
         if(isFacebookSupported)
         {
            FacebookAPI.service.addEventListener("facebookapi:session:opened",this.onFacebookSessionEvent,false,0,true);
            FacebookAPI.service.addEventListener("facebookapi:session:open:error",this.onFacebookSessionEvent,false,0,true);
            FacebookAPI.service.addEventListener("facebookapi:session:open:cancelled",this.onFacebookSessionEvent,false,0,true);
            FacebookAPI.service.addEventListener("facebookapi:session:open:disabled",this.onFacebookSessionEvent,false,0,true);
            FacebookAPI.service.addEventListener("facebookapi:session:closed",this.onFacebookSessionEvent,false,0,true);
            FacebookAPI.service.addEventListener("facebookapi:session:close:error",this.onFacebookSessionEvent,false,0,true);
            FacebookAPI.service.addEventListener("facebookapi:permissions:request:cancelled",this.onFacebookSessionEvent,false,0,true);
            FacebookAPI.service.addEventListener("facebookapi:permissions:request:completed",this.onFacebookSessionEvent,false,0,true);
            FacebookAPI.service.addEventListener("facebookapi:permissions:request:error",this.onFacebookSessionEvent,false,0,true);
            if(FacebookAPI.service.isSessionOpen())
            {
               this.getCurrentUserInfo();
            }
            else
            {
               _loc1_ = ["email"];
               _loc2_ = true;
               FacebookAPI.service.createSession(_loc1_,_loc2_,!!FacebookAPI.service.userHasIntegratedFacebookAccount()?"system_account":"native_with_fallback");
               Logger.log("FacebookLoginHelper.onLoginWithFacebook: waiting callback from createSession..");
            }
         }
      }
      
      private function initFacebook() : void
      {
         if(this._isFacebookInitialized)
         {
            return;
         }
         if(isFacebookSupported)
         {
            Core.init();
            FacebookAPI.init("66c181391b50be1b11165827b2762f962714f4a3Xi/Sq09vwrzu6K4HYYSR6cJtnB+FvRom1EKQl9AepUwjSTAzToYAxqbhB+2JDGjhCtT6lXRppBsRDDwnAj7RqQFhYxSjUQGFV1DHM5Rys6/KnSjKnx4Lmmyj7zYlcjfPc0P5jrYzcOz8fpnlljIrFxLNI93DU5xHvNRQrFyTCv8Kfbh1KtI8HpzGKA1HCkJvsLjAkksdY5dzrSsnomrdNfrko+DeQdkyiG4A38CMGv8yAsL6nZXLYK9Up4XWfe27680iMWB975/ysXKuwyJVnj1kHH2SFScmEo7AQ1XtcJUlSfFhk4+q1LjD6oVVYO8Y/QqBBk1l3whW7OsS7nJ+CQ==");
            if(§_-7C§.§_-4Em§())
            {
            }
            FacebookAPI.service.initialiseApp(this._appId,"");
            Logger.log("FacebookAPI Supported:  " + FacebookAPI.isSupported);
            Logger.log("FacebookAPI Version:    " + FacebookAPI.service.version);
            Logger.log("Facebook SDK Version:   " + FacebookAPI.service.getSDKVersion());
            Logger.log("Facebook Integrated FB: " + FacebookAPI.service.userHasIntegratedFacebookAccount());
            Logger.log("Facebook App Installed: " + FacebookAPI.service.isFacebookAppInstalled());
            Logger.log("Facebook native version: " + FacebookAPI.service.nativeVersion);
            Logger.log("Facebook implementation: " + FacebookAPI.service.implementation);
            this._isFacebookInitialized = true;
         }
         else
         {
            Logger.log("FacebookAPI extension is not supported on this platform.");
         }
      }
      
      private function onFacebookSessionEvent(param1:FacebookAPISessionEvent) : void
      {
         Logger.log("Received Facebook Session Event: " + param1.type);
         var _loc3_:AccessToken = param1.accessToken;
         if(_loc3_ != null)
         {
            Logger.log("[Facebook] User ID: " + _loc3_.userId);
            Logger.log("[Facebook] Application ID: " + _loc3_.applicationId);
            Logger.log("[Facebook] Access token: " + _loc3_.token);
            Logger.log("[Facebook] Expiration date: " + _loc3_.expirationTimestamp);
            Logger.log("[Facebook] Permissions: " + _loc3_.permissions.join(", "));
            Logger.log("[Facebook] Declined permissions: " + _loc3_.declinedPermissions.join(", "));
         }
         var _loc2_:Profile = param1.profile;
         if(_loc2_ != null)
         {
            this._firstName = _loc2_.firstName;
            this._name = _loc2_.name;
            this._lastName = _loc2_.lastName;
            Logger.log("[Facebook] Profile id: " + _loc2_.id);
            Logger.log("[Facebook] Profile name: " + _loc2_.name);
            Logger.log("[Facebook] Profile first name: " + _loc2_.firstName);
            Logger.log("[Facebook] Profile middle name: " + _loc2_.middleName);
            Logger.log("[Facebook] Profile last name: " + _loc2_.lastName);
            Logger.log("[Facebook] Profile link URL: " + _loc2_.linkUrl);
            Logger.log("[Facebook] Profile picture URL: " + _loc2_.pictureUrl);
         }
         var _loc4_:* = param1.type;
         switch(_loc4_)
         {
            case "facebookapi:session:opened":
               Logger.log("[Facebook] Session opened");
               this.getCurrentUserInfo();
               break;
            case "facebookapi:session:open:error":
               Logger.log("[Facebook] Session open error: " + param1.errorCode + " " + param1.errorMessage);
               dispatchEvent(new §_-00P§("FLE_SESSION_ERROR"));
               break;
            case "facebookapi:session:open:disabled":
               Logger.log("[Facebook] Session login is disabled");
               dispatchEvent(new §_-00P§("FLE_FACEBOOK_DISABLED"));
               break;
            case "facebookapi:session:open:cancelled":
               Logger.log("[Facebook] User cancelled sign-in");
               break;
            case "facebookapi:session:closed":
               Logger.log("[Facebook] Session closed");
               break;
            case "facebookapi:session:close:error":
               Logger.log("[Facebook] Error for session closed: " + param1.errorCode + " " + param1.errorMessage);
               break;
            default:
               Logger.log("[Facebook] Received unhandled SESSION event: " + param1.type);
         }
      }
      
      private function onGraphApiComplete(param1:GraphAPIRequestEvent) : void
      {
         Logger.log("[Facebook] GRAPH_REQUEST_COMPLETED" + param1.type + " " + param1.data);
         if(this._name == null || this._name == "")
         {
            this._name = param1.data.name;
         }
         Logger.log("Facebook session ready, access data received.");
         dispatchEvent(new §_-00P§("FLE_SESSION_READY"));
         param1.currentTarget.removeEventListener("facebookapi:graphapirequest:complete",this.onGraphApiComplete);
         param1.currentTarget.removeEventListener("facebookapi:graphapirequest:error",this.onGraphApiError);
      }
      
      private function onGraphApiError(param1:GraphAPIRequestEvent) : void
      {
         Logger.log("[Facebook] GRAPH_REQUEST_ERROR: " + param1.errorCode + " " + param1.errorMessage);
         dispatchEvent(new §_-00P§("FLE_SESSION_ERROR"));
         param1.currentTarget.removeEventListener("facebookapi:graphapirequest:complete",this.onGraphApiComplete);
         param1.currentTarget.removeEventListener("facebookapi:graphapirequest:error",this.onGraphApiError);
      }
      
      private function getCurrentUserInfo() : void
      {
         Logger.log("Get current user info");
         var _loc2_:GraphAPIRequestBuilder = new GraphAPIRequestBuilder();
         _loc2_.setPath("/me");
         _loc2_.addField("name");
         var _loc1_:GraphAPIRequest = _loc2_.build();
         Logger.log("Created request: " + _loc1_);
         try
         {
            Logger.log("Request data: " + _loc1_.path + " fields: " + _loc1_.fields);
         }
         catch(error:Error)
         {
            trace("Could not request data, error: " + error.getStackTrace(),error.message,error.errorID,error.name);
         }
         _loc1_.addEventListener("facebookapi:graphapirequest:complete",this.onGraphApiComplete);
         _loc1_.addEventListener("facebookapi:graphapirequest:error",this.onGraphApiError);
         Logger.log("Make request: " + _loc1_.path + " fields: " + _loc1_.fields);
         FacebookAPI.service.graphAPI.makeRequest(_loc1_);
         Logger.log("Request done");
      }
   }
}
