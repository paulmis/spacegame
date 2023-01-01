extends Spatial

var bodies = [
	["Vaie", 2300, .3, 10, 32.4, Vector3(0, 0, 0)],
	["Tentoe", 4500, .6, 12, 46.4, Vector3(0, 0, 0)]
]

# Called when the node enters the scene tree for the first time.
func _ready():
	var Body_ = preload("res://Body.tscn")
	for params in bodies:
		var body = Body_.instance()
		body.init(params[0], params[1], params[2], params[3], params[4], params[5])
		add_child(body)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
