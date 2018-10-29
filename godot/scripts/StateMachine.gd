extends Node

# Signals

# Enums

# Constants

# Variables
var _status = null
var _config = {}

# Setters and Getters

# Constructors
func _init():
	set_process(true)

# Process functions
func _process(delta):
	if _status != null:
		_status.update()

# Other functions
func change_status(status):
	_config[status] = status.config()
	status.connect(status.SIGNAL_EXIT, self, "exit_status")
	_status = status

func exit_status(status, exit):
	print("fin")
	if _config[status] != null and _config[status][exit]:
		change_status(_config[status][exit].new())
	else:
		_status = null