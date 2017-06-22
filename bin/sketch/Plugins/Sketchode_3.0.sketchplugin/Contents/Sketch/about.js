
var onRun = function(context) {
    
    var __dirname = context.scriptPath.stringByDeletingLastPathComponent();
    
    var manifestData = [NSData dataWithContentsOfFile:__dirname + "/manifest.json"];
    
    var manifest = [NSJSONSerialization JSONObjectWithData:manifestData options:0 error:nil];
    
    var iconData = [NSData dataWithContentsOfFile:__dirname + "/icon.png"];
    
    var icon = [[NSImage alloc] initWithData:iconData];
    
    var alert = [[NSAlert alloc] init];

    [alert addButtonWithTitle:"Ok"];

    [alert setMessageText:"About"];
    [alert setInformativeText:"Sketchode Extension version: "+ manifest["version"]];
    [alert setIcon:icon];
    [alert runModal];
};