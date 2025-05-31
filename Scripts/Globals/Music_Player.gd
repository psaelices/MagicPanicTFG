extends Node

var audio_stream_player: AudioStreamPlayer

func _ready() -> void:
	# Crea un nuevo nodo AudioStreamPlayer
	audio_stream_player = AudioStreamPlayer.new()
	# Asegúrate de que este nodo persista al cambiar de escena
	audio_stream_player.process_mode = Node.PROCESS_MODE_ALWAYS
	# Asigna la música que quieres reproducir
	audio_stream_player.stream = load("res://Assets/music/menu_music.ogg")
	# Activa el bucle
	audio_stream_player.stream.loop = true
	# Añade el reproductor como hijo de este singleton
	add_child(audio_stream_player)
	# Inicia la reproducción
	audio_stream_player.play()

func stop_music() -> void:
	audio_stream_player.stop()

func play_music() -> void:
	if not audio_stream_player.playing:
		audio_stream_player.play()
