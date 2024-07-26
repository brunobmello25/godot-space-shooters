extends Node2D

@onready var left_muzzle: Marker2D = $LeftMuzzle
@onready var right_muzzle: Marker2D = $RightMuzzle
@onready var spawner_component: SpawnerComponent = $SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var ship_sprite = $Anchor/ShipSprite
@onready var flame_sprite = $Anchor/FlameSprite
@onready var move_component = $MoveComponent
@onready var variable_pitch_audio_stream_player = $VariablePitchAudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	fire_rate_timer.timeout.connect(fire_lasers)
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	animate_ship()


func fire_lasers() -> void:
	variable_pitch_audio_stream_player.play_with_variance()
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)
	scale_component.tween_scale()


func animate_ship() -> void:
	if move_component.velocity.x > 0:
		ship_sprite.play("bank_right")
		flame_sprite.play("bank_right")
	elif move_component.velocity.x < 0:
		ship_sprite.play("bank_left")
		flame_sprite.play("bank_left")
	else:
		ship_sprite.play("center")
		flame_sprite.play("center")
