extends Control


func set_score(score):
	$Panel/ScoreLabel.text = "Score: " + str(score)


func _on_retry_button_pressed():
	get_tree().reload_current_scene()
