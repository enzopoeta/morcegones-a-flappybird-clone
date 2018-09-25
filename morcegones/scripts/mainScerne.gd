extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var character = get_node("Character")
onready var backgorund = get_node("BackgroundAnimation")
onready var gameResetTimer = get_node("TimerGameReset")
onready var scoreLabel = get_node("Node2DScore/ControlScore/LabelScore")
onready var scoreSound = get_node("StreamPlayerScore")
onready var deathSound = get_node("StreamPlayerDeath")
onready var backgroundSound = get_node("StreamPlayerBackgroundMusic")

var score =0
var state =1
var RUNNING =1
var STOPPED=2

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func gameKill():
	# print("kill")
	character.apply_impulse(Vector2(0,0),Vector2(-1000,0))
	backgorund.stop()
	backgroundSound.stop()
	deathSound.play()
	state =STOPPED
	gameResetTimer.start()

func _on_TimerGameReset_timeout():
	get_tree().reload_current_scene();

func computeScore():
	score+=1
	scoreLabel.set_text(str(score))
	scoreSound.play();
	
	