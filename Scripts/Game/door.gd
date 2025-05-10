extends Node2D


func _ready():
	$Vortex.visible = false
	$Door.play("open")
	$Door_Eyes.play("disappearing")

func _on_door_animation_finished():
	if $Door.animation == "open":
		$Vortex.visible = true
		$Vortex.play("idle")
