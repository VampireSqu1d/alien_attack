extends Control

@onready var score = $ScoreLabel
@onready var lives_left = $LivesLabel

func set_score_label(new_score):
	score.text = "Score: " + str(new_score)


func set_lives(amount):
	lives_left.text = str(amount)
