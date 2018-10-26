extends StaticBody2D

# Signals

# Enums

# Constants
const _MIDDLE_LAYER_OFFSET = 20
const _FRONT_LAYER_OFFSET = 40

# Variables

# Setters and Getters

# Constructors
func _ready():
	set_process(true)

# Process functions
func _process(delta):
	$Background/MiddleLayer.motion_offset += Vector2(0, _MIDDLE_LAYER_OFFSET*delta)
	$Background/FrontLayer.motion_offset += Vector2(0, _FRONT_LAYER_OFFSET*delta)

# Other functions
func get_blocks_top_left_corner():
	return $BlocksTopLeftCorner.position

func get_bars_start_point():
	return $BarsStartPoint.position