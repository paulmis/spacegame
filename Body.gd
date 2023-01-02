class_name Body_ extends Spatial

export (PackedScene) var Body_

var mass: int
var period: float
var radius: float
var distance: float
var orbit_center: Vector3
var primary: Body_
var satelites: Array = []
onready var sphere = $Sphere
onready var collision = $CollisionShape
onready var dialog = get_node("/root/World/BodyDialog")
onready var orbit = $Orbit
onready var detail = get_node("/root/World/DetailCheckBox")

func init(name: String, mass: int, radius: float, period: float, 
		  distance: float, orbit_center: Vector3):
	self.name = name
	self.mass = mass
	self.radius = radius
	self.period = period
	self.distance = distance
	self.orbit_center = orbit_center
	
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
	
func add_satelite(satelite: Body_):
	satelite.primary = self
	self.satelites.append(satelite)

func calculate_position():
	self.transform.origin = self.orbit_center +\
		Vector3(sin(GlobalTime.time * 2 * 3.14 / self.period) * self.distance,
				0,
				cos(GlobalTime.time * 2 * 3.14 / self.period) * self.distance)
	orbit.transform.origin = -self.transform.origin

func _process(_delta):
	self.calculate_position()
	orbit.visible = detail.is_pressed()


func _on_RigidBody_mouse_entered():
	dialog.get_node("Name").text = "Name: " + name
	if primary:	
		dialog.get_node("PrimaryName").text = "Primary: " + primary.name
	else:
		dialog.get_node("PrimaryName").text = ""
	dialog.get_node("Period").text = str(period)
		
	dialog.show()


func _on_RigidBody_mouse_exited():
	dialog.hide()
