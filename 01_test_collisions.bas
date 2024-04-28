

'#include "fbgfx.bi"
#Include "ExtremePhysics.bi"

#Include "utiles.bi"


Dim As Integer room_width=900
Dim As Integer room_height=700
ScreenRes room_width,room_height,32,2

Randomize timer

Dim As Double world,body,shape,i,j,k,n,x,y,r,w,h

Dim as Double CentroX = room_width/2
Dim as Double CentroY = room_height/2



world = ep_world_create()
ep_world_set_settings(world, 1/5, 20, 0, 0.1, 0.5, 0.04, 0.5, 1)
' habilita el modo "dormir" que detiene el movimiento al no haber actividad
ep_world_set_sleeping(world,TRUE,60,0,0.002,0.0001) 

Dim As double xx,yy

Dim As double poly_octagon = ep_polygon_create(world,8)
	ep_polygon_set_vertex(world,poly_octagon,0,+16,-32)
	ep_polygon_set_vertex(world,poly_octagon,1,+32,-16)
	ep_polygon_set_vertex(world,poly_octagon,2,+32,+16)
	ep_polygon_set_vertex(world,poly_octagon,3,+16,+32)
	ep_polygon_set_vertex(world,poly_octagon,4,-16,+32)
	ep_polygon_set_vertex(world,poly_octagon,5,-32,+16)
	ep_polygon_set_vertex(world,poly_octagon,6,-32,-16)
	ep_polygon_set_vertex(world,poly_octagon,7,-16,-32)
	ep_polygon_initialize(world,poly_octagon)

Dim As double poly_triangle = ep_polygon_create(world,3)
	ep_polygon_set_vertex(world,poly_triangle,0,  0,-32)
	ep_polygon_set_vertex(world,poly_triangle,1,+32,+32)
	ep_polygon_set_vertex(world,poly_triangle,2,-32,+32)
	ep_polygon_initialize(world,poly_triangle)


Dim Shared As poligonos triangulo
triangulo.x=0
triangulo.y=0
triangulo.v=3
triangulo.xv(0)=0   : triangulo.yv(0)=-32
triangulo.xv(1)=32  : triangulo.yv(1)=32
triangulo.xv(2)=-32 : triangulo.yv(2)=32

Dim Shared As poligonos octagono
octagono.x=0
octagono.y=0
octagono.v=8
octagono.xv(0)=+16 : octagono.yv(0)=-32
octagono.xv(1)=+32 : octagono.yv(1)=-16
octagono.xv(2)=+32 : octagono.yv(2)=+16
octagono.xv(3)=+16 : octagono.yv(3)=+32
octagono.xv(4)=-16 : octagono.yv(4)=+32
octagono.xv(5)=-32 : octagono.yv(5)=+16
octagono.xv(6)=-32 : octagono.yv(6)=-16
octagono.xv(7)=-16 : octagono.yv(7)=-32


' 1
xx = 224
yy = 224

body  = ep_body_create_dynamic(world,FALSE)
shape = ep_shape_create_box(world,body,32,64,0,0,0,1)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_calculate_mass(world,body)
	ep_body_set_position(world,body,xx,yy-80,degtorad(60))
	ep_body_set_gravity(world,body,0,0.2)

body  = ep_body_create_static(world)
shape = ep_shape_create_box(world,body,64,32,0,0,0,0)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_set_position(world,body,xx+32,yy,degtorad(+5))

body  = ep_body_create_static(world)
shape = ep_shape_create_box(world,body,64,32,0,0,0,0)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_set_position(world,body,xx-32,yy,degtorad(-30))



' 2
xx = 448
yy = 224

body  = ep_body_create_dynamic(world,FALSE)
shape = ep_shape_create_circle(world,body,16,0,0,0,1)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_calculate_mass(world,body)
	ep_body_set_position(world,body,xx,yy-80,degtorad(0))
	ep_body_set_gravity(world,body,0,0.2)

body  = ep_body_create_static(world)
shape = ep_shape_create_box(world,body,64,32,0,0,0,0)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_set_position(world,body,xx+32,yy,degtorad(+5))

body  = ep_body_create_static(world)
shape = ep_shape_create_box(world,body,64,32,0,0,0,0)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_set_position(world,body,xx-32,yy,degtorad(-30))



' 3
xx = 672
yy = 224

body  = ep_body_create_dynamic(world,FALSE)
shape = ep_shape_create_polygon(world,body,poly_octagon,0,0,0,1)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_calculate_mass(world,body)
	ep_body_set_position(world,body,xx,yy-80,degtorad(0))
	ep_body_set_gravity(world,body,0,0.2)

