extends Node

var PlayerScore = -2
var OpponentScore = -2

func _on_left_body_entered(body):
	score_achieved()
	OpponentScore += 1


func _on_right_body_entered(body):
	score_achieved()
	PlayerScore += 1


func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left) + 1)


func _on_countdown_timer_timeout():
	get_tree().call_group('BallGroup', 'restart_ball')
	$CountdownLabel.visible = false


func score_achieved():
	$Ball.position = Vector2(640, 360)
	get_tree().call_group('BallGroup', 'stop_ball')
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()
	$Player.position.x = 50
	$Opponent.position.x = 1280-50
