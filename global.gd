extends Node

# para guardar la escena a nivel global
var current_level = 1
var curr_lvl_path = "res://ingame/level/Lvl_" + str(current_level) + ".tscn"
#var change_scene = "res://ingame/level/level_1.tscn"

# Para guardar nomre y  puntuación del personaje a nivel global
var name_player : String
var score : int

var pause = false


# Movimiento del jugador
var axis : Vector2

func go_to_lvl(new_level):
	current_level = new_level
	curr_lvl_path = "res://ingame/level/Lvl_" + str(current_level) + ".tscn"
	return curr_lvl_path
	
# función para retornar la dirección pulsada:
func get_axis() -> Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	return axis.normalized()
'''

# Para guardar la puntuación del personaje a nivel global
var score : int

# Movimiento del jugador
var axis : Vector2


# función para retornar la dirección pulsada:
func get_axis() -> Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	return axis.normalized()
	# normalized permite que se muevan con la misma velocidad en cualquier dirección


'''
