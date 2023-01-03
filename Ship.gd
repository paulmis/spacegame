extends RigidBody


func _process(_delta):
	self.translation =\
		Vector3(sin(GlobalTime.time * 2 * 3.14 / 12) * 12,
				0,
				cos(GlobalTime.time * 2 * 3.14 / 12) * 12)
	$Texture.rect_position = PlayerCamera.camera.unproject_position(self.translation)
	$Texture.rect_rotation = -GlobalTime.time / 12 * 360
