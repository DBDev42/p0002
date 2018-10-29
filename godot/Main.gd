extends Node

# Signals

# Enums

# Constants

# Variables

# Setters and Getters

# Constructors
func _ready():
	start()

# Process functions

# Other functions
func start():
	OS.set_window_title(tr("TITLE"))
	StateMachine.change_status(load("res://status/Status01.gd").new())