extends Control

@onready var playerLabel = $Panel/HBoxContainer2/NamePlayer
@onready var level = $Panel/HBoxContainer/Level

func _ready():

	playerLabel.text = "Player: %s" % GLOBAL.name_player.split("@")[0]	
	level.text = "%s" % GLOBAL.current_level


func _on_logout_pressed():
	Firebase.Auth.logout()
	get_tree().change_scene_to_file("res://scenes/authentication.tscn")
