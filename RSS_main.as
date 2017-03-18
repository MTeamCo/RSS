package
{
	import contents.PageData;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import restDoaService.RestDoaEvent;
	
	import rssPack.pages.RSSPage;
	import rssPack.service.RSSServiceLoader;
	
	public class RSS_main extends MovieClip
	{

		private var service_rss:RSSServiceLoader;
		public function RSS_main()
		{
			super();
			
			var pageData:PageData = new PageData();
			pageData.content = "http://www.moi.ir/portal/rsspage/?fa-ir/news/165056/165074/%D9%85%D8%B1%D9%88%D8%B1-%D8%A7%D8%AE%D8%A8%D8%A7%D8%B1-%D8%A7%D8%B3%D8%AA%D8%A7%D9%86-%D9%87%D8%A7" ;
			
			var pageMC:RSSPage = new RSSPage();
			this.addChild(pageMC);
			pageMC.setUp(pageData);
			
			/*service_rss = new RSSServiceLoader();
			service_rss.addEventListener(RestDoaEvent.SERVER_RESULT,parsServerData)
			service_rss.load();*/
		}
		
		protected function parsServerData(event:Event):void
		{
			var xml:XML = XML(service_rss.pureData);
			trace(">>>>>>>\n\n\n\n\n\n\n\n>>>>>>>>>>\n"+xml);
		}
	}
}