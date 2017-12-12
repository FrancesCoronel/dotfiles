var onRun = function(context) {
	lf(context, function() {
		SketchRunner.launchWithContext(context);
	});
}
var onStart = function(context) {
	lf(context, function() {
		SketchRunner.startRunner(context);
	});
}
var onDocOpen = function(context) {
	lf(context, function() {
		SketchRunner.configureForDocument(context);
	})
}
var onRunAction = function(context) {
	var command = customCommands[context.command.identifier()];
	if (command) {
		command(context);
	}
}
var lf = function(context, callback) {
	var FRAMEWORK_NAME = "SketchRunner";
	try {
		callback();
	} catch(e) {
		var pluginBundle = NSBundle.bundleWithURL(context.plugin.url()),
        	mocha = Mocha.sharedRuntime();
        if(mocha.loadFrameworkWithName_inDirectory(FRAMEWORK_NAME, pluginBundle.resourceURL().path())) {
			callback();
        } else {        	
            print("Error while loading framework '"+FRAMEWORK_NAME+"`");
        }
	}
}
var customCommands = {
	resizeSymbolToMaster : function(context) {
		var selection = context.selection,
		    loop = selection.objectEnumerator(), layer;
		while(layer = loop.nextObject()) {
		    if(layer.class() === MSSymbolInstance) {
		        layer.resetSizeToMaster()
		    }
		}
	}
}