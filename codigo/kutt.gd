class_name kutt
extends CharacterBody2D


var limit
var health : float = 100
var rises : float = 0.075

@export var speed  = float(300)
@onready var time = get_node("Timer")

 

func _ready():
	limit = get_viewport_rect().size
	time.set_wait_time(rises)
	time.start()
	


func _on_timer_timeout():
	if Variables.change_scene == false:
		health -= 1
		if health < 0:
			health = 0
			Variables.cant = 0
			get_tree().change_scene_to_file("res://escenas/lose.tscn")
	else:
		health = 100




func _on_hit_area_entered(_area):
		if health <= 100:
			if health > 70:
				health = 100
			else:
				health += 30

	
