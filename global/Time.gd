extends Node

var time: float
var paused: bool = true
onready var timelabel = get_node("/root/World/TimeLabel")

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if !paused:
		time += delta
	timelabel.text = "Time: " + str(time).pad_decimals(2)
