extends Node2D


func _ready():
	$Vortex.visible = false
	$Door_Eyes.play("idle")
	
func open_door():
	$Door.play("open")
	$Door_Eyes.play("disappearing")

func _on_door_animation_finished():
	if $Door.animation == "open":
		$Vortex.visible = true
		$Vortex.play("idle")
