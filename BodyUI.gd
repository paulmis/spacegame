extends Control

var lock: bool = false
var current

func show_body(body: Body_):
	current = body
	$Name.text = "Name: " + body.name
	$PrimaryName.text = "Primary: " + body.primary.name if body.primary else ""
	$Period.text = str(body.period).pad_decimals(2)
	show()
	
func hide_body():
	if !lock:
		hide()

func _on_FollowButton_pressed():
	var target = current
	var target_translation = Vector3(
		target.translation.x,
		target.radius * 30,
		target.translation.z
	)
	
	var tween = get_tree().create_tween()
	tween.tween_property(PlayerCamera, "freeze", true, .0)
	tween.tween_property(PlayerCamera, "translation", target_translation, 0.2).set_trans(Tween.TRANS_CIRC)
	tween.tween_property(PlayerCamera, "target", target, .0)
	tween.tween_property(PlayerCamera, "freeze", false, .0)
