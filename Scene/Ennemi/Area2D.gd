extends Area2D

var deplacement = Vector2()
var vitesse = randf_range(-300,-1000)


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	deplacement.x=vitesse*delta
	translate (deplacement)


func _on_area_entered(area):
	if area.is_in_group("munition"):
		queue_free()
		Global.nombretir = Global.nombretir - 1
		Global.oiseau = Global.oiseau - 1
	if area.is_in_group("a"):
		print ('a')
		queue_free()
		Global.oiseau = Global.oiseau - 1




func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
	Global.oiseau = Global.oiseau - 1
	print (Global.nombretir)
