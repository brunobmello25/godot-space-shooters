extends Node2D

@onready var hitbox_component = $Anchor/HitboxComponent
@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D
@onready var scale_component = $ScaleComponent


func _ready():
	scale_component.tween_scale()
	hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)


func _process(delta):
	pass
