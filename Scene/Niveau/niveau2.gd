extends Node2D
var adversaire_scene = preload("res://Scene/Ennemi/adver.tscn")
var adversair_scene = preload("res://Scene/Ennemi/advers.tscn")
var obs_x = 100
var adv = [adversaire_scene, adversair_scene]
var mech = preload("res://Scene/Ennemi/méchant.tscn")
var me = preload ("res://Scene/Ennemi/méchant2.tscn")
var mec = preload ("res://Scene/Ennemi/méchant3.tscn")
var listemechant = [mech,me,mec]
var m_x = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.points = 0	
	$score.start ()
	$CharacterBody2D/AnimatedSprite2D.play()
	$CharacterBody2D/vitesse.start ()
	$CharacterBody2D/vitesse.start()
	$CharacterBody2D/saut.start()
	Global.vie = 3
	Global.oiseau = 0
	$sound.play()
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	generate_obs()
	if Global.oiseau < 2 :
		generate_méchant()
		Global.oiseau = Global.oiseau + 1
	$CharacterBody2D/Label2.text = str(Global.points)




func generate_obs ():
		var obs_type = adv[randi() % adv.size()] 
		var obs = obs_type.instantiate()
		obs_x =  obs_x + randf_range(300,700)
		var obs_y  = 485
		obs.position = Vector2i (obs_x,obs_y)
		add_obs (obs,obs_x,obs_y)


	
func add_obs (obs, x ,y) :
		obs.position = Vector2i (x,y)
		add_child (obs)


func generate_méchant ():
		
		var m = listemechant[randi() % listemechant.size()] .instantiate()
		m_x = m_x + 400
		var m_y  = 371
		m.position = Vector2i (m_x,m_y)
		add_méchant (m,m_x,m_y)


	
func add_méchant (m, x ,y) :
		m.position = Vector2i (x,y)
		add_child (m)

func _on_score_timeout():
	Global.points = Global.points + 1
