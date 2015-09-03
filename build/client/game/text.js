// Generated by CoffeeScript 1.9.3
var Text, engine;

engine = require('../core/engine.js');

Text = (function() {
  function Text(text, size, color, x, y, isBold, isItalic, font) {
    var style, t;
    if (isBold == null) {
      isBold = false;
    }
    if (isItalic == null) {
      isItalic = false;
    }
    if (font == null) {
      font = 'Arial';
    }
    style = '';
    if (isBold) {
      style += 'bold ';
    }
    if (isItalic) {
      style += 'italic ';
    }
    style += size + 'px ';
    style += font;
    t = new PIXI.Text(text, {
      font: style,
      fill: color
    });
    t.position.x = x;
    t.position.y = y;
    engine.render.textContainer.addChild(t);
    return t;
  }

  return Text;

})();

module.exports = Text;
