extends Position2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var obstacle = preload("res://assets/ObstaclesScene.tscn")

func _ready():
	randomize()


func _on_Timer_timeout():
	var newObstacle = obstacle.instance()
	newObstacle.speed=-400
	newObstacle.set_pos(get_pos()+Vector2(0,rand_range(-500,500)))
	get_owner().add_child(newObstacle)
