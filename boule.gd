extends Area2D
var deplacement = Vector2()
const vitesse = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	deplacement.x=vitesse*delta
	translate (deplacement)


func _on_area_entered(area):
	if area.is_in_group("ad"):
		queue_free()
		Global.nombretir = Global.nombretir - 1
		print (Global.nombretir)

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
	Global.nombretir = Global.nombretir -1
	print (Global.nombretir)

