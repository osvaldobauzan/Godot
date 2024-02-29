extends Button

#@export var path = "res://scenes/escena3DInicial.tscn"

# Si quiero una imagen que muestre una carga
@export var path = "res://scenes/options.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	# grab_focus()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	# Si el path no está vacío, llamamos a la ruta que he pasado
	if path != "":
		#get_tree().change_scene_to_file(path)
		get_tree().change_scene_to_file(path)


