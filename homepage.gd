extends Control

func _ready():
	print("Homepage loaded")

func _on_play_pressed():
	print("Play button pressed - switching to game")
	get_tree().change_scene_to_file("res://dice_roll.tscn")