extends Node2D

func _on_button_pressed():
	get_tree().change_scene_to_file("res://escenas/menu_principal.tscn")
	Variables.juego = false
	Variables.cant = 0
