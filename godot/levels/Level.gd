extends Node2D

# Signals

# Enums

# Constants

# Variables
onready var block = preload("res://assets/block/Block.tscn")
var score = 0

# Setters and Getters

# Constructors
func _ready():
	randomize()
	$Bar.set_position($GameArea.get_bars_start_point())
	$Ball.set_position($GameArea.get_bars_start_point() + $Bar.get_balls_start_point())
	for y in range(20):
		for x in range(20):
			var b = block.instance()
			b.set_position(Vector2($GameArea.get_blocks_top_left_corner().x+x*b.X, $GameArea.get_blocks_top_left_corner().y+y*b.Y))
			b.set_type(randi()%b.Types.size())
			b.connect(b.SIGNAL_BROKEN, self, "update_score")
			$Blocks.add_child(b)
	set_process_input(true)

# Process functions
func _input(event):
	if event is InputEventMouseButton:
		$Ball.launch_ball()

# Other functions
func update_score(points):
	score += points
	$Points.text = str(score)