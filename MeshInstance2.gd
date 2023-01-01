extends MeshInstance

var period = 10
var time = .0
onready var btn = get_node("../CheckBox")
onready var timeLabel = get_node("../RichTextLabel")

func _physics_process(delta):
	if btn != null and btn.is_pressed():
		time += delta
	timeLabel.text = "Time: " + str(time)
	global_transform.origin = Vector3(sin(time * 2 * 3.14 / period) * 10, 0, cos(time * 2 * 3.14 / period) * 10)
