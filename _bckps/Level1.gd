extends TileMap

@onready var player = $"../Duck"
@onready var popup = $"../Window01"


# Cada nivel debería cargar al jugador en su posición de inicio.
func _ready():
	player.position = Vector2(512, 576)
	#pass
	

func _on_area_2d_body_entered(body):
	'''Si el player logra llegar, es condición de victoria.'''
	if body.is_in_group("Player"):
		body.coin_snd.play()
		await body.coin_snd.finished
		body.win_con = true


func _on_window_01_close_requested():
	popup.hide()
