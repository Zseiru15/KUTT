extends CharacterBody2D

const fresa_speed = 150
const negativo = -1
const positivo = 1
var direccionx
var direcciony
var electorx
var electory
var eeleccion = true
var stop = false
var invertido = false
var girando = 1


func _ready():
	$AnimationPlayer.play("vertical")

func movimiento2(delta):
	if eeleccion == true:
		if position.y == 514:
			$RayCast2D.rotation_degrees = 180
			
			invertido = true
		electorx = randi()%2
		if electorx==0:
			direccionx = positivo
		else:
			direccionx = negativo
		
		velocity.x = fresa_speed * direccionx
		
		if stop == true:
			velocity.x = 0
			velocity.y = 0
		
		eeleccion = false

func _physics_process(delta):
	if Variables.fase == 3:
		queue_free()
	


	if position.x >= 544:
		velocity.x -= fresa_speed
		
	if position.x <= 0:
		velocity.x += fresa_speed
		
	if $RayCast2D.is_colliding():
		velocity.x = 0
		
		
		if girando == 1:
			$AnimationPlayer.play("horizontal")
			girando = 0
		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("girar")
			
		if invertido == false:
			velocity.y = fresa_speed
		else:
			velocity.y = -fresa_speed
		
	if position.y >= 516 or position.y <= -2:
		queue_free()
		var tronco = load("res://tronco.tscn")
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
	

	movimiento2(delta)

	move_and_slide()
