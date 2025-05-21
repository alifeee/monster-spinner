extends Node3D

var time_start
@export var spinners: Array[MeshInstance3D]
const TOTAL_ROTATIONS = 50
const SPIN_TIME = 5
const DELAY_BETWEEN_SPINNERS = 1

func _on_canvas_layer_begin_spinners() -> void:
	print("spinning !")
	time_start = Time.get_ticks_msec()
	var tween = get_tree().create_tween()
	for i in range(0, len(spinners)):
		var spinner = spinners[i]
		var final_angle = spinner.rotation.x
		spinner.rotation.x = TOTAL_ROTATIONS * 2 * PI
		tween.parallel().tween_property(spinner, "rotation:x", final_angle, SPIN_TIME + i * DELAY_BETWEEN_SPINNERS) \
			.set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	tween.play()
	pass
