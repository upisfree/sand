var characters,time;window.w=window.innerWidth,window.h=window.innerHeight,time=0,characters=[];var Engine;Engine=Matter.Engine.create(document.body,{world:{gravity:{x:0,y:0}},enableSleeping:!0,render:{controller:Matter.RenderPixi,options:{width:window.w,height:window.h,wireframes:!1,background:"#ccc"}}});var Net;Net={start:function(){return Net.io=io(""+Net.protocol+Net.address+":"+Net.port),Net.id=Net.io.io.engine.id,Net.io.on("connect",function(){return Net.id=Net.io.io.engine.id}),Net.io.on("first-connection-get-characters",function(t){return new Character(t.id,t.angle,t.motion,t.x,t.y)}),Net.io.on("character-connected",function(t){return t.id!==Net.id?new Character(t.id):void 0}),Net.io.on("character-turned",function(t){return t.id!==Net.id?characters[t.id].rotate(t.angle):void 0}),Net.io.on("character-moved",function(t){return t.id!==Net.id?characters[t.id].move(t.direction):void 0}),Net.io.on("character-disconnected",function(t){return removeFromWorld(characters[t.id].body),delete characters[t.id]})},io:null,id:null,protocol:"http://",address:"localhost",port:10101};var Vector,addToWorld,removeFromWorld;Math.randomInt=function(t,e){return Math.floor(Math.random()*(e-t+1)+t)},Math.radiansToDegrees=function(t){return t*(180/Math.PI)},Math.degreesToRadians=function(t){return t*(Math.PI/180)},Vector=Matter.Vector,Vector.fromAngle=function(t){return t-=Math.PI/2,{x:Math.cos(t),y:Math.sin(t)}},Vector.toAngle=function(t,e){return Math.atan2(window.h/2-e,window.w/2-t)-Math.PI/2},Array.prototype.first=function(){return this[0]},Array.prototype.last=function(){return this[this.length-1]},Array.prototype.min=function(){return Math.min.apply(null,this)},Array.prototype.max=function(){return Math.max.apply(null,this)},Array.prototype.remove=function(t){var e,r,n;r=[];for(e in this)n=this[e],r.push(n.i===t.i?this.splice(e,1):void 0);return r},addToWorld=function(t){return Matter.Composite.add(Engine.world,t)},removeFromWorld=function(t){return Matter.Composite.remove(Engine.world,t)};var Voice;Voice={start:function(){return Voice._setPrefixes(),Voice._supportGetUserMedia()?navigator.getUserMedia({audio:{mandatory:{googEchoCancellation:!0,googNoiseSuppression:!0,googHighpassFilter:!0,googAutoGainControl:!0}}},Voice.analyze,Voice.error):console.log("Can't find navigator.getUserMedia()!")},analyze:function(t){var e,r;return window.AudioContext=window.AudioContext||window.webkitAudioContext,e=new AudioContext,r=e.createMediaStreamSource(t),Voice.analyser=e.createAnalyser(),Voice.analyser.fftSize=2048,r.connect(Voice.analyser)},update:function(){var t,e,r,n,o,i,a,d;for(t=new Uint8Array(Voice.analyser.frequencyBinCount),Voice.analyser.getByteFrequencyData(t),e=0,n=0,i=t.length;i>n;n++)r=t[n],e+=parseFloat(r);for(e/=t.length,Engine.render.gl.clear(),Engine.render.gl.lineStyle(1,0,1),d=[],r=o=0,a=e;a>=0?a>=o:o>=a;r=a>=0?++o:--o)d.push(Engine.render.gl.drawCircle(player.body.position.x,player.body.position.y,10*r));return d},error:function(t){return console.log(t)},analyser:null,_setPrefixes:function(){return navigator.getUserMedia=navigator.getUserMedia||navigator.webkitGetUserMedia||navigator.mozGetUserMedia||navigator.msGetUserMedia},_supportGetUserMedia:function(){return!!navigator.getUserMedia}};var Character;Character=function(){function t(t,e,r,n,o){this.id=t,null==e&&(e=0),null==r&&(r=0),null==n&&(n=0),null==o&&(o=0),this.body=Matter.Bodies.rectangle(n,o,100,100,{angle:e,motion:r,mass:100,frictionAir:.25}),this.mult=1.5,addToWorld(this.body),characters[this.id]=this}return t.prototype.rotate=function(t){return this.body.angle=t},t.prototype.move=function(t){switch(t){case"up":return Matter.Body.applyForce(this.body,{x:0,y:0},Vector.mult(Vector.fromAngle(this.body.angle),this.mult));case"down":return Matter.Body.applyForce(this.body,{x:0,y:0},Vector.neg(Vector.mult(Vector.fromAngle(this.body.angle),this.mult)))}},t}();var Debug;Debug={walls:function(){var t,e,r,n,o;for(n=[],e=r=0;500>r;e=++r)Math.random()>.5?(o=Math.randomInt(25,75),t=Math.randomInt(150,250)):(o=Math.randomInt(150,250),t=Math.randomInt(25,75)),n.push(addToWorld(Matter.Bodies.rectangle(Math.randomInt(2*-window.w,2*window.w),Math.randomInt(2*-window.h,2*window.h),o,t,{isStatic:!0})));return n},stack:function(){return addToWorld(Matter.Composites.stack(0,0,15,4,0,0,function(t,e,r,n){var o,i;switch(Math.round(Math.random())){case 0:return Math.random()<.8?Matter.Bodies.rectangle(t,e,Math.randomInt(20,50),Math.randomInt(20,50)):Matter.Bodies.rectangle(t,e,Math.randomInt(80,120),Math.randomInt(20,30));case 1:return i=Math.round(Math.randomInt(1,8)),i=null!=(o=3===i)?o:{4:i},Matter.Bodies.polygon(t,e,i,Math.randomInt(20,50))}}))}};var Filters;Filters={enable:function(){return Filters.pixelate=new PIXI.filters.PixelateFilter,Filters.color=new PIXI.filters.ColorMatrixFilter,Filters.color.matrix=[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1],Engine.render.container.filters=[Filters.pixelate]},disable:function(){return Engine.render.container.filters=[]},update:function(t){return Engine.render.container.filters?(Filters.color.matrix[2]=Math.sin(2*t),Filters.color.matrix[6]=Math.cos(2*t)):void 0}};var Player,extend=function(t,e){function r(){this.constructor=t}for(var n in e)hasProp.call(e,n)&&(t[n]=e[n]);return r.prototype=e.prototype,t.prototype=new r,t.__super__=e.prototype,t},hasProp={}.hasOwnProperty;Player=function(t){function e(){var t;e.__super__.constructor.call(this),t=this,window.onmousemove=function(e){var r;return r=Vector.toAngle(e.x,e.y),t.rotate(r),Net.io.emit("character-turned",{angle:r})},window.onkeydown=function(e){var r;switch(r="",e.keyCode){case 87:case 38:r="up";break;case 83:case 40:r="down"}return t.move(r),Net.io.emit("character-moved",{direction:r})}}return extend(e,t),e}(Character);var player;Matter.Engine.run(Engine),player=new Player(window.w/2,window.h/2),Net.start(),Engine.render.options.hasBounds=!0,Matter.Events.on(Engine,"tick",function(t){return time+=.01,Matter.Bounds.shift(Engine.render.bounds,{x:player.body.position.x-window.w/2,y:player.body.position.y-window.h/2}),Filters.update(time)});