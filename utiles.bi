' jepalza, Abril-2024
' ayudas para creacion y dibujado de elementos 2D



#Define blanco RGB(255,255,255)
#define negro  RGB(0,0,0)
#define cielo RGB(0,150,255)
#define rosa RGB(249,125,182)
#define naranja RGB (255,161,0)

#define rojo RGB(255,0,0)
#define verde RGB(0,255,0)
#define azul RGB(0,0,255)
'
#define rojo2 RGB(190,0,0)
#define verde2 RGB(0,190,0)
#define azul2 RGB(0,0,190)
'
#define rojo3 RGB(120,0,0)
#define verde3 RGB(0,120,0)
#define azul3 RGB(0,0,120)
'
#define amarillo RGB(255,255,0)
#define amarillo2 RGB(200,200,0)
#define amarillo3 RGB(120,120,0)
'
#define cian RGB(0,255,255)
#define cian2 RGB(0,170,170)
#define cian3 RGB(0,85,85)
'
#define morado RGB(255,0,255)
#define morado2 RGB(170,0,170)
#define morado3 RGB(85,0,85)
'
#define gris RGB(200,200,200)
#define gris2 RGB(120,120,120)
#define gris3 RGB(80,80,80)
'
#define marron RGB (211,176,131)
#define marron2 RGB (127,106,79)
#define marron3 RGB (76,63,47)
#define marron4 RGB(150,50,0)

'importante: TRUE DEBE ser 1, no vale -1 
#Undef TRUE
#Define TRUE 1
#Undef FALSE
#Define FALSE 0


Const PI As Double = 3.1415926535897932

' radianes a grados
Function radtodeg(ang As Double) As Double
	Return (ang * 180) / PI
End Function

' grados a radianes
Function degtorad(ang As Double) As Double
	Return ang * (PI / 180)
End Function

' aleatorio entre 0 y 360 (nota: ya no hace eso, ahora, solo aleatorio)
Function rand360(a As Double) As Double
	Return a*Rnd(1)
End Function

' redondea a 360 grados
Function round360(a As Double) As Double
	Return a-360*Int(a/360)
End Function

' obtiene la horizontal entre el centro de un circulo y el punto de interseccion de una recta con angulo
Function lengthdir_x(radius As Double, angle As Double) As Double
	Return radius * Cos(PI * 2 * angle / 360)
End Function

' obtiene la vertical entre el centro de un circulo y el punto de interseccion de una recta con angulo
Function lengthdir_y(radius As Double, angle As Double) As Double
	Return radius * Sin(PI * 2 * angle / 360)
End Function


' rutina de ordenacion rapida para organizar vectores (vertices) en poligonos, de menor a mayor
Sub ds_list_sort(ArrayToSort() As Double,NumEls As Integer)
  Dim Temp As Double
  Dim As Integer StartEl=0
  Dim As Integer First, Last, i, j, StackPtr
  ReDim As Integer QStack(NumEls \ 5 + 10)
    First = StartEl
    Last = StartEl + NumEls - 1
      Do
        Do
          Temp = ArrayToSort((Last + First) \ 2)
          i = First
          j = Last
            Do
              While ArrayToSort(i) < Temp
                i = i + 1
              Wend
              While ArrayToSort(j) > Temp
                j = j - 1
              Wend
              If i > j Then Exit Do
              If i < j Then Swap ArrayToSort(i), ArrayToSort(j)
              i = i + 1
              j = j - 1
            Loop While i <= j
          If i < Last Then
            QStack(StackPtr) = i
            QStack(StackPtr + 1) = Last
            StackPtr = StackPtr + 2
          End If
          Last = j
        Loop While First < Last
        If StackPtr = 0 Then Exit Do
        StackPtr = StackPtr - 2
        First = QStack(StackPtr)
        Last = QStack(StackPtr + 1)
      Loop
 Erase QStack
End Sub



Type poligonos
	x As Double
	y As Double
	v As Integer
	xv(19) As Double ' maximo 20 vertices, facil de ampliar, cambiando aqui
	yv(19) As Double
	c As Integer ' color RGB
End Type
Sub poli(x As Double, y As Double,body As Double, pol() As poligonos, angle As Double)
	Dim As Integer v,tmp,c
	Dim As Double x1,y1,x2,y2,tt,centx,centy
	angle*=-1
	centx=x
	centy=y
	tmp=pol(body).v
	c=pol(body).c
	For v=0 To tmp
		x1=pol(body).xv(v)
		y1=pol(body).yv(v)
		tt=x1*Cos(angle) - y1*Sin(angle)
		y1=x1*Sin(angle) + y1*Cos(angle)
		x1=tt
		If v=tmp Then 
			x2=pol(body).xv(0)
			y2=pol(body).yv(0)
		Else
			x2=pol(body).xv(v+1)
			y2=pol(body).yv(v+1)
		EndIf
		tt=x2*Cos(angle) - y2*Sin(angle)
		y2=x2*Sin(angle) + y2*Cos(angle)
		x2=tt
		Line(x+x1,y+y1)-(x+x2,y+y2),c
	Next
