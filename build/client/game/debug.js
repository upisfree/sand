// Generated by CoffeeScript 1.9.3
var Text, debug;

Text = require('./text.js');

debug = {
  start: function() {
    var f;
    debug._text = new Text('sand 0.0.1', 22, 0x000000, 0, 0, true);
    f = new PIXI.filters.PixelateFilter();
    f.size.x = f.size.y = 2;
    return debug._text.filters = [f];
  },
  update: function(fps, ping, voice, playerX, playerY) {
    debug._text.text = "sand 0.0.1\nfps: " + (Math.round(fps)) + "\nping: " + ping + "\nvoice: " + (Math.round(voice)) + "\nx: " + (Math.round(playerX)) + "\ny: " + (Math.round(playerY));
    debug._text.position.x = playerX - window.w / 2 + 12;
    return debug._text.position.y = playerY - window.h / 2 + 12;
  },
  _text: null
};

module.exports = debug;
