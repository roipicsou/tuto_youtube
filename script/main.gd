extends Node

@export var mob_sceen : PackedScene
var score


func game_over():
	$Music.stop()
	$GameOverSond.play()
	$ScorTime.stop()
	$MobTimer.stop()
	$HUD.show_game_over()

func new_game() :
	$Music.play()
	score = 0
	$Player.start($StartPoint.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_mesg("GET READY")

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScorTime.start()

func _on_scor_time_timeout():
	score += 1
	$HUD.update_score(score)

func _on_mob_timer_timeout():
	var mob = mob_sceen.instantiate()
	var mob_spawn_location = get_node("MobPath/MobSpownLocation")
	mob_spawn_location.progress_ratio = randf()
	var directions = mob_spawn_location.rotation + PI / 2
	mob.position = mob_spawn_location.position
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(directions)
	add_child(mob)
