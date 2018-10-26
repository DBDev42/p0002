extends StaticBody2D

# Signals
signal broken(points)

# Enums
enum Types {GREY, RED, ORANGE, YELLOW, GREEN, BLUE, INDIGO, VIOLET}

# Constants
const X = 55
const Y = 22
const SIGNAL_BROKEN = "broken"
const _texture_x_offset = [0, 224, 0, 224, 0, 224, 0, 224]
const _texture_y_offset = [0, 0, 92, 92, 92*2, 92*2, 92*3, 92*3]
const _energy_values = [5, 12, 14, 16, 18, 20, 22, 24]
const _points = [0, 10, 20, 30, 40, 50, 60, 70]

# Variables
var _type = GREY setget set_type, get_type
var _energy = _energy_values[_type] setget , get_energy

# Setters and Getters
func set_type(type):
	if Types.values().has(type):
		_type = type
		_energy = _energy_values[_type]
		$Body.region_rect.position.x = _texture_x_offset[type]
		$Body.region_rect.position.y = _texture_y_offset[type]

func get_type():
	return _type

func get_energy():
	return _energy

# Constructors

# Process functions

# Other functions
func hit():
	if _type != GREY:
		emit_signal(SIGNAL_BROKEN, _points[_type])
		queue_free()