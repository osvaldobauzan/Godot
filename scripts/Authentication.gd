extends Control

@export var path = "res://scenes/loading.tscn"
# @export var path2 = "res://scenes/perfil.tscn"
@export var path2 = "res://scenes/load_game.tscn"

var name_player : String


# Called when the node enters the scene tree for the first time.
func _ready():
	%Email.grab_focus()
	Firebase.Auth.login_succeeded.connect(on_login_succeeded)
	Firebase.Auth.signup_succeeded.connect(on_signup_succeeded)
	Firebase.Auth.login_failed.connect(on_login_failed)
	Firebase.Auth.signup_failed.connect(on_signup_failed)
	%LoginLabel.text = "Logging:"
	
	if Firebase.Auth.check_auth_file():
		var auth = Firebase.Auth.auth
		print("localid: ")
		GLOBAL.name_player = auth.email
		print(auth.email)
		print(auth.localid)
		print("fin localid")
		%LoginLabel.text = "Logged in"
		get_tree().change_scene_to_file(path)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_log_in_button_pressed():
	# % este símbolo es porque al mismo nodo he seleccionado la característica de nombre único
	var email = %Email.text
	var password = %Password.text
	Firebase.Auth.login_with_email_and_password(email, password)
	%LoginLabel.text = "Logging in..."
	# prueba a redireccionar a la escena loading
	
	

func _on_sign_up_button_pressed():
	var email = %Email.text
	var password = %Password.text
	Firebase.Auth.signup_with_email_and_password(email, password)
	%LoginLabel.text = "Signing up..."


func on_login_succeeded(auth):
	# tengo que llevar el nombre a global y mostrarlo en level
	print(auth)
	%LoginLabel.text = "Login success!"
	# Para almacenar el usuario logueado y no tener que ingresar siempre las credenciales
	Firebase.Auth.save_auth(auth)
	Firebase.Auth.load_auth()
	
	# asignar el nombre a global name para mostrar en pantalla:

	name_player = %Email.text
	GLOBAL.name_player = name_player
	print("nombre en auth: ")
	print(%Email.text)
	print(name_player)
	print("fin en auth")
	get_tree().change_scene_to_file(path2)
	
func on_signup_succeeded(auth):
	print(auth)
	%LoginLabel.text = "Sign Up Success"
	
	Firebase.Auth.save_auth(auth)
	Firebase.Auth.load_auth()
	# get_tree().change_scene_to_file(path)
	
func on_login_failed(error_code, message):
	print(error_code)
	print(message)
	%LoginLabel.text = "Login failed: %s" % message
	
	
func on_signup_failed(error_code, message):
	print(error_code)
	print(message)
	%LoginLabel.text = "Sign up failed: %s" % message
	
	


func _on_salir_pressed():
	get_tree().change_scene_to_file("res://scenes/pantalla_inicio.tscn")
