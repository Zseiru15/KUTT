extends CharacterBody2D


var izquierda = true
var derecha = true
var arriba = true
var abajo = true

var limite_derecha= 544
var limite_abajo= 514
var limite_izquierda = 0

@onready var posicion_inicial_x = self.get_position()
@export var original = false
@export var ciclos_maximos := 4
var ciclos_actuales := 0
var velocidad 
var x = 0
var i = 0

var randx
var randy
var Posicion
var diferente 
var temp_oral

var scene = load("res://instanciador.tscn")
var instance = scene.instantiate()

var llegada

var atack = false

var Fase_deslizamiento = 1
var No_repeticion_Cambio_Lugar = 1

var posicion_inicial
var boss_detenido := false
func _ready():
	temp_oral = 0
	Fase_deslizamiento = 1
	$"cabeza ataque".visible = false
	if Variables.ataque == false:
		$AnimationPlayer.play("chomp")
	
func aparicion():
	if Variables.fase == 4:
		Variables.ataque = true
		
		if Fase_deslizamiento ==1:
			Posicion = randi()%4
			Fase_deslizamiento = 2

	if Variables.cambio_de_lugar == true:
		#Random de Posicion en base a los constraints del mapa
		position.x = randi()%17*32
		position.y = randi()%16*32
		if Variables.ataque == false:
			$"cabeza ataque".visible = false
			$"venom sprite".visible = true
			$AnimationPlayer.play("chomp")
			$"../base ataque" .visible= false
		if Variables.ataque == true or Variables.fase == 4:
			$"../base ataque" .visible= true
			$"venom sprite".visible = false

			atack = true
			$AnimationPlayer.stop()
			


		$"daño_por_segundo".start()
		Variables.cambio_de_lugar = false

func movimiento( delta ):

	#Posicion = 3
	match Posicion:
		0:
			#izqierda
			if No_repeticion_Cambio_Lugar ==1:
				randy = randi()%16*32
				llegada = 1
				posicion_inicial = 0
			$"../LLegada_Boss".position.x = 559
			$"../LLegada_Boss".position.y = 291.0
			$"../LLegada_Boss".rotation = 0.0
			position.x = 0
			position.y = randy
			#funcion velocidad
			if llegada == 1:
				velocity.x += 500
			No_repeticion_Cambio_Lugar = 2
			#Funcion de regreso
			if llegada==2:
				velocity.x -= 500
			
			#Eleccion de nueva posicion
			
		2:
			#derecha
			if No_repeticion_Cambio_Lugar ==1:
				randy = randi()%16*32
				llegada = 1
				posicion_inicial = 545
			# Hitbox limite de movimiento boss
			$"../LLegada_Boss".position.x = -167.0
			$"../LLegada_Boss".position.y = 291.0
			$"../LLegada_Boss".rotation = 0.0
			position.x = 545
			position.y = randy
			#funcion velocidad
			if llegada == 1:
				velocity.x -= 500
			No_repeticion_Cambio_Lugar = 2
			#Funcion de regreso
			if llegada==2:
				velocity.x += 500
			
	#arriba
	if Posicion ==  1 :
		if No_repeticion_Cambio_Lugar ==1:
			randx = randi()%17*32
			llegada = 1
			posicion_inicial = -1
		# Hitbox limite de movimiento boss
		$"../LLegada_Boss".position.x = 585.0
		$"../LLegada_Boss".position.y = 528.0
		$"../LLegada_Boss".global_rotation_degrees = 90
		position.x = randx
		position.y = -1
		
		#funcion velocidad
		if llegada == 1:
			velocity.y += 500
		No_repeticion_Cambio_Lugar = 2
		#Funcion de regreso
		if llegada==2:
			velocity.y -= 500
		
	#abajo
	if Posicion ==  3 :
		if No_repeticion_Cambio_Lugar ==1:
			randx = randi()%17*32
			llegada = 1
			posicion_inicial = 514
		# Hitbox limite de movimiento boss
		$"../LLegada_Boss".position.x = 585.0
		$"../LLegada_Boss".position.y = -165.0
		$"../LLegada_Boss".global_rotation_degrees = 90
	
		position.x = randx
		position.y = 514
		
		#funcion velocidad
		if llegada == 1:
			velocity.y -= 500
		No_repeticion_Cambio_Lugar = 2
			#Funcion de regreso
		if llegada==2:
			velocity.y += 500
		
func _physics_process(delta):
	
	if boss_detenido:
		return

	aparicion()
	movimiento(delta)
	move_and_slide()
	#izquierda
	if Posicion == 0 && llegada == 2:
		if velocity.x < 0 and global_position.x <= posicion_inicial:
			detener_boss()
			
			Posicion = randi()%4
	#derecha
	if Posicion == 2 && llegada == 2:
		if velocity.x > 0 and global_position.x >= posicion_inicial:
			detener_boss()
			
			Posicion = randi()%4
	#arriba
	if Posicion == 1 && llegada == 2:
		if velocity.y < 0 and global_position.y <= posicion_inicial:
			detener_boss()
			
			Posicion = randi()%4
	#abajo
	if Posicion == 3 && llegada == 2:
		if velocity.y > 0 and global_position.y >= posicion_inicial:
			detener_boss()
			
			Posicion = randi()%4
func _on_daño_por_segundo_timeout():
	
	Variables.cambio_de_lugar = true
	Variables.evenedado = false
	await get_tree().create_timer(0.5).timeout
	Variables.evenedado = true
	Variables.reaparicion = true
	

func _on_l_legada_boss_area_entered(area: Area2D):
	#izquierda
	if Posicion == 0 && position.x>=1:
		llegada = 2
	#derecha
	if Posicion == 2 && position.x<=546:
		llegada = 2
	#arriba
	if Posicion == 1 && position.y>=1:
		llegada = 2
	#abajo
	if Posicion == 3 && position.y<=546:
		llegada = 2
	
func detener_boss():
	if boss_detenido:
		return

	boss_detenido = true
	velocity = Vector2.ZERO

	set_physics_process(false)
	set_process(false)

	$AnimationPlayer.stop()
	$"daño_por_segundo".stop()

	ciclos_actuales += 1

	if ciclos_actuales < ciclos_maximos:
		reanudar_boss()

func reanudar_boss():
	await get_tree().create_timer(1.0).timeout 

	position.x = randi() % 17 * 32
	position.y = randi() % 16 * 32

	llegada = 0
	No_repeticion_Cambio_Lugar = 1
	boss_detenido = false

	Posicion = randi() % 4

	set_physics_process(true)
	set_process(true)

	$AnimationPlayer.play("chomp")
	$"daño_por_segundo".start()

		
