extends TileMap

@onready var player = $"../Duck"
@onready var popup = $Window01
@onready var foto = $PatoInicio


# Cada nivel debería cargar al jugador en su posición de inicio.
func _ready():
	player.position = Vector2(512, 576)

func _on_window_01_close_requested():
	popup.hide()
	remove_child(foto)
	foto.queue_free()

func _obtains_coin_1(body):
	'''Si el player logra llegar, es condición de victoria.'''
	if body.is_in_group("Player"):
		body.coin_snd.play()
		await body.coin_snd.finished
		body.win_con = true
