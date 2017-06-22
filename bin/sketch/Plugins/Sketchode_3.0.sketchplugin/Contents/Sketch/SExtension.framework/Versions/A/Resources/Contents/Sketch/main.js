
@import "OBJCParser.js"

var Sketch = function(app,context) {
    this.app = app.delegate;
    this.context = context;
    this.document = context.document;
    this.pages = context.document.pages();
    this.__dirname = context.scriptPath.stringByDeletingLastPathComponent();
    
    var title1 = this.document.window().title();
    var title2 = [[title1 stringByReplacingOccurrencesOfString:@" " withString:@"_"] stringByReplacingOccurrencesOfString:@".sketch" withString:@""];

    this.title = [NSString stringWithFormat:@"%@.%@", title2,@"sketchode"];
};


var onRun = function(context) {
    var sketch = new Sketch(NSApp,context);
    
    var objcParser = new OBJCParser(sketch);
};