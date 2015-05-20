# Start
Matter.Engine.run Engine

body = Matter.Bodies.rectangle window.w / 2, window.h / 2, 100, 100
body2 = Matter.Bodies.rectangle window.w / 2, window.h / 2, 100, 100

addToWorld body
addToWorld body2

#Matter.Events.on Engine, 'tick', (e) ->