#extends CanvasLayer
#
#var mentalhealth: int = 50
#var physicalhealth: int = 50
#var choice: int = 1
#
#func _process(delta: float) -> void:
	#
	#if choice == 1:
		#%Label.text = "You wake up, and feel a bit tired"
		#%Option1.text = "Go back to sleep"
		#%Option2.text = "Smash your alarm clock"
		#%Option3.text = "Get on your phone"
		#%Option4.text = "Get up"
	#if choice == 2:
		#%Option1.text = "Get up"
		#%Option2.text = "Go back to sleep"
		#%Option3.visible = false
		#%Option4.visible = false
	#if choice == 3:
		#%Option1.text = "Go back to sleep"
		#%Option2.visible = false
	#if choice == 4:
		#%Option1.text = "Eat breakfast"
		#%Option2.text = "Go back to sleep"
		#%Option3.text = "Jump out a window"
		#%Option4.text = "Decide to quit school"
#
#func _physics_process(delta: float) -> void:
	#if choice == 1 or choice == 4:
		#%Option1.visible = true
		#%Option2.visible = true
		#%Option3.visible = true
		#%Option4.visible = true
#
#
#func _on_option_1_pressed() -> void:
	#if choice == 4:
		#%Label.text = "You eat breakfast"
		#physicalhealth += 3
		#mentalhealth += 1
		#choice = 0
		##ending sleepmania
	#if choice == 3:
		#%Label.text = "You go back to sleep, and never wake up again"
		#mentalhealth = 1
		#physicalhealth = 99
	#if choice == 2:
		#%Label.text = "You get up"
		#choice = 4
		#mentalhealth -= 5
	#if choice == 1:
		#%Label.text = "You go back to sleep\nYour parents call you up"
		#mentalhealth -= 2
		#physicalhealth += 1
		#choice = 2
	#
#
#
#func _on_option_2_pressed() -> void:
	#if choice == 1:
		#%Label.text = "You Smash your alarm clock and feel better,\nbut your hand hurts."
		#mentalhealth += 2
		#physicalhealth -= 5
		#await get_tree().create_timer(1.0).timeout
	#if choice == 2:
		#%Label.text = "You go back to sleep, and you miss school"
		#choice = 3
#
#
#func _on_option_3_pressed() -> void:
	#if choice == 1:
		#%Label.text = "You get your phone taken away"
		#mentalhealth -= 7
		#await get_tree().create_timer(1.0).timeout
		#
#
#func _on_option_4_pressed() -> void:
	#if choice == 1:
		#%Label.text = "You get up"
		#choice = 4
#
		#
