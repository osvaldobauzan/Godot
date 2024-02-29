extends TileMap


func _on_window_final_confirmed():
	get_tree().change_scene_to_file(GLOBAL.go_to_lvl(1))



func _on_window_final_canceled():
	get_tree().change_scene_to_file("res://scenes/pantalla_inicio.tscn")
