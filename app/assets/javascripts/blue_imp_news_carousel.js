/* 
 * Gets links that are inside a div and make a videogallery out of them 
 * 
 * Here we only provide configuration and initialization to blueimp plugin 
 * The plugin code is included by a gem
 */
 
var BlueImpNewsCarousel = {
	// if this element is on page, the plugin starts
	initTarget: "#home_news_box", // A DIV WITH THIS ID MUST ENVELOP THE LINKS
	defaultOptions: {
		carousel: true,
		container: '#blueimp-news-carousel'
	},	
	init: function(){		
		var me = this;							
		if( $(BlueImpNewsCarousel.initTarget).length > 0){    
			
			blueimp.Gallery(
			    document.getElementById('home_news_box').getElementsByTagName('a'),
			    {
			        container: '#blueimp-gallery-carousel',
			        carousel: true,
			        onslide: function (index, slide) {
		                var link = this.list[index].getAttribute('data-link');
		                $(slide).children().attr('href', link);
		            }
			    }
			);
			
		}
		// hack to allow going to other pages from blueimp pictures
		$('.slide-content').click(function(){
			console.log($(this).attr('href'));
			window.location.href = $(this).attr('href');
			return false;
		});
	}
};
