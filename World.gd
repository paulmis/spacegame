extends Spatial

var data = [
	["Do-Tah", 99000, 3.4, .001, .001, Vector3(0, 0, 0)],
	["Vaie", 2300, .4, 10, 31.4, Vector3(0, 0, 0)],
	["Tentoe", 4500, .8, 12, 42.4, Vector3(0, 0, 0)],
	["Aarion", 345, .3, 35, 68.4, Vector3(0, 0, 0)]
]

# Called when the node enters the scene tree for the first time.
func _ready():
	var Body_ = preload("res://Body.tscn")
	var bodies = []
	for params in data:
		var body = Body_.instance()
		body.init(params[0], params[1], params[2], params[3], params[4], params[5])
		bodies.append(body)
	
	bodies[0].add_satelite(bodies[1])
	bodies[0].add_satelite(bodies[2])
	bodies[0].add_satelite(bodies[3])
	add_child(bodies[0])
	add_child(bodies[1])
	add_child(bodies[2])
	add_child(bodies[3])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
