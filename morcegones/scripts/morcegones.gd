extends RigidBody2D

#onready var flySound = get_tree().get_root().get_node("StreamPlayerFly")
onready var flySound = get_node("../StreamPlayerFly")

func _ready():
	set_process_input(true)

func _input(event):
	# print(event)
	if event.is_action_pressed("touch"):
		on_touch()

func on_touch():
	flySound.play()
	apply_impulse(Vector2(0,0),Vector2(0,-500))
	