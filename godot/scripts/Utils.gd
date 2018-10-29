extends Node
## @package Logger
# GDScript with different functions of general purpose.

# Signals

# Enums

# Constants

# Variables
## @var _randomized Controls if the random generator has been started
var _randomized = false

# Setters and Getters

# Constructors

# Process functions

# Other functions
## Function to split a string based on a character.
# @param string String to be splitted.
# @param character Character identified as separator.
# @return Array with all the parts from the string.
func split(string, character):
	var result = [""]
	var i = 0
	for c in string:
		if c == character:
			result.append("")
			i += 1
		result[i] += c
	return result

## Function to retrieve a random value between 2 integer values.
# It doesn't matter the order for the parameters becouse it uses the absolute value of the difference.
# The function starts the random generator if it's not working.
# @param limit_1 First limit for the random value.
# @param limit_2 Second limit for the random value.
# @return A random value between both limits. The value will be an integer.
func random_int_between(limit_1, limit_2):
	if not _randomized:
		randomize()
		_randomized = true
	
	var minor = min(float(limit_1), float(limit_2))
	return round(minor + abs(float(limit_1 - limit_2)) * randf())

## Function to retrieve a random value.
# The function starts the random generator if it's not working.
# @return A random value between 0 and 1. The value will be a float.
func random_float():
	if not _randomized:
		randomize()
		_randomized = true
	
	return randf()

## Function to create a universal unique identificator with the v4 format.
# @return An unique identifier.
func uuidv4() :
	var bytes = PoolByteArray()
	for i in range(16) :
		bytes.append(randi() % 256)
	bytes[6] = (bytes[6] & 0x0f) | 0x40
	bytes[8] = (bytes[8] & 0x3f) | 0x80
	return "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x" % [bytes[0], bytes[1], bytes[2], bytes[3], bytes[4], bytes[5], bytes[6], bytes[7], bytes[8], bytes[9], bytes[10], bytes[11], bytes[12], bytes[13], bytes[14], bytes[15]]