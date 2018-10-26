extends KinematicBody2D

# Signals

# Enums

# Constants
const MAX_EXTRA_ANGLE = -PI/8

# Variables

# Setters and Getters

# Constructors
func _ready():
	set_process(true)

# Process functions
func _process(delta):
	var mouse_x = get_global_mouse_position().x
	var bar_x = get_position().x
	move_and_collide(Vector2(mouse_x - bar_x, 0))

# Other functions
func get_balls_start_point():
	return $BallsStartPoint.position

func get_extra_angle(collision):
	var center_x = get_position().x
	return MAX_EXTRA_ANGLE * ((center_x - collision.x)/40)