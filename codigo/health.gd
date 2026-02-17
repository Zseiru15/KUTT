extends Control


@export var P_node: NodePath
@onready var Player = get_node(P_node)

func _process(_delta):
	
	$HealthBar.value = Player.health
	$puntaje.text = str(Variables.cant)
