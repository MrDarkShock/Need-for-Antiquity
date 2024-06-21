extends Node2D

var button_type = null

func _ready():
	$fond.play()

func _on_level_1_pressed():
	$click.play()
	get_tree().change_scene_to_file("res://Scene/test.tscn")

func _on_level_2_pressed():
	$click.play()
	get_tree().change_scene_to_file("res://Scene/Niveau/niveau2.tscn")
