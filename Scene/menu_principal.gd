extends Node2D

var button_type = null

func _on_commencer_pressed():
	button_type = "commencer"
	get_tree().change_scene_to_file("res://Scene/Selection_Niveaux.tscn")
	$click.play()

func _on_quitter_pressed():
	get_tree().quit()
	$click.play()
func _ready():
	$fond.play ()
