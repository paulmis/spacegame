extends Camera

var target
var freeze: bool = false

func _process(delta):
	if target and !freeze:
		translation = target.translation
		rotation_degrees = Vector3(-90, -90, 0)
		transform.origin.y = target.radius * 30
