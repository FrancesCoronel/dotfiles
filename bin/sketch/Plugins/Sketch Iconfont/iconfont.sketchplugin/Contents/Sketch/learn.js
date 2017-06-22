@import "const/library.js"

var onRun = function(context) {

  // 1. Get selected layer
  var plugin        = context.plugin
  var doc           = context.document
  var selection     = context.selection.firstObject()

  // 2. Check layer - is it a text layer?
  if (selection && selection.isKindOfClass(MSTextLayer)) {
    // 3. Get text of selected layer -> Parse text to get unicode
    var text        = selection.stringValue()
    var unicode     = Library.parse.unicode(text)
    // 4. Get font name
    var fontname    = selection.font().fontName()
    // 5. Get font properties with font name
    var font        = Library.fetch.font(fontname,plugin)
    // 6. Get icon list
    var icons       = Library.fetch.json("bundle/" + font.path,plugin)
    // 7. Find matched icon
    var matched     = Library.fetch.icon("unicode",unicode,icons)
    // 7.1. container of matched icon
    var html_cont   = font.container.replace("*****", matched.alias)

    // 8. Show name of the icon/html/itself
    var wrapper     = Library.Widgets.window("Use Selected Icon on Platforms",matched.alias)

        // 8.1. show html container of icon in textfield
        var icon_html = [[NSTextField alloc] initWithFrame:NSMakeRect(25, 190, 330, 30)]
        icon_html.setEditable(false)
        icon_html.setBezeled(true)
        icon_html.setBezelStyle(NSRoundedBezelStyle)
        icon_html.setFont(NSFont.systemFontOfSize(13))
        icon_html.setStringValue(html_cont)
        wrapper.main.addSubview(icon_html)

        // 8.2. show char of icon
        var icon_char = [[NSTextField alloc] initWithFrame:NSMakeRect(25, 70, 300, 50)]
        icon_char.setEditable(false)
        icon_char.setBordered(false)
        icon_char.setDrawsBackground(false)
        icon_char.setFont([NSFont fontWithName:@""+fontname size:40])
        icon_char.setStringValue(text)
        wrapper.main.addSubview(icon_char)

    // 9. They need to able to copy with buttons

        // 9.1. copy name of icon
        var copy_alias = Library.Widgets.copy(matched.alias,NSMakeRect(20, 290, 100, 30))
        wrapper.main.addSubview(copy_alias)

        // 9.2. copy html container of icon
        var copy_html = Library.Widgets.copy(html_cont,NSMakeRect(400, 190, 100, 30))
        wrapper.main.addSubview(copy_html)

        // 9.3. copy char of icon
        var copy_char = Library.Widgets.copy(text,NSMakeRect(400, 70, 100, 30))
        wrapper.main.addSubview(copy_char)

    NSApp.runModalForWindow(wrapper.window)

  } else {
    // Show an error when user select a wrong layer.
    doc.showMessage('Please select a text layer which contains an icon.')
  }
}
