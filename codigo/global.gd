extends Node

var out : float = 1
@onready var time = get_node("Timer")
@onready var tiempo = get_node("Timer2")

func _ready():
	time.set_wait_time(out)
	time.start()

func _on_Timer_timeout():
	get_tree().change_scene_to_file("res://menu_principal.tscn")
