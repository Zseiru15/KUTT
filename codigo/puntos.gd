extends StaticBody2D



var x = 0
var y = 0


func _ready():
	randomize()
	
	#generar numero aleatorio entre 1 y tamaño maximo de casillas del mapa:
	x = randi()%17
	y = randi()%16

	#convertir numero de casillas en valor de pixeles
	position.y = (y*32) 
	position.x = (x*32) 
	
	print(" posicion y ",position.y, " posicion x ",position.x)
	
func pos2():
	
	randomize()
	x = randi()%17
	y = randi()%16
	position.y = (y*32) 
	position.x = (x*32) 
	
	print(" posicion y ",position.y, " posicion x ",position.x)



func _on_touched_area_entered(_area):
	Variables.cant += 1
	pos2()




