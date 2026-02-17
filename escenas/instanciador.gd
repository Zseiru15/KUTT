extends Node
@export var escupitajo = false
@export var charcos_de_veneno : PackedScene
var instance 

func _process(delta):
	await get_tree().create_timer(2).timeout
	if escupitajo == true:
		$"../AnimationPlayer".play("venom")
		escupitajo = false
	if Variables.generacion == true:
		for i in range(1,10):
			instance = charcos_de_veneno.instantiate()
			get_parent().add_child(instance)
		Variables.generacion = false
	
