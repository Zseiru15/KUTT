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

var encontrado = false

func _ready():
	$AnimationPlayer.play("caminando")
	Variables.slow = false
	
	
func movimiento(delta):
	if eeleccion == true:
		
		electorx = randi()%2
		electory = randi()%2 
		
		if electorx==0:
			direccionx = positivo
		else:
			direccionx = negativo
		
		if electory==0:
			direcciony = positivo
		else:
			direcciony = negativo
		velocity.y = fresa_speed * direcciony
		velocity.x = fresa_speed * direccionx
		if stop == true:
			velocity.x = 0
			velocity.y = 0
		$Timer.start()
		eeleccion = false

func _physics_process(delta):
	if encontrado == false:
		$RayCast2D.global_rotation = $RayCast2D.global_rotation+90

		
	if $RayCast2D.is_colliding():
		encontrado = true
		if encontrado == true:
			$RayCast2D.global_rotation = $RayCast2D.global_rotation*0
		get_node("Area2D/CollisionShape2D").disabled = false
	if Variables.fase == 3:
		queue_free()
	if position.x == 0 or  position.x == 544:
		eeleccion == true
	if position.y == 0 or  position.y == 514:
		eeleccion == true
	position.x = clamp(position.x, 0, 544)
	position.y = clamp(position.y, 0, 514)
	movimiento(delta)
	move_and_slide()


func _on_area_2d_area_entered(area):
	
	$AnimationPlayer.play("splatered")
	Variables.slown = true
	Variables.slow = true
	eeleccion = false
	stop = true
	



func _on_area_2d_area_exited(area):
	get_node("Area2D/CollisionShape2D").disabled = true
	$AnimationPlayer.play("caminando")
	Variables.slow = false
	Variables.slown = false
	await get_tree().create_timer(60)
	eeleccion = true
	stop = false
	
	encontrado = false


func _on_timer_timeout():
	eeleccion = true
