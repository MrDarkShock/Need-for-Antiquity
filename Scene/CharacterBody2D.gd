extends Node2D
var adversaire_scene = preload("res://advers.tscn")
var obstacle_types := [adversaire_scene]
var obstacles : Array
var screen_size : Vector2i
var last_obs
var obs_x = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.points = 0	
	$score.start ()
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	generate_obs()
	$CharacterBody2D/Label2.text = str(Global.points)




func generate_obs ():
		var obs_type = adversaire_scene 
		var obs = obs_type.instantiate()
		obs_x =  obs_x + randf_range(300,700)
		var obs_y  = 150
		obs.position = Vector2i (obs_x,obs_y)
		last_obs = obs
		add_obs (obs,obs_x,obs_y)
		print(obs_x)

	
func add_obs (obs, x ,y) :
		obs.position = Vector2i (x,y)
		add_child (obs)
		obstacles.append(obs)



func _on_score_timeout():
	Global.points = Global.points + 1