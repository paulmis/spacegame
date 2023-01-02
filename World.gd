extends Spatial

var data = [
	["Do-Tah", 99000, 3.4, .001, .001],
	["Vaie", 2300, .4, 10, 31.4],
	["Tentoe", 4500, 1.1, 12, 42.4],
	["Vo-va", 300, .2, 5, 2.5],
	["Aarion", 345, .3, 35, 68.4]
]

# Called when the node enters the scene tree for the first time.
func _ready():
	var Body_ = preload("res://Body.tscn")
	var bodies = []
	for params in data:
		var body = Body_.instance()
		body.init(params[0], params[1], params[2], params[3], params[4])
		bodies.append(body)
	
	bodies[0].add_satelite(bodies[1])
	bodies[0].add_satelite(bodies[2])
	bodies[2].add_satelite(bodies[3])
	bodies[0].add_satelite(bodies[4])
	
	for body in bodies:
		add_child(body)
		
	PlayerCamera.target = bodies[0]

func _process(_delta):
	if Input.is_action_just_pressed("toggle_pause"):
		GlobalTime.paused = !GlobalTime.paused
	if Input.is_action_just_released("scroll_down"):
		PlayerCamera.camera.translation = Vector3(
			PlayerCamera.camera.translation.x,
			PlayerCamera.camera.translation.y * 1.1,
			PlayerCamera.camera.translation.z
		)
	if Input.is_action_just_released("scroll_up"):
		PlayerCamera.camera.translation = Vector3(
			PlayerCamera.camera.translation.x,
			PlayerCamera.camera.translation.y * 0.9,
			PlayerCamera.camera.translation.z
		)
