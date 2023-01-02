class_name Body_ extends Spatial

export (PackedScene) var Body_

var mass: int
var period: float
var radius: float
var distance: float
var orbit_center: Vector3
var primary
var satelites: Array = []
onready var sphere = $Sphere
onready var collision = $CollisionShape
onready var ui = get_node("/root/World/BodyUI")
onready var orbit = $Orbit
onready var detail = get_node("/root/World/DetailCheckBox")

func init(name: String, mass: int, radius: float, period: float, 
		  distance: float):
	self.name = name
	self.mass = mass
	self.radius = radius
	self.period = period
	self.distance = distance
	
func _ready():
	var mesh = SphereMesh.new()
	mesh.radius = radius
	mesh.height = radius * 2
	sphere.mesh = mesh
	
	var collisionShape = SphereShape.new()
	collisionShape.radius = radius
	collision.shape = collisionShape
	
	orbit.inner_radius = distance
	orbit.outer_radius = distance + 0.1
	calculate_position()

func set_primary(primary: Body_):
	self.primary = primary

func add_satelite(satelite: Body_):
	satelite.set_primary(self)
	self.satelites.append(satelite)
	
func get_orbit_center():
	if primary:
		return primary.transform.origin
	return Vector3()

func calculate_position():
	self.transform.origin = get_orbit_center() +\
		Vector3(sin(GlobalTime.time * 2 * 3.14 / self.period) * self.distance,
				0,
				cos(GlobalTime.time * 2 * 3.14 / self.period) * self.distance)
	orbit.transform.origin = get_orbit_center() - self.transform.origin

func _process(_delta):
	self.calculate_position()
	orbit.visible = detail.is_pressed()


func _on_RigidBody_mouse_entered():
	print(ui)
	print(self)
	ui.show_body(self)

func _on_RigidBody_mouse_exited():
	ui.hide_body()
	
func _on_RigidBody_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			BUTTON_LEFT:
				ui.lock = !ui.lock
