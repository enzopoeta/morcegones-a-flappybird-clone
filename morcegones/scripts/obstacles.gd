extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var speed = -150

onready var mainScene =get_tree().get_current_scene();

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func _process(delta):
	if mainScene.state == mainScene.RUNNING :
		set_pos(get_pos()+Vector2(speed*delta,0))
	if get_pos().x < -130:
		queue_free();


func _on_Area2D_body_enter( body ):
	if body.get_name() =="Character" :
		mainScene.gameKill();


func _on_Area2DScoreDetector_body_enter( body ):
	mainScene.computeScore()
