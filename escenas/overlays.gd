extends Node



func _on_options_pressed():
	if Variables.juego == false:
		$options2.position.x = -260
		$options2.position.y = -165
		$options2.scale.x = 0.463
		$options2.scale.y = 0.463
	
		
	if Variables.juego == true:
		#menu
		$options2.position.x = -290
		$options2.position.y = -60
		$options2.scale.x = 0.463
		$options2.scale.y = 0.463

		
