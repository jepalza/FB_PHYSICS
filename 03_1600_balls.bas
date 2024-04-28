

'#include "fbgfx.bi"
#Include "ExtremePhysics.bi"

#Include "utiles.bi"



' medidas de pantalla
Dim As Integer room_width=900
Dim As Integer room_height=700
ScreenRes room_width,room_height,32,2 ' necesarias 2 pantallas para evitar el parpadeo

Randomize timer

Dim Shared As Double i,j,k,n,x,y,r,w
Dim Shared As Double b,s,xx,yy,vx,vy,d
Dim Shared As Double world,body,shape,list,dirs,dist,poly

Dim shared as double mousebody, mousehingejoint ' creacion de puntero de raton como entidad real
Dim Shared As Integer mouse_x, mouse_y, mouse_b

' centro de pantalla
Dim Shared As Double CentroX 
	CentroX= room_width/2
Dim Shared As Double CentroY 
	CentroY= room_height/2


type static_boxes
	as double w
	as double h
	as double x
	as double y
	as double r
end Type
Dim Shared As Integer num_staticboxes=3 ' 3 cajas para hacer muros estaticos en el borde de la pantalla
dim shared as static_boxes staticboxes(num_staticboxes-1)

Dim Shared As Integer num_balls=1600 ' en este ejemplo usamos 1600 pelotas
dim shared as integer boxes(num_balls-1)
	
	
	
	
	' creacion de "body 0" como "mundo" principal
	world = ep_world_create()
	ep_world_set_sleeping(world, TRUE, 60, 0, 0.002, 0.0001)
	ep_world_set_settings(world, 1/2, 20,  0, 0.1, 0.5, 0.04, 0.5, 1)

	' creacion de "body 1" para el puntero del raton
	mousebody = ep_body_create_static(world)
	mousehingejoint = -1.0




	' creacion de "body 2" para usar como entidad de colisiones con los elementos dibujados en el
	body  = ep_body_create_static(world)
	
	
	' creamos 3 cajas en el borde como "body 2" para usar como colisiones (como si fueran muros)
	staticboxes(0)=type(860, 32, 0, 300 - 16 , degtorad(0)  ) ' suelo
	staticboxes(1)=type(600, 32, +430 - 16, 0, degtorad(+90)) ' muro derecho
	staticboxes(2)=type(600, 32, -430 + 16, 0, degtorad(-90)) ' muro izquierdo
	
	b=0 ' suelo
	shape = ep_shape_create_box(world, body, staticboxes(b).w, staticboxes(b).h, staticboxes(b).x, staticboxes(b).y, staticboxes(b).r, 1)
	ep_shape_set_collision(world, body, shape, 1, 1, 0)
	ep_shape_set_material(world, body, shape, 0.2, 0.5, 0, 0)
	
	b=1 ' muro derecho
	shape = ep_shape_create_box(world, body, staticboxes(b).w, staticboxes(b).h, staticboxes(b).x, staticboxes(b).y, staticboxes(b).r, 1)
	ep_shape_set_collision(world, body, shape, 1, 1, 0)
	ep_shape_set_material(world, body, shape, 0.2, 0.5, 0, 0)
	
	b=2 ' muro izquierdo
	shape = ep_shape_create_box(world, body, staticboxes(b).w, staticboxes(b).h, staticboxes(b).x, staticboxes(b).y, staticboxes(b).r, 1)
	ep_shape_set_collision(world, body, shape, 1, 1, 0)
	ep_shape_set_material(world, body, shape, 0.2, 0.5, 0, 0)
	
	' y situamos los tres "muros" en relacion con centro de la pantalla
	ep_body_set_position(world, body, CentroX, CentroY, 0)
	

b=0
While b<num_balls ' 1600 pelotas
	body = ep_body_create_dynamic(world,FALSE )
	shape = ep_shape_create_circle(world,body,8,0,0,0,1)
	ep_shape_set_collision(world,body,shape,1,1,0)
	ep_shape_set_material(world,body,shape,0.2,0.5,0,0)
	ep_body_calculate_mass(world,body)
	ep_body_set_position(world,body,CentroX+rand(760)-380,CentroY+rand(500)-250,degtorad(rand(360)))
	ep_body_set_gravity(world,body,0,0.2)
	b+=1
