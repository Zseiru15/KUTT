extends Node

var slow = false
var slown = false
var personajex
var personajey
var evenedado = true
var ataque = false

var llegada 
var direction
var x

var generacion = true
var destruccion = false
var ultima_fase = false

var cant = 0
var contador_interno = 0
var cambio_de_lugar = false
var reaparicion = false
var boss_desplazamiento = false
var marker

var cant_oculta = 0

var vida = false
var change_scene = false
var speed = 150
var knocback_direction
var invulnerabilidad = false
var randx = 0
var randy = 0
var lado = 0
var dir = 0

var juego = false

var full_screen = true

var fase = 0


	#convertir numero de casillas en valor de pixeles
func _physics_process(delta):
	
		if Input.is_key_pressed(KEY_F11):
			if full_screen == true:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
				full_screen = false
			else:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
				full_screen = true
				
