extends Control
var scene = load("res://escenas/options.tscn")
var instance = scene.instantiate()
var ulr = "https://imaginationbear.itch.io/"
func _on_exit_pressed():
	get_tree().quit()


func _ready():
	$osito/AnimationPlayer.play("derecha")

func _on_play_pressed():
	get_tree().change_scene_to_file("res://escenas/nivel_1.tscn")
	Variables.juego = true
	Variables.fase = 0
	Variables.contador_interno = 0
	Variables.boss_desplazamiento = false



func _on_options_mouse_entered():
	$options/Label.position.y += 2
	$botones.play()

func _on_options_mouse_exited():
	$options/Label.position.y -= 2
	

func _on_exit_mouse_entered():
	$exit/Label.position.y += 2
	$botones.play()


func _on_exit_mouse_exited():
	$exit/Label.position.y -= 2
	
func _on_play_mouse_entered():
	$play/Label.position.y += 2
	$botones.play()

func _on_play_mouse_exited():
	$play/Label.position.y -= 2


func _on_banderas_mouse_entered():
	$"bandera inglesa".position.y -= 35


func _on_banderas_mouse_exited():
	$"bandera inglesa".position.y += 35


func _on_osito_pressed():
	OS.shell_open(ulr)


func _on_osito_mouse_entered():
	$osito/AnimationPlayer.play("izquierda")


func _on_osito_mouse_exited():
	$osito/AnimationPlayer.play("derecha")
