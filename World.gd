extends Spatial


# Called when the node enters the scene tree for the first time.
func _ready():
	var body = preload("res://Body.tscn").instance()
	body.init("Vaie", 2300, 1.5, Vector3(0, 0, 0))
	add_child(body)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
