extends KinematicBody2D

# Signals

# Enums

# Constants
const _MAX_SPEED = 300

# Variables
var _direction = Vector2(0,0)
var _speed = 100
var _is_moving = false

# Setters and Getters

# Constructors
func _ready():
	set_process(true)

# Process functions
func _process(delta):
	if _is_moving:
		var collision = move_and_collide(_direction * _speed * delta)
		if collision:
			var collider = collision.get_collider()
			var normal_extra_angle = 0
			if collider.has_method("get_extra_angle"):
				normal_extra_angle = collider.get_extra_angle(collision.position)
			_direction = _direction.bounce(collision.normal.rotated(normal_extra_angle))
			if collider.has_method("get_energy") and _speed < _MAX_SPEED:
				_speed = min(_speed + collider.get_energy(), _MAX_SPEED)
			if collider.has_method("hit"):
				collider.hit()
	else:
			var mouse_x = get_global_mouse_position().x
			var bar_x = get_position().x
			move_and_collide(Vector2(mouse_x - bar_x, 0))

# Other functions
func launch_ball():
	if !_is_moving:
		_direction = Vector2(0, 1)
		_is_moving = true