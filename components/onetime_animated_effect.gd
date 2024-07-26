# Give the component a class name so it can be instanced as a custom node
class_name OnetimeAnimatedEffect

# This effect exports animated sprite so we can give it a sprite frames resource (to animate the effect)
extends AnimatedSprite2D

func _ready() -> void:
	# Free this node when the animation is finished
	animation_finished.connect(queue_free)
	animation_looped.connect(queue_free)
