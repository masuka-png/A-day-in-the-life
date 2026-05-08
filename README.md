# A-day-in-the-life

Student Name: Sam Enright
Student Number: A00033285
Student Email: A0033285@myTUDublin.ie



***Gameplay Video***
[Video](https://www.youtube.com/watch?v=0j3_Hj_wQ0w)




***Gameplay Images***
<img width="718" height="384" alt="Screenshot 2026-05-08 002320" src="https://github.com/user-attachments/assets/16ecd736-ae28-4f40-a7f2-9399615ced50" />


<img width="371" height="375" alt="Screenshot 2026-05-08 002340" src="https://github.com/user-attachments/assets/ddd722d8-4eb7-424c-8c51-18ccbd67d5ab" />


<img width="883" height="425" alt="Screenshot 2026-05-08 002411" src="https://github.com/user-attachments/assets/8be8e8e2-1a01-42c7-8e7f-14c6a51545e6" />


<img width="883" height="425" alt="Screenshot 2026-05-08 002411" src="https://github.com/user-attachments/assets/246add34-eb0c-4fda-baf4-fbc78cbd57e9" />


***What I learned from making this game*** 
This process of making this game really thought me alot about how to make games using Godot. As a person who primarily uses Unity switching to a new engine was hard at first. But through a combination of trial and error and informative tutorials on Youtube I really think i've learned alot about Godot. The concept of instantiating scenes was difficult to grasp at the beginning but towards the end I become comfortable with doing and made making the game easier.


***Code Examples***

Centra.gd
extends CanvasLayer


var ingredient_sets = [

	[
		{
			"name": "Bread",
			"texture": preload("res://Ingredients/Bread.png")
		},
		{
			"name": "Wrap",
			"texture": preload("res://Ingredients/Wrap.png")
		},
		{
			"name": "Roll",
			"texture": preload("res://Ingredients/Roll.png")
		}
	],
	[
		{
			"name": "Spicy Chicken",
			"texture": preload("res://Ingredients/Spicy Chicken.png")
		},
		{
			"name": "Plain Chicken",
			"texture": preload("res://Ingredients/Plain Chicken.png")
		},
		{
			"name": "Southern Fried Chicken",
			"texture": preload("res://Ingredients/Southern Fried Chicken.png")
		}
	],
	[
		{
			"name": "Lettuce",
			"texture": preload("res://ingredients/lettuce.png")
		},
		{
			"name": "Tomato",
			"texture": preload("res://ingredients/tomato.png")
		},
		{
			"name": "Cheese",
			"texture": preload("res://Ingredients/Cheese.png")
		}
	],
	[
		{
			"name": "Mayo",
			"texture": preload("res://Ingredients/Mayo.png")
		},
		{
			"name": "Ketchup",
			"texture": preload("res://ingredients/ketchup.png")
		},
		{
			"name": "Taco Sauce",
			"texture": preload("res://Ingredients/Taco Sauce.png")
		}
	]
]

var category_names = [
	"Bread",
	"Protein",
	"Toppings",
	"Sauce"
]

var current_set = 0

var current_index = 0

var chosen_ingredients = []

@onready var ingredient_label = $Control/Ingredients
@onready var category_label = $Control/Category
@onready var ingredient_image = $Control/Images


func _ready():
	update_display()


func update_display():
	category_label.text = "Choose " + category_names[current_set]

	var ingredient = ingredient_sets[current_set][current_index]

	ingredient_image.texture = ingredient["texture"]
	
	ingredient_label.text = ingredient["name"]


func _on_left_button_pressed():
	current_index -= 1

	if current_index < 0:
		current_index = ingredient_sets[current_set].size() - 1

	update_display()


func _on_right_button_pressed():
	current_index += 1

	if current_index >= ingredient_sets[current_set].size():
		current_index = 0

	update_display()


func _on_select_button_pressed():
	var chosen = ingredient_sets[current_set][current_index]["name"]
	chosen_ingredients.append(chosen)

	current_set += 1

	# Finished all 4 sets
	if current_set >= ingredient_sets.size():
		finish_recipe()
		return

	# Reset ingredient index for next category
	current_index = 0

	update_display()


func finish_recipe():
	print("Recipe Complete!")
	print(chosen_ingredients)

	ingredient_label.text = "Finished!"
	category_label.text = ""
	get_tree().change_scene_to_file("res://Assets/End.tscn")


func _on_left_pressed() -> void:
	current_index -= 1

	if current_index < 0:
		current_index = ingredient_sets[current_set].size() - 1

	update_display()


func _on_right_pressed() -> void:
	current_index += 1

	if current_index >= ingredient_sets[current_set].size():
		current_index = 0

	update_display()


func _on_submit_pressed() -> void:
	var chosen = ingredient_sets[current_set][current_index]
	chosen_ingredients.append(chosen)

	current_set += 1

	if current_set >= ingredient_sets.size():
		finish_recipe()
		return

	current_index = 0
	update_display()

