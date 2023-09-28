extends CanvasLayer

signal  start_game

func show_mesg(text) :
	$Mesage.text = text
	$Mesage.show()
	$MesageTimer.start()

func show_game_over():
	show_mesg("GAME OVER")
	await  $MesageTimer.timeout
	
	$Mesage.text = "EVITE LES ENEMIE"
	$Mesage.show()
	
	await  get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score) :
	$ScoreLabel.text = str(score)

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()


func _on_mesage_timer_timeout():
	$Mesage.hide()