End Sub
Sub EP_poli(world As Double, body As Double, pol As poligonos, tipo As Byte, c As Double)
	Dim As Integer v,tmpv
	Dim As Double x,y,x1,y1,x2,y2,tt,centx,centy,rot
	rot=-ep_body_get_rot(world, body)'+(PI/4)
	x= ep_body_get_x(world,body)
	y= ep_body_get_y(world,body)
	centx= ep_body_get_x_center(world,body)
	centy= ep_body_get_y_center(world,body)
	tmpv=pol.v-0
	For v=0 To tmpv
		x1=pol.xv(v)
		y1=pol.yv(v)
		tt=x1*Cos(rot) - y1*Sin(rot)
		y1=x1*Sin(rot) + y1*Cos(rot)
		x1=tt
		If v=tmpv Then 
			x2=pol.xv(0)
			y2=pol.yv(0)
		Else
			x2=pol.xv(v+1)
			y2=pol.yv(v+1)
		EndIf
		tt=x2*Cos(rot) - y2*Sin(rot)
		y2=x2*Sin(rot) + y2*Cos(rot)
		x2=tt
		Line(x+x1,y+y1)-(x+x2,y+y2),c
	Next
	If tipo=0 OrElse tipo>3 Then Exit Sub ' sin indicadores, sale
	If tipo=1 Then  ' estatico, no se muevo, solo colisiones, lleva un aspa cruzado
		Line(centx-4,centy-4)-Step(8,8),c,b
		Line(centx-4,centy-4)-Step(8,8),c
		Line(centx-4,centy+4)-Step(8,-8),c
	EndIf
	If tipo=2 Then  ' dinamico moviendose aun, un solo cuadrado
		Line(centx-3,centy-3)-Step(6,6),c,b
		'Print ep_body_is_sleeping(world,body)
		If ep_body_is_sleeping(world,body) Then
			tipo=3 ' se ha detenido el movimiento
		EndIf
	EndIf
	If tipo=3 Then  ' dinamico cuando ya no se mueve, son dos cuadrados
		Line(centx-3,centy-3)-Step(6,6),c,b
		Line(centx-5,centy-5)-Step(10,10),c,b
	EndIf
End Sub


' dibuja cajas con giro
Sub caja(x As Double, y As Double, w As Double, h As Double, angle As Double, c As Integer)
	Dim As Double centx,centy
	Dim As Double x1,y1
	Dim As Double x2,y2
	Dim As Double x3,y3
	Dim As Double x4,y4
	Dim As Double tt
	
	w-=1 ' ajuste de ancho/alto
	h-=1
	angle*=-1
	centx=x
	centy=y	
	x=x-(w/2)
	y=y-(h/2)

	x1=x
	y1=y
	
	x2=(x+w)
	y2=y
	
	x3=x
	y3=(y+h)
	
	x4=(x+w)
	y4=(y+h)

	tt=(((x1-centx)*Cos(angle) - (y1-centy)*Sin(angle)) + centx)
	y1=(((x1-centx)*Sin(angle) + (y1-centy)*Cos(angle)) + centy)
	x1=tt
	tt=(((x2-centx)*Cos(angle) - (y2-centy)*Sin(angle)) + centx)
	y2=(((x2-centx)*Sin(angle) + (y2-centy)*Cos(angle)) + centy)
	x2=tt
	tt=(((x3-centx)*Cos(angle) - (y3-centy)*Sin(angle)) + centx)
	y3=(((x3-centx)*Sin(angle) + (y3-centy)*Cos(angle)) + centy)
	x3=tt	
	tt=(((x4-centx)*Cos(angle) - (y4-centy)*Sin(angle)) + centx)
	y4=(((x4-centx)*Sin(angle) + (y4-centy)*Cos(angle)) + centy)
	x4=tt

	Line(x1,y1)-(x2,y2),c
	Line(x1,y1)-(x3,y3),c
	Line(x2,y2)-(x4,y4),c
	Line(x3,y3)-(x4,y4),c
End Sub

