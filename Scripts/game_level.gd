extends Node

@onready var progress_bar = $ProgressBar
@onready var press_sound = $PressSound

var progress := 0.0
var max_progress := 100.0
var increase_amount := 2.0
var decay_rate := 6.0

var completed := false

func _process(delta):
	if not completed:
		# Only decay if not completed
		progress -= decay_rate * delta
		progress = clamp(progress, 0, max_progress)

	progress_bar.value = progress

	# Check completion
	if not completed and progress >= max_progress:
		completed = true
		on_completed()

var last_key := ""

func _input(event):
	if event.is_action_pressed("press_q"):
		if last_key != "q":
			progress += increase_amount
			last_key = "q"

	elif event.is_action_pressed("press_e"):
		if last_key != "e":
			progress += increase_amount
			last_key = "e"

		#press_sound.pitch_scale = randf_range(0.9, 1.1)
		#press_sound.play()
		
func on_completed():
	print("Completed!")
	get_tree().change_scene_to_file("res://Assets/late.tscn")

# Change fill color to green
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0, 1, 0)  # green
	progress_bar.add_theme_stylebox_override("fill", style)
