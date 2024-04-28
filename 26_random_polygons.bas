

'#include "fbgfx.bi"
#Include "ExtremePhysics.bi"

#Include "utiles.bi"


Dim As Integer room_width=900
Dim As Integer room_height=700
ScreenRes room_width,room_height,32,2

Randomize timer

Dim As Double world,body,shape,i,j,k,n,x,y,r,w,list,dirs,dist,poly

Dim as Double CentroX = room_width/2
Dim as Double CentroY = room_height/2

Dim as integer numelems=0

' body 0, principal
world = ep_world_create()
ep_world_set_settings(world, 1/4, 20, 10, 0.1, 0.5, 0.04, 0.5, 1)
ep_world_set_sleeping(world,TRUE,60,0,0.002,0.0001)

' body 1, para colisiones
body = ep_body_create_static(world)
ep_body_set_position(world,body,CentroX,CentroY,degtorad(0))
ep_body_set_velocity_center(world,body,0,0,degtorad(0.5))

n = 24
r = 300
w = 2*tan(degtorad(360/n/2))*r
For i=0 To n-1
   shape = ep_shape_create_box(world,body,40,w+40,lengthdir_x(r,360*i/n),lengthdir_y(r,360*i/n),-degtorad(360*i/n),1)
   ep_shape_set_collision(world,body,shape,1,1,0)
   ep_shape_set_material (world,body,shape,0.2,0.5,0,0)
   'box ( CentroX+lengthdir_x(r,360*i/n),CentroY+lengthdir_y(r,360*i/n), 40,w+40, degtorad(360*i/n) ,RGB(255,0,0) )
    
   shape = ep_shape_create_box(world,body,40,40,lengthdir_x(r,360*i/n),lengthdir_y(r,360*i/n),-degtorad(360*i/n+45),1)
   ep_shape_set_collision(world,body,shape,1,1,0)
   ep_shape_set_material (world,body,shape,0.2,0.5,0,0)
   'box ( CentroX+lengthdir_x(r,360*i/n),CentroY+lengthdir_y(r,360*i/n), 40,40, degtorad(360*i/n+45) ,RGB(255,255,0) )
Next

Dim As poligonos pol(200)
Dim As Integer maxvert=20
Dim As Double lista(maxvert) ' maximos vertices 20
Dim As Integer a
For i=3 To 14
	a=15
   While a
        ' lista a cero
        list=0
        for j=0 To i-1
            Do
                w = TRUE
                dirs = rand360(360)
                For k=0 To j-1
                    If (abs(round360(lista(k)-dirs))<5) Then ' localiza valores guardados
                        w = FALSE
                        Exit For
                    End If
                Next
            Loop until w
            lista(list)=dirs:list+=1 ' guardo en la lista
        Next
        ds_list_sort(lista(),list)
        poly = ep_polygon_create(world,i)
        ' guardo el numero de vertices
        pol(numelems).v=i-1
        For j=0 To i-1
            dirs = lista(j) ' cojo la direccion (angulo) del vertice
            dist = 13
            ' guardo los vertices
            pol(numelems).xv(j)=lengthdir_x(dist,dirs)
            pol(numelems).yv(j)=lengthdir_y(dist,dirs)
            ep_polygon_set_vertex(world,poly,j,pol(numelems).xv(j),pol(numelems).yv(j))
        Next
        ep_polygon_initialize(world,poly)
        For list=0 To maxvert:lista(list)=0:Next 'borro la lista para el siguiente poligono
        body  = ep_body_create_dynamic(world,FALSE)
        shape = ep_shape_create_polygon(world,body,poly,0,0,0,1)
        ep_shape_set_collision(world,body,shape,1,1,0)
        ep_shape_set_material (world,body,shape,0.2,0.5,0,0)
        ep_body_calculate_mass(world,body)
        x=CentroX+rand360(400)-200
        y=CentroY+rand360(400)-200
        r=degtorad(rand360(360))
        ep_body_set_position(world,body,x,y,r)
        ep_body_set_gravity (world,body,0,0.2)
        ' guardo la posicion del poligono
        pol(numelems).x=x
        pol(numelems).y=y
        pol(numelems).c=RGB(rand360(255),rand360(255),rand360(255))
        'ball(x,y,dist,r,RGB(0,255,0))
        a-=1
        numelems+=1
   Wend
Next

While InKey=""

	a=0
	While a<4
	   ep_world_update_contacts(world)
	   ep_world_simulate_step(world)
		a+=1
	Wend

	cls
	ScreenLock
		
		n = 24
		r = 300
		w = 2*tan(degtorad(360/n/2))*r 
		x = -ep_body_get_rot(world, 1)*3.8
		For i=x To x+(n-1)
		   caja ( CentroX+lengthdir_x(r,360*i/n),CentroY+lengthdir_y(r,360*i/n), 40,w+40, -degtorad(360*i/n   ) ,RGB(255,0,0) )
		   caja ( CentroX+lengthdir_x(r,360*i/n),CentroY+lengthdir_y(r,360*i/n), 40,  40, -degtorad(360*i/n+45) ,RGB(255,255,0) )
		Next
	
	
		For body=2 To numelems-1
			x = ep_body_get_x(world,body)
			y = ep_body_get_y(world,body)
			r = ep_body_get_rot(world,body)
			'EP_poli(world,body,pol(body),1,RGB(255,255,255) )
			poli( x,y,body,pol(),r )
		Next

        
	ScreenUnLock

	Sleep 1
	ScreenCopy
	

Wend

ep_body_destroy(world,body)
ep_world_destroy(world)
