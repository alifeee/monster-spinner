@tool
extends Node3D

func _ready():
	var sprites = get_children()
	var tot = len(sprites)
	print("got ", tot, " sprites")
	for i in range(0, len(sprites)):
		print("ith sprite: ", i)
		var sprite: Sprite3D = sprites[i]
		
		var ang = float(i)/float(tot) * 2*PI
		sprite.rotation.y = ang
	
		sprite.position.y = 0
		sprite.position.x = 0.5 * sin(ang)
		sprite.position.z = 0.5 * cos(ang)
