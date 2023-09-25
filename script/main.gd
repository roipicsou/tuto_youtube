extends Node

@export var mob_sceen : PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func game_over():
	$ScorTime.stop()
	$MobTimer.stop()

func new_game() :
	score = 0
	$Player.start($StartPoint.position)
	$StartTimer.start()

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScorTime.start()

func _on_scor_time_timeout():
	score += 1

func _on_mob_timer_timeout():
	var mob = mob_sceen.instantiate()
	var mob_spawn_location = get_node("MobPath/MobSpownLocation")
	mob_spawn_location.progress_ratio = randf()
	var directions = mob_spawn_location.rotation + PI / 2
	mob.position = mob_spawn_location.position
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(directions)
	add_child(mob)
