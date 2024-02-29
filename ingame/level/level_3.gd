extends TileMap

@onready var player = $"../Duck"
@onready var popup = $Window03


# Cada nivel debería cargar al jugador en su posición de inicio.
func _ready():
	var tilesize: int = 64
	player.position = Vector2(11 * tilesize, 8 * tilesize)
	

func _obtains_coin_3(body):
	'''Si el player logra llegar, es condición de victoria.'''
	if body.is_in_group("Player"):
		body.coin_snd.play()
		await body.coin_snd.finished
		body.win_con = true


func _on_window_03_close_requested():
	popup.hide()

