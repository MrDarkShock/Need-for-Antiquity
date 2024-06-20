extends Node2D
var adversaire_scene = preload("res://advers.tscn")
var adversair_scene = preload("res://adver.tscn")
var obs_x = 100
var adv = [adversaire_scene, adversair_scene]

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.points = 0	
	$score.start ()
	$CharacterBody2D/AnimatedSprite2D.play()
	$CharacterBody2D/vitesse.start()
	Global.vie = 3
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	generate_obs()
	$CharacterBody2D/Label2.text = str(Global.points)
	if Global.vie == 2 :
		$CharacterBody2D/Hearts2.hide()
	else :
		if Global.vie == 1 :
			$CharacterBody2D/Hearts3.hide()
		if Global.vie == 0 :
			$CharacterBody2D/Hearts1.hide()




func generate_obs ():
		var obs_type = adv[randi() % adv.size()] 
		var obs = obs_type.instantiate()
		obs_x =  obs_x + randf_range(300,700)
		var obs_y  = 585
		obs.position = Vector2i (obs_x,obs_y)
		add_obs (obs,obs_x,obs_y)


	
func add_obs (obs, x ,y) :
		obs.position = Vector2i (x,y)
		add_child (obs)




func _on_score_timeout():
	Global.points = Global.points + 1
