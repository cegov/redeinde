// This class is used to define how elements will behave in high contrast mode
// to define the intended look do so in the file bootstrap_and_overrides.css.less
var HighContrast = {
	isOn: "0",
	objDefaults: {
		initTarget: "#high-contrast-tgt",
		
		/**********************************************************************/
		// ADD TO THE LIST PAGE ELEMENTS THAT SHOULD HAVE THEIR COLOR CHANGED IN 
		// HIGH CONTRAST MODE
		backgroundTargets: ['header', '#accessibility_menu', "#logo_bar", 
			"#page .sidebar-nav", "#nav_services .navbar-inner", "body", 
			"footer", "footer #government_links", "footer #footer_links"
		]
		/**********************************************************************/
	}, 
	init: function(){
		if(typeof($.cookie("high-contrast") == "undefined")){
			HighContrast.isOn = $.cookie("high-contrast");
		}
		else {
			HighContrast.isOn = "0";
			$.cookie("high-contrast", "0");
		}
		this.initAccessibilityButton();	
		this.setContrastAccordingToCookie();		
	},
	initAccessibilityButton: function(){
		var self = this;	
		
		$(HighContrast.objDefaults.initTarget).on('click', function(){
			if(HighContrast.isOn == false){
				HighContrast.isOn = true;
				$.cookie("high-contrast", "1");
				self.changeElementColorsToHighContrast();				
			}
			else {
				HighContrast.isOn = false; 
				$.cookie("high-contrast", "0"); 				
				$.each(HighContrast.objDefaults.backgroundTargets, function( index, idOrClassOfTheElement ) {
					$(idOrClassOfTheElement).removeClass("high-contrast");
				});
			}			
		});
	},
	setContrastAccordingToCookie: function(){
		if($.cookie("high-contrast") == "1"){
			this.changeElementColorsToHighContrast();
		}
	},
	changeElementColorsToHighContrast: function(){
		$.each(HighContrast.objDefaults.backgroundTargets, function( index, idOrClassOfTheElement ) {
			$(idOrClassOfTheElement).addClass("high-contrast");					 
		});
	} 
	
	
	
};