(function(){var a,b,c,d,e,f,g,h,i,j;for(window.w=window.innerWidth,window.h=window.innerHeight,a=Matter.Engine.create(document.body,{world:{gravity:{x:0,y:0},bounds:{min:{x:-(1/0),y:-(1/0)},max:{x:1/0,y:1/0}}},enableSleeping:!0,render:{controller:Matter.RenderPixi,options:{width:window.w,height:window.h,wireframes:!1,background:"#ccc"}}}),Math.randomInt=function(a,b){return Math.floor(Math.random()*(b-a+1)+a)},Math.radiansToDegrees=function(a){return a*(180/Math.PI)},Math.degreesToRadians=function(a){return a*(Math.PI/180)},Math.angleFromVector=function(a,b){return Math.atan2(window.h/2-b,window.w/2-a)-Math.PI/2},c=Matter.Vector,c.fromAngle=function(a){return a-=Math.PI/2,{x:Math.cos(a),y:Math.sin(a)}},Array.prototype.min=function(){return Math.min.apply(null,this)},Array.prototype.max=function(){return Math.max.apply(null,this)},Array.prototype.remove=function(a){var b,c,d;d=[];for(b in this)c=this[b],c.i===a.i?d.push(this.splice(b,1)):d.push(void 0);return d},d=function(b){return Matter.Composite.add(a.world,b)},b=function(){function a(a,b){this.body=Matter.Bodies.rectangle(a,b,100,100,{mass:100,frictionAir:.25}),this.enableControl(this.body),d(this.body)}return a.prototype.enableControl=function(a){return window.onmousemove=function(b){return a.angle=Math.angleFromVector(b.x,b.y)},window.onkeydown=function(b){var d;switch(d=1.5,b.keyCode){case 87:case 38:return Matter.Body.applyForce(a,{x:0,y:0},Matter.Vector.mult(c.fromAngle(a.angle),d));case 83:case 40:return Matter.Body.applyForce(a,{x:0,y:0},Matter.Vector.neg(Matter.Vector.mult(c.fromAngle(a.angle),d)))}}},a}(),Matter.Engine.run(a),a.render.container.filters=[new PIXI.filters.PixelateFilter],f=j=0;500>j;f=++j)Math.random()>.5?(i=Math.randomInt(25,75),e=Math.randomInt(150,250)):(i=Math.randomInt(150,250),e=Math.randomInt(25,75)),d(Matter.Bodies.rectangle(Math.randomInt(2*-window.w,2*window.w),Math.randomInt(2*-window.h,2*window.h),i,e,{isStatic:!0}));h=Matter.Composites.stack(0,0,15,4,0,0,function(a,b,c,d){var e,f;switch(Math.round(Math.random())){case 0:return Math.random()<.8?Matter.Bodies.rectangle(a,b,Math.randomInt(20,50),Math.randomInt(20,50)):Matter.Bodies.rectangle(a,b,Math.randomInt(80,120),Math.randomInt(20,30));case 1:return e=Math.round(Math.randomInt(1,8)),e=null!=(f=3===e)?f:{4:e},Matter.Bodies.polygon(a,b,e,Math.randomInt(20,50))}}),d(h),g=new b(window.w/2,window.h/2),a.render.options.hasBounds=!0,Matter.Events.on(a,"tick",function(b){return Matter.Bounds.shift(a.render.bounds,{x:g.body.position.x-window.w/2,y:g.body.position.y-window.h/2})})}).call(this);