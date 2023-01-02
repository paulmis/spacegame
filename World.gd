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
	bodies[2].add_satelite(bodies[3])
	bodies[0].add_satelite(bodies[4])
	
	for body in bodies:
		add_child(body)

	PlayerCamera.target = bodies[0]
	

