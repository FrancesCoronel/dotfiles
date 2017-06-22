@import "const/library.js";

var onRun = function(context) {

  var plugin        = context.plugin
  var doc           = context.document
  var selection     = context.selection

  // 1. create a wrapper window
  var wrapper       = Library.Widgets.window("Add an icon with its name","Firstly select font")
  var json          = Library.fetch.json("fonts.json",plugin)
  var fonts         = [json objectForKey:@"fonts"]

  // 2. create a combobox to select font
  var selectbox     = [[NSComboBox alloc] initWithFrame:NSMakeRect(40,175,150,24)]
  selectbox.addItemsWithObjectValues(fonts)
  selectbox.setItemHeight(20.0)
  selectbox.selectItemAtIndex(0)
  selectbox.setEditable(false)

  wrapper.main.addSubview(selectbox)

  // 3. create a text field to write icon name
  var icon_name     = [[NSTextField alloc] initWithFrame:NSMakeRect(200,175,150,24)]
  icon_name.setBackgroundColor(NSColor.clearColor())
  icon_name.setPlaceholderString(@"Write an icon name here")
  icon_name.setTarget(self)
  icon_name.setCOSJSTargetFunction(function(sender){
    wrapper.window.orderOut(nil)
    NSApp.stopModalWithCode(NSOKButton)
  })
  wrapper.main.addSubview(icon_name)

  // 4. create a add button
  var submit = [[NSButton alloc] initWithFrame:NSMakeRect(390, 150, 200, 50)]
  submit.setTitle("")
  submit.setAction("callAction:")
  submit.setWantsLayer(true)
  submit.setCOSJSTargetFunction(function(sender) {
    wrapper.window.orderOut(nil)
    NSApp.stopModalWithCode(NSOKButton)
  })

  // 4.1. create a layer for submit button
  var submit_text = CATextLayer.layer()
  submit_text.setBackgroundColor(NSColor.blackColor())
  submit_text.setForegroundColor(CGColorCreateGenericRGB(215/255, 159/255, 0/255, 1.0))
  submit_text.setFontSize(18)
  submit_text.contentsScale = NSScreen.mainScreen().backingScaleFactor()
  submit_text.string = "+ Add Icon"

  submit.setLayer(submit_text)
  wrapper.main.addSubview(submit)

  // 5. build window
  var response = NSApp.runModalForWindow(wrapper.window)

  // if is the response is ok, add icon
  if (response == NSOKButton) {
    writed_icon       = icon_name.stringValue()
    selected_font     = selectbox.objectValueOfSelectedItem()
    font              = fonts[selected_font]
    icons             = Library.fetch.json("/bundle/" + font.path,plugin)

    // 6. Find matched icon
    var matched       = Library.fetch.icon("alias",writed_icon.lowercaseString(),icons)

    // 7. Check icon name
    if (matched.alias != undefined) {
      name = matched.alias + ' - ' + selected_font
      icon = Library.parse.escape('\\u' + matched.unicode)

      Library.create.icon(plugin,doc,selection,selected_font,name,icon)

    } else {
      // Show an error when user write a wrong icon name.
      doc.showMessage('Please write a correct icon name.')
    }
  }
};
