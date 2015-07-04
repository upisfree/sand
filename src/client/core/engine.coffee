Engine = Matter.Engine.create document.body,
  world:
    gravity:
      x: 0
      y: 0
  enableSleeping: true
  render:
    element: document.body # временно
    controller: Matter.RenderPixi
    options:
      width: window.w
      height: window.h
      wireframes: false
      background: '#ccc'