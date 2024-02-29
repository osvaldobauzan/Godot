extends Node2D

@onready var popup = $Window
@onready var save_button = $Window/ColorRect/Control/Panel/Save

@onready var menu_save = preload("res://scenes/saveGame.tscn")

var instance_menu_save

# Called when the node enters the scene tree for the first time.
func _ready():
	save_button.grab_focus()
	popup.hide()
	
	instance_menu_save = menu_save.instantiate()
	add_child(instance_menu_save)
	
	
func _process(delta):
	if Input.is_action_just_pressed("menu"):
		
		get_tree().paused = true
		popup.show()	
		save_button.grab_focus()



func _on_window_close_requested():
	popup.hide()


func _on_back_pressed():
	get_tree().paused = false
	popup.hide()



func _on_save_pressed():

	instance_menu_save.popup.show()
	popup.hide()

	
func _on_salir_pressed():
	Firebase.Auth.logout()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/pantalla_inicio.tscn")
	
