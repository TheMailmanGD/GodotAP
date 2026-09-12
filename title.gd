extends Control

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Options.tscn")

func _on_button_2_pressed() -> void:
	$ColorRect.visible = true
	%Label.text = "In this game, you try to do the simple task of getting to school, while simultaniously managing your own
	physical and mental health, by choosing between options on your screen. You can see the amount of physical and mental health
	you have in the top left corner. if your physical or mental health reach 20, you win!, but if any reach 0, you lose. 
	You can also win in other ways like getting to school and other methods. Good Luck!"