body  = ep_body_create_static(world)
shape = ep_shape_create_box(world,body,64,32,0,0,0,0)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_set_position(world,body,xx+64,yy,degtorad(0))

body  = ep_body_create_static(world)
shape = ep_shape_create_box(world,body,64,32,0,0,0,0)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_set_position(world,body,xx-32,yy,degtorad(-30))



' 4
xx = 224
yy = 448

body  = ep_body_create_dynamic(world,FALSE)
shape = ep_shape_create_circle(world,body,16,0,0,0,1)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_calculate_mass(world,body)
	ep_body_set_position(world,body,xx,yy-160,degtorad(0))
	ep_body_set_gravity(world,body,0,0.2)

body  = ep_body_create_static(world)
shape = ep_shape_create_circle(world,body,16,0,0,0,0)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_set_position(world,body,xx-32,yy,degtorad(0))

body  = ep_body_create_static(world)
shape = ep_shape_create_circle(world,body,32,0,0,0,0)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_set_position(world,body,xx+32,yy,degtorad(0))



' 5
xx = 448
yy = 448

body  = ep_body_create_dynamic(world,FALSE)
shape = ep_shape_create_circle(world,body,16,0,0,0,1)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_calculate_mass(world,body)
	ep_body_set_position(world,body,xx,yy-80,degtorad(0))
	ep_body_set_gravity(world,body,0,0.2)

body  = ep_body_create_static(world)
shape = ep_shape_create_polygon(world,body,poly_octagon,0,0,0,0)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_set_position(world,body,xx-32,yy,degtorad(0))

body  = ep_body_create_static(world)
shape = ep_shape_create_polygon(world,body,poly_triangle,0,0,0,0)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_set_position(world,body,xx+32,yy,degtorad(0))



' 6
xx = 672
yy = 448

body  = ep_body_create_dynamic(world,FALSE)
shape = ep_shape_create_polygon(world,body,poly_triangle,0,0,degtorad(0),1) ' 15
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_calculate_mass(world,body)
	ep_body_set_position(world,body,xx,yy-80,degtorad(90+15)) ' 90
	ep_body_set_gravity(world,body,0,0.2)

body  = ep_body_create_static(world)
shape = ep_shape_create_polygon(world,body,poly_octagon,0,0,0,0)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_set_position(world,body,xx-48,yy,degtorad(0))

body  = ep_body_create_static(world)
shape = ep_shape_create_polygon(world,body,poly_octagon,0,0,0,0)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0,0.5,0,0)
	ep_body_set_position(world,body,xx+48,yy,degtorad(0))



Dim As Integer a
While InKey=""

	a=0
	While a<4
	   ep_world_update_contacts(world)
	   ep_world_simulate_step(world)
		a+=1
	Wend

	cls
	ScreenLock

	' 1
		EP_caja(world,1,32,64,2,cian) ' dinamico
		EP_caja(world,2,64,32,1,cian3) ' estatico
		EP_caja(world,3,63,32,1,cian3) ' estatico

	' 2
		EP_bola(world,4,2,16,cian) ' dinamico
		EP_caja(world,5,64,32,1,cian3) ' estatico
		EP_caja(world,6,63,32,1,cian3) ' estatico
		
	' 3
		EP_poli(world,7,octagono,2,cian) ' dinamico
		EP_caja(world,8,64,32,1,cian3) ' estatico
		EP_caja(world,9,63,32,1,cian3) ' estatico
		
	' 4
		EP_bola(world,10,2,16,cian) ' dinamico
		EP_bola(world,11,1,16,cian3) ' estatico
		EP_bola(world,12,1,32,cian3) ' estatico

	' 5
		EP_bola(world,13,2,16,cian) ' dinamico
		EP_poli(world,14,octagono,1,cian3) ' estatico
		EP_poli(world,15,triangulo,1,cian3)  ' estatico

	' 6
		EP_poli(world,16,triangulo,2,cian) ' dinamico
		EP_poli(world,17,octagono,1,cian3) ' estatico
		EP_poli(world,18,octagono,1,cian3) ' estatico

	ScreenUnLock

	Sleep 1
	ScreenCopy
	

Wend

fin:

ep_set_log_file(TRUE ,"ep_log.txt",0)
ep_print_object_tree()
ep_set_log_file(FALSE ,"",0)

ep_world_destroy(world)