' dibuja cajas con giro usando valores extremephysics
Sub EP_caja(world As Double, body As Double, w As Double, h As Double, tipo As Double, c As Integer)
	Dim As Double centx,centy
	Dim As Double x1,y1
	Dim As Double x2,y2
	Dim As Double x3,y3
	Dim As Double x4,y4
	Dim As Double tt

	Dim As Double x = ep_body_get_x(world,body)
	Dim As Double y = ep_body_get_y(world,body)

	Dim As Double angle = ep_body_get_rot(world, body) ' por defecto, 0=las 3 y cuarto
	
	w-=1 ' ajuste de ancho/alto
	h-=1
	angle*=-1
	centx=x
	centy=y	
	x=x-(w/2)
	y=y-(h/2)

	x1=x
	y1=y
	
	x2=(x+w)
	y2=y
	
	x3=x
	y3=(y+h)
	
	x4=(x+w)
	y4=(y+h)

	tt=(((x1-centx)*Cos(angle) - (y1-centy)*Sin(angle)) + centx)
	y1=(((x1-centx)*Sin(angle) + (y1-centy)*Cos(angle)) + centy)
	x1=tt
	tt=(((x2-centx)*Cos(angle) - (y2-centy)*Sin(angle)) + centx)
	y2=(((x2-centx)*Sin(angle) + (y2-centy)*Cos(angle)) + centy)
	x2=tt
	tt=(((x3-centx)*Cos(angle) - (y3-centy)*Sin(angle)) + centx)
	y3=(((x3-centx)*Sin(angle) + (y3-centy)*Cos(angle)) + centy)
	x3=tt	
	tt=(((x4-centx)*Cos(angle) - (y4-centy)*Sin(angle)) + centx)
	y4=(((x4-centx)*Sin(angle) + (y4-centy)*Cos(angle)) + centy)
	x4=tt

	Line(x1,y1)-(x2,y2),c
	Line(x1,y1)-(x3,y3),c
	Line(x2,y2)-(x4,y4),c
	Line(x3,y3)-(x4,y4),c

	If tipo=0 OrElse tipo>3 Then Exit Sub ' sin indicadores, sale
	If tipo=1 Then  ' estatico, no se muevo, solo colisiones, lleva un aspa cruzado
		Line(centx-4,centy-4)-Step(8,8),c,b
		Line(centx-4,centy-4)-Step(8,8),c
		Line(centx-4,centy+4)-Step(8,-8),c
	EndIf
	If tipo=2 Then  ' dinamico moviendose aun, un solo cuadrado
		Line(centx-3,centy-3)-Step(6,6),c,b
		'Print ep_body_is_sleeping(world,body)
		If ep_body_is_sleeping(world,body) Then
			tipo=3 ' se ha detenido el movimiento
		EndIf
	EndIf
	If tipo=3 Then  ' dinamico cuando ya no se mueve, son dos cuadrados
		Line(centx-3,centy-3)-Step(6,6),c,b
		Line(centx-5,centy-5)-Step(10,10),c,b
	EndIf
End Sub




' dibuja un circulo (bola o pelota) con un vector interior que indica su giro
Sub bola(x As Double, y As Double, radio As Double, rotradianes As Double, c As Integer)
	Circle (x,y),radio,c
	Line (x,y)-Step(radio*Sin((PI/2)+rotradianes),radio*cos((PI/2)+rotradianes)),c
End Sub
' lo mismo que BOLA pero usando comandos EP para recuperar posicion, giro y parametros
Sub EP_bola(world As Double, body As Double,tipo As Byte, radio As Double, c As Integer)
	Dim As Double x = ep_body_get_x(world,body)
	Dim As Double y = ep_body_get_y(world,body)

	Dim As Double rot = (PI/2)+ep_body_get_rot(world, body) ' por defecto, 0=las 3 y cuarto
	Circle (x,y),radio,c 'c=color
	If tipo=0 OrElse tipo>3 Then Exit Sub ' sin indicadores, sale
	If tipo=1 Then  ' estatico, no se muevo, solo colisiones, lleva un aspa cruzado
		Line(x-4,y-4)-Step(8,8),c,b
		Line(x-4,y-4)-Step(8,8),c
		Line(x-4,y+4)-Step(8,-8),c
	EndIf
	If tipo=2 Then  ' dinamico moviendose aun, un solo cuadrado
		Line(x-3,y-3)-Step(6,6),c,b
		'Print ep_body_is_sleeping(world,body)
		If ep_body_is_sleeping(world,body) Then
			tipo=3 ' se ha detenido el movimiento
		EndIf
	EndIf
	If tipo=3 Then  ' dinamico cuando ya no se mueve, son dos cuadrados
		Line(x-3,y-3)-Step(6,6),c,b
		Line(x-5,y-5)-Step(10,10),c,b
	EndIf
	Line (x,y)-Step(radio*Sin(rot),radio*Cos(rot)),c
End Sub

