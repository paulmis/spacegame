class_name Body_ extends Spatial

export (PackedScene) var Body_

var mass: int
var period: float
var radius: float
var distance: float
var orbit_center: Vector3
onready var sphere = $Sphere
onready var orbit = $Orbit

func init(name: String, mass: int, radius: float, period: float, distance: float, orbit_center: Vector3):
	self.name = name
	self.mass = mass
	self.radius = radius
	self.period = period
	self.distance = distance
	self.orbit_center = orbit_center
	
func _ready():
	sphere.mesh.radius = radius
	sphere.mesh.height = radius * 2
	orbit.inner_radius = distance
	orbit.outer_radius = distance + 0.04
	calculate_position()

func calculate_position():
	self.transform.origin = self.orbit_center +\
		Vector3(sin(GlobalTime.time * 2 * 3.14 / self.period) * self.distance,
				0,
				cos(GlobalTime.time * 2 * 3.14 / self.period) * self.distance)
	orbit.transform.origin = -self.transform.origin

func _process(_delta):
	self.calculate_position()
