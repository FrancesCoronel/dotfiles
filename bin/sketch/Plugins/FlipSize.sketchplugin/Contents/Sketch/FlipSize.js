var onRun = function(context) {
  var selection = context.selection;
  var layer = selection.firstObject();

  if (layer) {
    flipSize(layer)
  } else {
    log('Please select an artboard, layer or shape')
  }
}

/**
 * Get current size and flip width and height
 */
var flipSize = function(layer) {
  var midX=layer.frame().midX();
  var midY=layer.frame().midY();

  var height = layer.frame().height();
  var width = layer.frame().width();

  layer.setHeightRespectingProportions(width);
  layer.setWidthRespectingProportions(height);

  layer.frame().midX = midX;
  layer.frame().midY = midY;
}
