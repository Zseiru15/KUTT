extends Control

func _ready():
	if Variables.juego == true:
		#boton
		$"../options".position.x = -250
		$"../options".position.y = -40
		$"../options".scale.y = 2
		$"../options".scale.x = 1.5

func _on_atras_pressed():
	$".".position.x = 1200
	$".".position.y = -161
	
	


func _on_atras_mouse_entered():
	$atras/Label.position.y += 2
	$botones.play()


func _on_atras_mouse_exited():
	$atras/Label.position.y -= 2
