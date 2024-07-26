class_name PinkEnemy
extends Enemy

@onready var states = $States

@onready var paused_state: TimedStateComponent = %PausedState

@onready var moving_down_state: TimedStateComponent = %MovingDownState

@onready var move_state: TimedStateComponent = %MovingSidewaysState
@onready var move_side_component = %MoveSideComponent

@onready var fire_state = %FireState
@onready var projectile_spawner_component = %ProjectileSpawnerComponent

func _ready():
	super()
	
	for state: StateComponent in states.get_children():
		state.disable()
		
	move_side_component.velocity.x = [-20, 20].pick_random()
	
	moving_down_state.state_finished.connect(move_state.enable)
	move_state.state_finished.connect(func():
		fire_state.enable()
		scale_component.tween_scale()
		projectile_spawner_component.spawn(global_position)
		fire_state.disable()
		fire_state.state_finished.emit()
	)
	fire_state.state_finished.connect(paused_state.enable)
	paused_state.state_finished.connect(moving_down_state.enable)

	moving_down_state.enable()
