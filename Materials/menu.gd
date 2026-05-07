extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Materials/Credits.tscn")


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_level.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
	pass # Replace with function body.



	get_tree().change_scene_to_file("res://Scenes/Bus.tscn")
	pass # Replace with function body.
	


func _on_late_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Bus.tscn")


func hungry_on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/centra.tscn")
	pass # Replace with function body.
