var emcUtils = {	
	sprintf:function(text) {
		var i=1, args=arguments;
		return text.replace(/%s/g, function() {
			return (i < args.length) ? args[i++] : "";
		});
	}
};