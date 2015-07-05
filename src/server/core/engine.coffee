Matter = require '../lib/server/matter-server.js'

Engine = Matter.Engine.create
  world:
    gravity:
      x: 0
      y: 0
  enableSleeping: true