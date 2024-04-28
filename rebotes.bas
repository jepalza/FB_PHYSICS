
#Include "ExtremePhysics.bi"
#Include "utiles.bi"

Dim As Double rot
Dim As Double x=0
Dim As Double y=800
Dim As Double xold,yold

' medidas de pantalla
Dim As Integer room_width=900
Dim As Integer room_height=700
ScreenRes room_width,room_height,32,3 ' necesarias 3 pantallas para evitar el parpadeo

Randomize Timer

Print:Print:print

' ------------------- creacion ------------------
Dim as integer i,signo

Dim as Double world = ep_world_create()
ep_world_set_settings(world, 1/4, 20, 10, 0.1, 0.5, 0, 0.5, 1)

'ep_gm_functions_init()
'ep_gm_functions_init_address(scrptr)


Dim as Double groundbody = ep_body_create_static(world)

Dim As Double obj_marker = 50
ep_body_boxchain_begin(world, groundbody, obj_marker)


i = 0
'with obj_marker 
ScreenSet 2
PSet (x,y),RGB(255,0,0)
While i<obj_marker
    ep_body_boxchain_set_vertex(world, groundbody, i, x, y)
    i+=1
    x+=20
    signo=IIf(Rnd(1)>0.5,-10,50)
    y-=Int(Rnd(1)*signo)
    Line -(x,y),RGB(255,0,0)
Wend 
   
x=800:y=30   
   
ep_body_boxchain_end(world, groundbody, FALSE , FALSE , 0, 40, 0)
'Print ep_body_boxchain_get_first(world, groundbody)
'Print ep_body_boxchain_get_last(world, groundbody)

For i = ep_body_boxchain_get_first(world, groundbody) To ep_body_boxchain_get_last(world, groundbody)
   ep_shape_set_collision(world, groundbody, i, 1, 1, 0)
   ep_shape_set_material (world, groundbody, i, 0.2, 0.8, 0, 0)
next



' -------------------- creacion de pelota --------------------
Dim as Double body  = ep_body_create_dynamic(world, TRUE )
Dim as Double shape = ep_shape_create_circle(world, body, 20, 0, 0, 0, 1)

ep_shape_set_collision(world, body, shape, 1, 1, 0)
ep_shape_set_material(world, body, shape, 2.2, 0.4, 0, 0)
ep_body_calculate_mass(world, body)
ep_body_set_gravity(world, body, -0.01, 0.5)' gravedad horiz. y vert.
ep_body_set_damping(world, body, 0, 0.03)
ep_body_set_position(world, body, x, y, 0)



' --------------------- mover pelota -------------------------
ep_body_apply_impulse_relative(world, body, 0, 0, 0, 0, 10*degtorad(1), TRUE , TRUE )
	 
ScreenSet 1
a1:
ScreenCopy 2,1
' opcional: acelera el rebote segun el angulo
ep_body_set_velocity_center(world, body, _
       ep_body_get_xvel_center(world, body), _
       ep_body_get_yvel_center(world, body), _
       2*degtorad(10)) ' velocidad de rotacion del elemento. lo convierte en "rueda" y puede subir pendientes
       
	 
' -----------------------   actualizar pelota ----------------------
x = ep_body_get_x(world, body)
y = ep_body_get_y(world, body)
rot = ep_body_get_rot(world, body)


' ---------------- paso -----------------

Dim as Integer a=0
While a<4
    ep_world_update_contacts(world)
    ep_world_simulate_step(world)
	 a+=1
wend

' ---------------- dibujar ------------------

Circle (x,y),19
Line (x,y)-Step(19*Sin(degtorad(rot)),19*cos(degtorad(rot)))


Sleep 30
'Locate 12,1
'Print rot,ep_body_get_xvel_center(world, body)
'Locate 1,1:Print x,y
If InKey=Chr(27) Then GoTo fin

ScreenCopy 1,0
GoTo a1

fin:

ep_set_log_file(TRUE ,"ep_log.txt",1)
ep_print_object_tree()
ep_set_log_file(FALSE ,"",0)

ep_world_destroy(world)
