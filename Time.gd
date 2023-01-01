extends Node

var time: float
var paused: bool = true
onready var checkbox = get_node("/root/World/PauseCheckBox")
onready var timelabel = get_node("/root/World/TimeLabel")

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if !isPaused():
		time += delta
	timelabel.text = "Time: " + str(time).pad_decimals(2)

func isPaused():
	return !checkbox.is_pressed()