Wend

' bucle principal
while TRUE
	
		GetMouse(mouse_x, mouse_y, , mouse_b)
		
		If inkey = Chr(27) then
			Exit While
		ElseIf mouse_b=1 Then
			' al picar con el raton sobre un "body" o "caja", la recoje y podemos jugar con ella
			if ep_world_collision_test_circle(world, 0, mouse_x, mouse_y, 0, 1, 1, 0) > 0 then
				b = ep_world_get_collision_body(world, 0)
				s = ep_world_get_collision_shape(world, 0)
				' debemos evitar que se vayan creando mas de un "mousehingejoint" si se 
				' mantiene el boton del raton presionado, por que se "cuelga"
				' para ello, empleamos "mousehingejoint=-1"
				if ep_body_is_static(world, b)=0 AndAlso mousehingejoint=-1 Then
					xx = ep_body_coord_world_to_local_x(world, b, mouse_x, mouse_y)
					yy = ep_body_coord_world_to_local_y(world, b, mouse_x, mouse_y)
					mousehingejoint = ep_hingejoint_create(world, b, mousebody, xx, yy, 0, 0, 0)
					ep_hingejoint_set_max_force(world, mousehingejoint, 10000)
				endif
			endif
		ElseIf mouse_b=0 Then
			' al soltar el boton del raton, se destruye la entidad "mousehingejoint" 
			' y el objeto que tuvieramos "agarrado", se suelta y cae con su gravedad
			If mousehingejoint <> -1.0 Then
				ep_hingejoint_destroy(world, mousehingejoint)
				mousehingejoint = -1.0
			EndIf
		endif
	
	' arrastramos un objeto con el raton
	vx = mouse_x - ep_body_get_x_center(world, mousebody)
	vy = mouse_y - ep_body_get_y_center(world, mousebody)
	if mousehingejoint <> -1.0 then
		d = Sqr(vx * vx + vy * vy)
		if d > 10 then
			vx *= 10 / d
			vy *= 10 / d
		endif
	endif
	
	ep_body_set_velocity_center(world, mousebody, vx, vy, 0)
	
	' actualizacion del mundo cada 4 ciclos
	' nota: no usar muchos mas ni menos, por que se obtienen resultads dispares e indeseados
	for i=0 To 2 ' 4 ciclos de actualizacion
		ep_world_update_contacts(world)
		ep_world_simulate_step(world)
	next
	
	' ------------------
	' actualizacion de los objetos en pantalla
	cls
	ScreenLock()


		' los bordes usados como colision estatica sobre el mundo 0
		for b=0 To num_staticboxes
			caja(CentroX + staticboxes(b).x, CentroY + staticboxes(b).y, staticboxes(b).w, staticboxes(b).h, staticboxes(b).r, RGB(0,255,0) )
		next
		
		' body0=world , el mundo principal 0, no se puede usar para dibujar, da error, es solo para crear
		' body1=mousebody , el cuerpo que se acopla a la posicion del raton y se mueve con el
		' body2=static world ' el propio mundo convertido en elemento de colision, para detectar los bordes
		' desde el body 3 son los cubos para diversion
		bola(ep_body_get_x(world, 1), ep_body_get_y(world, 1), 4, 90, RGB(255,255,255) )
		caja(ep_body_get_x(world, 2), ep_body_get_y(world, 2), 5, 5, ep_body_get_rot(world, 2), RGB(255,0,255) )
		for b=0 To num_balls-1 ' 0 a 219, 220 cajas, el primer "body" es el numero 3
			bola(ep_body_get_x(world, b+3), ep_body_get_y(world, b+3), 8, ep_body_get_rot(world, b+3), RGB(0,255,255) )
		next
	
	ScreenUnLock()
	
	ScreenCopy
	Sleep 1
	' --------------------

wend

' fin....
ep_body_destroy(world,body)
ep_world_destroy(world)
