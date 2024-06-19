extends Node2D
var adversaire_scene = preload("res://advers.tscn")
var obstacle_types := [adversaire_scene]
var obstacles : Array
var screen_size : Vector2i
var last_obs
var obs_x = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	generate_obs()



func generate_obs ():

		var obs_type = adversaire_scene 
		var obs = obs_type.instantiate()
		obs_x =  obs_x + randf_range(300,700)
		var obs_y : int = screen_size.y +150
		obs.position = Vector2i (obs_x,obs_y)
		last_obs = obs
		add_obs (obs,obs_x,obs_y)
		print(obs_x)
	
func add_obs (obs, x ,y) :
		obs.position = Vector2i (x,y)
		add_child (obs)
		obstacles.append(obs)
