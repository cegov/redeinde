/* 
 * Gets links that are inside a div and make a videogallery out of them 
 * 
 * Here we only provide configuration and initialization to blueimp plugin 
 * The plugin code is included by a gem
 */
 
 
var BlueImpPlugin = {
	// if this element is on page, the plugin starts
	initTarget: "#video-gallery", // A DIV WITH THIS ID MUST ENVELOP THE LINKS
	defaultOptions: {
		carousel: true,
		container: '#blueimp-video-carousel'
	},
	carouselSnippet:
		'<div id="blueimp-video-carousel" class="blueimp-gallery blueimp-gallery-carousel blueimp-gallery-controls">' +
		  '<div class="slides"></div>' +
		  '<h3 class="title"></h3>' + 
		  '<a class="prev">‹</a>' + 
		  '<a class="next">›</a>' +
		  '<a class="play-pause"></a>' + 
		  '<ol class="indicator"></ol>' + 
		'</div>'
	, 
	init: function(){		
		var me = this;
		console.log("hey", $(BlueImpPlugin.initTarget).length);			
		if( $(BlueImpPlugin.initTarget).length > 0){
			
			var $linksToYoutubeVideos = $(BlueImpPlugin.initTarget).find('a');
			
			// hide old gallery
			// $(BlueImpPlugin.initTarget).hide();
			
			// transforms video links into a blueimp video gallery array of {}s
			var links = [];
			$linksToYoutubeVideos.each(function(index) {
				var url = $(this).attr('href');  
				var urlAndId = url.match(/(?:https?:\/{2})?(?:w{3}\.)?youtu(?:be)?\.(?:com|be)(?:\/watch\?v=|\/)([^\s&]+)/);
				
				var title = $(this).text();
				if(urlAndId != null){	// adds only links that match youtube URL video criteria 
					var videoUrl = urlAndId[0];
					var videoId = urlAndId[1];
					links.push({
						title: title,
						youtube: videoId,
				        href: videoUrl,
				        type: 'text/html', 
				        poster: 'https://img.youtube.com/vi/' + videoId + '/maxresdefault.jpg'
				        
					});
				    
				}			     
			});
			console.log(links);
			
			//empty the contents of the original video div
			$(BlueImpPlugin.initTarget).empty();
			
			//put the carousel snippet on the page 
			$(BlueImpPlugin.initTarget).append(BlueImpPlugin.carouselSnippet);
			
			//init blueimp component with the links			
			blueimp.Gallery(links, BlueImpPlugin.defaultOptions );
		}
	}
};
