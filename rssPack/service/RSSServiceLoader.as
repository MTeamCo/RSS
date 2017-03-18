package rssPack.service
{
	import contents.LinkData;
	import contents.PageData;
	
	import restDoaService.RestDoaServiceCaller;
	
	public class RSSServiceLoader extends RestDoaServiceCaller
	{
		public function RSSServiceLoader(rssURL:String,offlineDataIsOK_v:Boolean=true, instantOfflineData_v:Boolean=false)
		{
			super(rssURL, null, offlineDataIsOK_v, instantOfflineData_v);
		}
		
		public function load():void
		{
			super.loadParam();
		}
		
		public function pageData():contents.PageData
		{
			var page:PageData = new PageData();
			try
			{
				var pagesXML:XML = XML(pureData);
				for(var i:int = 0 ; i<pagesXML.channel[0].item.length() ; i++)
				{
					var rssLink:LinkData = new LinkData();
					rssLink.name = pagesXML.channel[0].item[i].title;
					//Sat, 18 Mar 2017 09:31:41 GMT
					rssLink.dynamicData = new Date(pagesXML.channel[0].item[i].pubDate);
					rssLink.id = pagesXML.channel[0].item[i].link ;
					page.links1.push(rssLink);
				}
			}
			catch(e){};
			return page;
		}
	}
}