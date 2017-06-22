

var OBJCParser = function(object){
    this.sketch = object;
    
    var windows = [NSApp windows];
    
    this.currentWindow = object.document.documentWindow();
    
    var __dirname = this.sketch.context.scriptPath.stringByDeletingLastPathComponent()
    
    var manifestData = [NSData dataWithContentsOfFile:__dirname + "/manifest.json"];
    
    var manifest = [NSJSONSerialization JSONObjectWithData:manifestData options:0 error:nil];

    var mocha = Mocha.sharedRuntime()
    
    mocha.loadFrameworkWithName_inDirectory('SExtension', __dirname);
        
    this.seParsingController = [[SEParsingController sharedInstance] beginParsingWith:this.sketch manifest:manifest];
}
