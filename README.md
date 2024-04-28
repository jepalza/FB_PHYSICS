# FB_PHYSICS
FreeBasic Fisicas en tiempo real para juegos 2D

Motor de físicas 2D en tiempo real, útil para juegos tipo "Pinball" o plataformas.

Emplea la DLL "ExtremePhysics.dll" de un motor de físicas para el programa de juegos 2D llamado "GameMaker" en versión 8 de 2014. (ya obsoleto)

Descargar de su web el fichero "extremephysics-2-2.zip" para obtener la DLL (el resto de ficheros no son necesarios). Dado que el motor fue concebido originalmente para "GameMaker V8", tiene una serie de comandos que solo funcionan en GM, y no tienen utilidad en FB, como son los de DEBUG y los de GM, empleados para mostrar los elementos dibujados en la pantalla del GM (GameMaker). Por ello, he creado una serie de rutinas auxiliares en FB para hacer la misma función que las empleadas en GM, al menos en teoría. Solo hay una que aún falla, y es la de crear polígonos, que no los hace adecuadamente, y algunos se sobreponen a otros. Se pueden controlar lo elementos creados, mediante el ratón, pero por ahora, solo está implementado en uno de los ejemplos.

Descargar el fichero "extremephysics-2-2.zip" de la web del autor original:

https://www.maartenbaert.be/extremephysics/

(hay ayudas desrcargables en su web)

Cosas a reparar:
 -creación/control de polígonos
 -mejor control de elementos con el ratón

 ![Imagen fb_extremephysics.png](https://github.com/jepalza/FB_PHYSICS/blob/main/pantallazo/fb_extremephysics.png)
