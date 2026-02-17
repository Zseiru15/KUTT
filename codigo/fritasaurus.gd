extends CharacterBody2D


var izquierda = true
var limite_derecha= 257
var limite_izquierda = -266
var sprites
 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	sprites = randi_range(1,6)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	#llegada = position.move_toward(pionter.position,delta * Variables.speed)
	if sprites == 1:
		$AnimationPlayer.play("astanana1")
	if sprites == 2:
		$AnimationPlayer.play("astanana2")
	if sprites == 3:
		$AnimationPlayer.play("astanana3")
	if sprites == 4:
		$AnimationPlayer.play("astanana4")
	if sprites == 5:
		$AnimationPlayer.play("astanana5")
	if sprites == 6:
		$AnimationPlayer.play("astanana6")
	
	move_and_slide()

	if $".".position.x >= limite_derecha :
		$Sprite2D.flip_h = true
		$"../caminando".play() 
		izquierda = true
		if izquierda == true:
			velocity.x =  -1 * Variables.speed
			izquierda = false

	if $".".position.x<= limite_izquierda :
		$Sprite2D.flip_h = false
		izquierda = false
		if izquierda == false:
			velocity.x =  1 * Variables.speed
			izquierda = true

		
	
	
