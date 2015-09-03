// Generated by CoffeeScript 1.9.3
var engine, filters;

engine = require('../core/engine.js');

filters = {
  enable: function() {
    filters.pixelate = new PIXI.filters.PixelateFilter();
    filters.color = new PIXI.filters.ColorMatrixFilter();
    filters.color.matrix = [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1];
    return engine.render.container.filters = [filters.pixelate];
  },
  disable: function() {
    return engine.render.container.filters = [];
  },
  update: function(time) {
    if (engine.render.container.filters) {
      filters.color.matrix[2] = Math.sin(time * 2);
      return filters.color.matrix[6] = Math.cos(time * 2);
    }
  }
};

module.exports = filters;
