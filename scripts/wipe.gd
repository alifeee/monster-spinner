extends CanvasLayer

@export var text: Label
@export var background: ColorRect
@export var leftwiper: ColorRect
var left_from
const left_to = -300
@export var rightwiper: ColorRect
var right_from
const right_to = 400
const TWEEN_TIME = 0.5
signal begin_spinners
@export var skip: bool = false

func _ready():
	if skip:
		background.visible = false
		text.visible = false
		begin_spinners.emit()
		return
	text.visible = false
	left_from = leftwiper.position.x
	right_from = rightwiper.position.x
	
	# tween !
	var tween = get_tree().create_tween()
	# wait
	tween.tween_interval(1)
	# set text visible and grow it
	tween.tween_callback(func (): text.visible = true)
	tween.tween_property(text.label_settings, "font_size", 50, 0.25)
	tween.tween_interval(1)
	# wipe together
	var ease = Tween.EASE_IN
	var trans = Tween.TRANS_SINE
	tween.tween_property(leftwiper, "position:x", left_to, TWEEN_TIME).set_ease(ease).set_trans(trans)
	tween.parallel().tween_property(rightwiper, "position:x", right_to, TWEEN_TIME).set_ease(ease).set_trans(trans)
	# wait
	tween.tween_callback(func(): background.visible = false)
	tween.tween_callback(func(): text.visible = false)
	tween.tween_interval(2)
	# begin 3D scene
	tween.tween_callback(func(): begin_spinners.emit())
	# wipe apart
	tween.tween_property(leftwiper, "position:x", left_from, TWEEN_TIME).set_ease(ease).set_trans(trans)
	tween.parallel().tween_property(rightwiper, "position:x", right_from, TWEEN_TIME).set_ease(ease).set_trans(trans)
	tween.play()
