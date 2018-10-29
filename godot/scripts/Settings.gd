extends Node
## @package Settings
# GDScript for loading and saving configurations files.
# These files follows the .ini knows structure.

# Signals

# Enums

# Constants
const _FILE_FULL_PATH = "user://p0002.ini"

# Variables
## @var _file
# Private file object to access the file.
var _file = null

## @var _seetings 
# Private bidimensional array to store the settings.
# All settings should be accessed by public methods.
var _settings = {} setget set_setting, get_setting

# Setters and Getters
## Simple function to save a setting.
# If the section doesn't exists it will be created.
# @param section setting's section.
# @param name setting's name.
# @param value setting's value.
func set_setting(section, name, value) :
	if _settings.has(section) :
		_settings[section][name] = value
		_save_setting(section, name, value)
	else :
		_settings[section] = {}
		set_setting(section, name, value)

## Simple function to retrieve a setting.
# @param section setting's section
# @param name setting's name
# @return The value of the setting. It will return null if the settings doesn't exists.
func get_setting(section, name) :
	if _settings.has(section) :
		if _settings[section].has(name) :
				return _settings[section][name]
	return null

# Constructors
## The very first step is to create the file object.
# It uses the _init() method instead of _ready() for that purpose.
func _init() :
	_file = ConfigFile.new()
	_load_settings()

# Process functions

# Other functions
## Function to load the configuration from the file.
func _load_settings() :
	var file_status = _file.load(_FILE_FULL_PATH)
	if file_status == OK :
		# File exists and is ready to be readed.
		for section in _file.get_sections() :
			_settings[section] = {}
			for name in _file.get_section_keys(section) :
				_settings[section][name] = _file.get_value(section, name)
		_file.save(_FILE_FULL_PATH)
	else :
		# File doesn't exists and is created empty.
		_save_settings()

## Function to save all the settings at once.
func _save_settings() :
	if _file == null :
		_file = ConfigFile.new()
	for section in _settings.keys() :
		for name in _settings[section].keys() :
			_file.set_value(section, name, _settings[section][name])
	_file.save(_FILE_FULL_PATH)

## Function to save a specific setting.
# @param section setting's section
# @param name setting's section
# @param value setting's value
func _save_setting(section, name, vale) :
	if _file == null :
		_file = ConfigFile.new()
		_file.load(_FILE_FULL_PATH)
	_file.set_value(section, name, vale)
	_file.save(_FILE_FULL_PATH)