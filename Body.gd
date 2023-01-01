class_name Body_ extends Spatial

export (PackedScene) var Body_

var mass: int
var period: float = 5
var radius: float = 1
var orbit_center: Vector3
onready var sphere = $Sphere

func init(name: String, mass: int, radius: float, orbit_center: Vector3):
	self.name = name
	self.mass = mass
	self.radius = radius
	self.orbit_center = orbit_center
	
func _ready():
	sphere.mesh.radius = radius
	sphere.mesh.height = radius * 2
	calculate_position()

func calculate_position():
	self.transform.origin = self.orbit_center +\
		Vector3(sin(GlobalTime.time * 2 * 3.14 / self.period) * 10,
				0,
				cos(GlobalTime.time * 2 * 3.14 / self.period) * 10)

func _process(_delta):
	self.calculate_position()
