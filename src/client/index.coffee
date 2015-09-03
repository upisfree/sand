THREE = require 'three'
CANNON = require 'cannon'

timeStep = 1 / 60

# init three
scene = new THREE.Scene()
camera = new THREE.PerspectiveCamera 75, window.innerWidth / window.innerHeight, 1, 100
camera.position.z = 5
scene.add camera
geometry = new THREE.BoxGeometry 2, 2, 2
material = new THREE.MeshBasicMaterial { color: 0xff0000, wireframe: true }
mesh = new THREE.Mesh geometry, material
scene.add mesh
renderer = new THREE.WebGLRenderer()
renderer.setSize window.innerWidth, window.innerHeight
document.body.appendChild renderer.domElement

# init cannon
world = new CANNON.World()
world.gravity.set 0, 0, 0
world.broadphase = new CANNON.NaiveBroadphase()
world.solver.iterations = 10
shape = new CANNON.Box new CANNON.Vec3 1, 1, 1
mass = 1
body = new CANNON.Body
  mass: 1

body.addShape shape
body.angularVelocity.set 0, 10, 0
body.angularDamping = 0.5
world.addBody body

animate = ->
  requestAnimationFrame animate
  updatePhysics()
  render()

updatePhysics = ->
  # Step the physics world
  world.step timeStep
  # Copy coordinates from Cannon.js to Three.js
  mesh.position.copy body.position
  mesh.quaternion.copy body.quaternion

render = ->
  renderer.render scene, camera

animate()

# # render
# animate = ->
#   requestAnimationFrame animate

#   mesh.rotation.x += 0.01
#   mesh.rotation.y += 0.02

#   renderer.render scene, camera

# # init
# scene = new THREE.Scene()

# camera = new THREE.PerspectiveCamera 75, window.innerWidth / window.innerHeight, 1, 10000
# camera.position.z = 1500

# geometry = new THREE.CylinderGeometry 100, 100, 500, 8
# material = new THREE.MeshBasicMaterial
#   color: 0xffff00
#   wireframe: true

# mesh = new THREE.Mesh geometry, material
# scene.add mesh

# renderer = new THREE.WebGLRenderer()
# renderer.setSize window.innerWidth, window.innerHeight

# document.body.appendChild renderer.domElement

# # start
# animate()