extends Node

var target
var freeze: bool = true
onready var camera: Camera = get_node("/root/World/PlayerCamera")

func _process(_delta):
	if target and !freeze:
		camera.translation = Vector3(
			target.translation.x,
			camera.translation.y,
			target.translation.z
		)
		camera.rotation_degrees = Vector3(-90, -90, 0)
