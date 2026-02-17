class_name knockback
extends State

@export var actor : kutt


signal movimiento

func _ready():
	set_physics_process(false)

func _enter_state() -> void:
	set_physics_process(true)
	
func _exit_state()->void:
	set_physics_process(false)
	


func _physics_process(delta):
	pass
	
	

	
