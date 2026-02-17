class_name caminando
extends State

@export var actor: kutt
@export var knockback_power: int = 2000
const whiten_duration = 0.5 
@export var whiten_material : ShaderMaterial
@onready var animation_tree : AnimationTree = $"../../AnimationTree"
var input_direction :Vector2 = Vector2.ZERO

signal choke

func _ready():
	set_physics_process(false)
	animation_tree.active = true

func _enter_state() -> void:
	set_physics_process(true)
func _exit_state()->void:
	set_physics_process(false)

func get_input():
	input_direction = Input.get_vector("left", "rigth", "up", "down")
	actor.velocity = input_direction * actor.speed
	actor.position.x = clamp(actor.position.x, -259, 256)
	actor.position.y = clamp(actor.position.y, -266, 211)
	
	

func _physics_process(delta):
	Variables.personajex = actor.global_position.x
	Variables.personajey = actor.global_position.y
	if Variables.change_scene == false:
		get_input()
		if Variables.slow == true:
			actor.velocity /=2
		actor.move_and_slide()
		update_animation_parameters()
		 
	

func knockbac(enemyVelocity : Vector2):
	var knocback_direction = (enemyVelocity- actor.velocity).normalized() * knockback_power
	actor.velocity = knocback_direction


func _on_hurtbox_area_entered(area):
	
	
	if Variables.invulnerabilidad == false:
		if Variables.slown == false:
			knockbac(area.get_parent().velocity)
		if Variables.slown == true:
			knockbac(area.get_parent().velocity*0)
			
		actor.move_and_slide()
		actor.health -= 2
		Variables.invulnerabilidad = true
		$"../../invunerability".start()
		$"../../ouch".play()
	else:
		whiten_material.set_shader_parameter("whiten", true)
		await get_tree().create_timer(whiten_duration).timeout
		whiten_material.set_shader_parameter("whiten", false)


func _on_invunerability_timeout():
	Variables.invulnerabilidad = false
	
func update_animation_parameters():
	if actor.velocity == Vector2.ZERO:
		animation_tree["parameters/conditions/is_still"] = true
		animation_tree["parameters/conditions/is_walking"] = false
	else:
		animation_tree["parameters/conditions/is_still"] = false
		animation_tree["parameters/conditions/is_walking"] = true
	animation_tree["parameters/iddle/blend_position"] = input_direction
	animation_tree["parameters/walk/blend_position"] = input_direction
	
	
	
