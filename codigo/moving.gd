extends State
class_name moving
@export var speed  = float(400)
@export var personaje : CharacterBody2D
var direction



func get_input():
	var input_direction = Input.get_vector("left", "rigth", "up", "down")
	personaje.velocity = input_direction * speed
	personaje.position.x = clamp(personaje.position.x, -259, 256)
	personaje.position.y = clamp(personaje.position.y, -266, 211) 
	if Input.is_action_just_pressed("up"):
		Variables.x=1
	if Input.is_action_just_pressed("down"):
		Variables.x=2
	if Input.is_action_just_pressed("left"):
		Variables.x=3
	if Input.is_action_just_pressed("left"):
		Variables.x=4
	

func Enter():
	get_input()
	


func Physics_update(_delta: float):
	direction = Vector2(personaje.position.x,personaje.position.y ) 
	

	if personaje:
		get_input()
		personaje.move_and_slide()





func _on_hurtbox_area_entered(area):
	Variables.direction = Vector2((personaje.position.x + 5),personaje.position.y) 
	personaje.velocity = Variables.direction * float(5)
	transitioned.emit(self,knocback)
