package rssPack.pages
	//rssPack.pages.RSSPage
{
	import contents.PageData;
	import contents.displayPages.DynamicLinks;
	import contents.interFace.PageContentBaseClass;
	
	import flash.events.Event;
	
	import restDoaService.RestDoaEvent;
	
	import rssPack.service.RSSServiceLoader;
	
	public class RSSPage extends PageContentBaseClass
	{
		private var service_getRSS:RSSServiceLoader ;
		
		private var myLinks:DynamicLinks ;
		
		public function RSSPage()
		{
			super();
			myLinks = Obj.findThisClass(DynamicLinks,this);
			this.addEventListener(Event.REMOVED_FROM_STAGE,unLoad);
		}
		
			protected function unLoad(event:Event):void
			{
				if(service_getRSS)
					service_getRSS.cansel();
			}
			
			protected function reloadRss(event:Event):void
			{
				service_getRSS.reLoad();
			}
		
		protected function rssLoaded(event:Event):void
		{
			var newsXML:XML = XML(service_getRSS.pureData);
			trace(newsXML);
			myLinks.setUp(service_getRSS.pageData());
		}
		
		override public function setUp(pageData:PageData):void
		{
			service_getRSS = new RSSServiceLoader(pageData.content);
			service_getRSS.addEventListener(RestDoaEvent.SERVER_RESULT,rssLoaded);
			service_getRSS.addEventListener(RestDoaEvent.CONNECTION_ERROR,reloadRss);
			
			service_getRSS.load();
		}
	}
}