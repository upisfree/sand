# matter/render.coffee
# Add text render to default Matter's renderer
# Code by @liabru, all glory is his.

# aliases
RenderPixi = Matter.RenderPixi
Common = Matter.Common
Composite = Matter.Composite
Vector = Matter.Vector
Bounds = Matter.Bounds

RenderPixi.create = (options) ->
  defaults =
    controller: RenderPixi
    element: null
    canvas: null
    options:
      width: 800
      height: 600
      background: '#fafafa'
      wireframeBackground: '#222'
      hasBounds: false
      enabled: true
      wireframes: true
      showSleeping: true
      showDebug: false
      showBroadphase: false
      showBounds: false
      showVelocity: false
      showCollisions: false
      showAxes: false
      showPositions: false
      showAngleIndicator: false
      showIds: false
      showShadows: false

  render = Common.extend defaults, options
  transparent = not render.options.wireframes and render.options.background is 'transparent'

  # init pixi
  render.context = new PIXI.WebGLRenderer render.options.width, render.options.height,
    view: render.canvas
    transparent: transparent
    antialias: true
    backgroundColor: options.background

  render.canvas = render.context.view
  render.container = new PIXI.Container()
  render.bounds = render.bounds or
    min:
      x: 0
      y: 0
    max:
      x: render.options.width
      y: render.options.height

  # caches
  render.textures = {}
  render.sprites = {}
  render.primitives = {}

  render.spriteContainer = new PIXI.Container()
  render.textContainer = new PIXI.Container()

  render.container.addChild render.spriteContainer
  render.container.addChild render.textContainer

  # insert canvas
  if Common.isElement render.element
    render.element.appendChild render.canvas
  else
    Common.log 'No "render.element" passed, "render.canvas" was not inserted into document.', 'warn'

  # prevent menus on canvas
  render.canvas.oncontextmenu = -> return false
  render.canvas.onselectstart = -> return false

  return render

RenderPixi.clear = (render) ->
  container = render.container
  spriteContainer = render.spriteContainer

  # clear stage container
  for i in container.children
    container.removeChild i

  # clear sprite batch
  for i in spriteContainer.children
    spriteContainer.removeChild i

  bgSprite = render.sprites['bg-0']

  # clear caches
  render.textures = {}
  render.sprites = {}
  render.primitives = {}

  # set background sprite
  render.sprites['bg-0'] = bgSprite
  if bgSprite
    container.addChildAt bgSprite, 0

  # add sprite batch back into container
  render.container.addChild render.spriteContainer
  render.container.addChild render.textContainer

  # reset background state
  render.currentBackground = null

  # reset bounds transforms
  container.scale.set 1, 1
  container.position.set 0, 0

RenderPixi.world = (engine) ->
  render = engine.render
  world = engine.world
  context = render.context
  container = render.container
  options = render.options
  bodies = Composite.allBodies world
  allConstraints = Composite.allConstraints world
  constraints = []

  if options.wireframes
    RenderPixi.setBackground render, options.wireframeBackground
  else
    RenderPixi.setBackground render, options.background

  # handle bounds
  boundsWidth = render.bounds.max.x - render.bounds.min.x
  boundsHeight = render.bounds.max.y - render.bounds.min.y
  boundsScaleX = boundsWidth / render.options.width
  boundsScaleY = boundsHeight / render.options.height

  if options.hasBounds
    # Hide bodies that are not in view
    for body in bodies
      body.render.sprite.visible = Bounds.overlaps body.bounds, render.bounds

    # filter out constraints that are not in view
    for constraint in allConstraints
      bodyA = constraint.bodyA
      bodyB = constraint.bodyB
      pointAWorld = constraint.pointA
      pointBWorld = constraint.pointB

      if bodyA
        pointAWorld = Vector.add bodyA.position, constraint.pointA
      
      if bodyB
        pointBWorld = Vector.add bodyB.position, constraint.pointB

      if not pointAWorld or not pointBWorld
        continue

      if Bounds.contains(render.bounds, pointAWorld) or Bounds.contains(render.bounds, pointBWorld)
        constraints.push constraint

    # transform the view
    container.scale.set 1 / boundsScaleX, 1 / boundsScaleY
    container.position.set -render.bounds.min.x * (1 / boundsScaleX), -render.bounds.min.y * (1 / boundsScaleY)
  else
    constraints = allConstraints


  for body in bodies
    RenderPixi.body engine, body

  for constraint in constraints
    RenderPixi.constraint engine, constraint
  # render text
  for text in render.textContainer.children
    render.textContainer.addChildAt text, 0

  context.render container

# export
module.exports = RenderPixi