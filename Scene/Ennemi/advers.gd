extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(area):
	if area.is_in_group("munition"):
		queue_free()
		Global.vie = Global.vie - 1
	if area.is_in_group("a"):
		queue_free()
		Global.vie = Global.vie - 1




		


