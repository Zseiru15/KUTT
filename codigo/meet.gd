extends StaticBody2D

var randx = 0
var randy = 0
@export var marker = Label
@export var fase = PackedScene
@export var point = Marker2D

func _ready():
	Variables.marker = marker
	randomize()
	Variables.fase = 1
	#generar numero aleatorio entre 1 y tamaño maximo de casillas del mapa:
	randx = randi()%17
	randy = randi()%16
	#convertir numero de casillas en valor de pixeles
	position.y = (randy*32) 
	position.x = (randx*32) 
	
	
	
func pos():
	
	randomize()
	randx = randi()%17
	randy = randi()%16
	
	position.y = (randy*32) 
	position.x = (randx*32) 
	
	#print(" posicion y ",position.y, " posicion x ",position.x)


func _on_touched_area_entered(area):

	$"../recoger".play()
		
	Variables.cant += 1
	Variables.contador_interno += 1
	if Variables.contador_interno == 1:
		Variables.fase = 1
	if Variables.contador_interno == 2:
		Variables.fase = 2
	if Variables.contador_interno == 3:
		Variables.fase = 3
	if Variables.contador_interno == 4:
		Variables.fase = 4
	if Variables.contador_interno == 5:
		Variables.fase = 5
	if Variables.contador_interno == 6:
		Variables.fase = 6
	
	if Variables.cant == 1:
		
		if Variables.fase == 1:
			Variables.cant = 0
			$"../stage timer".start()
			Variables.change_scene = true
			marker.visible = true
			$fase.text = str(Variables.fase)
			$fase.set_position(Vector2(100,100))
			$"../fritasaurus".queue_free()
			$"../fritasaurus2".queue_free()
			$"../fritasaurus3".queue_free()
			$"../fritasaurus4".queue_free()
			$"../caminando".playing = false
			
		if Variables.fase == 2:
			$fase.set_position(Vector2(100,100))
			Variables.cant = 0
			$"../stage timer".start()
			Variables.change_scene = true
			marker.visible = true
			$fase.text = str(Variables.fase)
		
		if Variables.fase == 3:
			$fase.set_position(Vector2(100,100))
			$"../stage timer".start()
			Variables.change_scene = true
			Variables.cant = 0
			marker.visible = true
			$fase.text = str(Variables.fase)
		
		if Variables.fase == 4:
			$fase.set_position(Vector2(100,100))
			Variables.cant = 0
			$"../stage timer".start()
			Variables.change_scene = true
			marker.visible = true
			$fase.text = str(Variables.fase)
			
		if Variables.fase == 5:
			$fase.set_position(Vector2(100,100))
			Variables.cant = 0
			$"../stage timer".start()
			Variables.change_scene = true
			marker.visible = true
			$fase.text = str(Variables.fase)
			
		if Variables.fase == 6:
			Variables.cant = 0
			get_tree().change_scene_to_file("res://final_demo.tscn")
	pos()


func _on_stage_timer_timeout():
		if Variables.change_scene == true:
			
			if Variables.fase == 1:

				marker.visible = false
				Variables.change_scene = false
				var tronco = load("res://tronco.tscn")
				
				for i in range(1,4):
					var pos_y
					var evaludador = randi()%2
					if evaludador == 0:
						pos_y = 0
					else:
						pos_y = 514
					var cargados = tronco.instantiate()
					var pos = Vector2((randi()%17)*32 ,pos_y)
					cargados.set_position(pos)
					get_parent().add_child(cargados)
			
			if Variables.fase == 2:
				marker.visible = false
				Variables.change_scene = false
				var fresa = load("res://fresa.tscn")
				var carga = fresa.instantiate()
				var dot = Vector2((randi()%17)*32 ,(randi()%16)*32)
				carga.set_position(dot)
				get_parent().add_child(carga)
			
			if Variables.fase == 3:
				var scene = load("res://boss_movement.tscn")
				var instance = scene.instantiate()
				#var dot = Vector2((0) ,(randi()%16)*32)
				#instance.set_position(dot)
				get_parent().add_child(instance)
				marker.visible = false
				Variables.change_scene = false
				Variables.cambio_de_lugar = true
			
			if Variables.fase == 4:
				marker.visible = false
				Variables.change_scene = false
				Variables.boss_desplazamiento = true
				
			if Variables.fase == 5:
				marker.visible = false
				Variables.change_scene = false
				Variables.boss_desplazamiento = true
				
	
				
				
		
		
		
		
		
