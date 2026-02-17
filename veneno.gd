
extends CharacterBody2D

var daño_veneno = false

var veneno = true

func _ready():
	await get_tree().create_timer(2).timeout
	Variables.generacion = true

func _physics_process(delta):
	if Variables.evenedado == false:
		get_node("Area2D/CollisionShape2D2").disabled = true
		$".".visible = false
	if Variables.fase == 4 :
		queue_free()
	if Variables.destruccion==true:
		queue_free()
	if veneno == true:
		
		position.x = randi()%17*32
		position.y = randi()%16*32
		veneno = false
		
	if Variables.reaparicion == true:
		
		veneno = true
		await get_tree().create_timer(0.005).timeout
		Variables.reaparicion = false
	if daño_veneno == true:
		$AnimationPlayer.play("daño")
		$espera.start()


func _on_espera_timeout():
	$AnimationPlayer.play("normal")


func _on_area_2d_body_entered(body):
	if Variables.evenedado == true:
		visible = true
		get_node("Area2D/CollisionShape2D2").disabled = false
		daño_veneno = true
	
		

func _on_area_2d_body_exited(body):
	daño_veneno = false
