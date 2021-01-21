package §_-1Pm§
{
   import §_-0Jq§.§_-zb§;
   import §_-2T5§.LayoutGroup;
   import §_-2T5§.§_-Et§;
   import §_-3CR§.§_-0jK§;
   import starling.core.Starling;
   import starling.events.Event;
   
   public class §_-4X§ extends LayoutGroup
   {
      
      private static const §_-2Cw§:String = "/api/public/captcha";
      
      private static const §_-3Ho§:String = "token=";
       
      
      private var _controller:§_-2yq§;
      
      private var §_-2YS§:§_-Et§;
      
      public function §_-4X§(param1:§_-2yq§)
      {
         super();
         _controller = param1;
         var _loc3_:String = _controller.getProperty("web.api") + "/api/public/captcha";
         this.width = Starling.current.stage.stageWidth;
         this.height = Starling.current.stage.stageHeight;
         var _loc2_:int = HitchTheme.§_-4WH§ * 4;
         §_-2YS§ = new §_-Et§();
         §_-2YS§.x = _loc2_;
         §_-2YS§.y = HitchTheme.§_-4WH§;
         §_-2YS§.width = Starling.current.stage.stageWidth - _loc2_ * 2;
         §_-2YS§.height = Starling.current.stage.stageHeight - HitchTheme.§_-4WH§ * 2;
         §_-2YS§.loadString("<h1>Instructions</h1>Step 1: Go to <text style=\'background-color:#FFF696\'>habbo.com/api/public/captcha</text><br>Step 2: Complete the Captcha and copy the link address<br>Step 3: Paste the link here:<br<html><body> <input type=\'text\' id=\'txt\'/><input type=\'button\' id=\'btn\' value=\'Submit\'/> <script type=\'text/javascript\'> var newlink=document.getElementById(\'txt\');function redirect (){window.location.href=newlink.value;};document.getElementById(\'btn\').addEventListener(\'click\', redirect);document.getElementById(\'txt\').addEventListener(\'keydown\', function(e){if (e.keyCode==13){redirect();}}, false); </script></body></html>");
         addChild(§_-2YS§);
         §_-0jK§.§_-307§(this,§_-1jT§);
         §_-2YS§.addEventListener("locationChange",§_-40J§);
         §_-zb§.§_-3oz§(this,true);
      }
      
      override public function dispose() : void
      {
         _controller = null;
         if(§_-zb§.§_-3HU§(this))
         {
            §_-zb§.§_-08-§(this);
         }
         if(§_-2YS§)
         {
            §_-2YS§.removeFromParent(true);
            §_-2YS§ = null;
         }
         super.dispose();
      }
      
      private function §_-40J§(param1:Event) : void
      {
         var _loc2_:String = override();
         if(param1.type == "locationChange" && _loc2_ != null)
         {
            _controller.§_-3rc§(_loc2_);
         }
      }
      
      private function §_-1jT§(param1:Event) : void
      {
         if(_controller)
         {
            _controller.§_-3rc§(override());
         }
      }
      
      private function override() : String
      {
         var _loc1_:String = §_-2YS§.location;
         var _loc2_:int = _loc1_ != null?_loc1_.indexOf("token="):-1;
         if(_loc2_ < 0)
         {
            return null;
         }
         return _loc1_.substr(_loc2_ + "token=".length);
      }
   }
}
