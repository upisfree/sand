// Generated by CoffeeScript 1.9.3
Matter.Events.on(Engine, 'tick', function() {
  var keys;
  keys = Object.keys(spanshots);
  if (keys.length > 1000) {
    delete spanshots[keys[0]];
  }
  return spanshots[Date.now()] = cloneObject(Engine.world);
});

Net.start();

setInterval(function() {
  return addToWorld(Matter.Bodies.rectangle(Math.randomInt(0, 1920), Math.randomInt(0, 1080), Math.randomInt(25, 100), Math.randomInt(25, 100)));
}, 250);

Matter.Engine.run(Engine);