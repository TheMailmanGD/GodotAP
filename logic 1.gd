extends CanvasLayer

var choice: int = 1

func _ready() -> void:
	%Label.text = "You wake up, and feel a bit tired"
	%Images.texture = load("res://sleeping.jpg")
	await get_tree().create_timer(1.0).timeout
	%Images.texture = load("res://wake up.jpg")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		#test send location
		pass
	%Mentalhealth.text = "Mental Health: " + str(Global.mentalhealth)
	%ProgressBar.value = int(Global.mentalhealth)
	%Physicalhealth.text = "Physical Health: " + str(Global.physicalhealth)
	%ProgressBar2.value = int(Global.physicalhealth)
	if choice == 1:#start
		%Option1.text = "Go back to sleep"
		%Option2.text = "Smash your alarm clock"
		%Option3.text = "Get on your phone"
		%Option4.text = "Get up"
	if choice == 2:#"Go back to sleep"
		%Option1.text = "Get up"
		%Option2.text = "Go back to sleep"
		%Option3.visible = false
		%Option4.visible = false
	if choice == 3:#"Go back to sleep"
		%Option1.text = "Go back to sleep"
		%Option2.visible = false
		%Option3.visible = false
		%Option4.visible = false
	if choice == 4:#"get up"
		%Option1.text = "Eat breakfast"
		%Option2.text = "Go back to sleep"
		%Option3.text = "Jump out a window"
		%Option4.text = "Decide to quit school"
	if choice == 5:#Eat Breakfast
		%Option1.text = "Walk to school"
		%Option2.text = "Stay at home"
		%Option3.text = "Go back to sleep"
		%Option4.text = "Take the bus"
	if choice == 6:#Stay at home
		%Option1.text = "Say you forgot"
		%Option2.text = "Look confused"
		%Option3.text = "Decide to quit school"
		%Option4.text = "Go back to sleep"
	if choice == 7:#Walk to school
		%Option1.text = "Walk"
		%Option2.text = "Sprint"
		%Option3.text = "Go back home"
		%Option4.text = "Take the bus"
	if choice == 8:#Take the bus
		%Option1.text = "Get off the bus and\nWalk to school"
		%Option2.text = "Go back to bed"
		%Option3.text = "Sleep on bus"
		%Option4.text = "Check for activities"
	if choice == 9:#Walk
		%Option1.text = "Keep going"
		%Option2.text = "Take shortcut"
		%Option3.visible = false
		%Option4.visible = false
	if Global.ending != "":
		get_tree().change_scene_to_file("res://ending.tscn")
	if Global.physicalhealth >= 20 or Global.physicalhealth <= 0 or Global.mentalhealth >= 20 or Global.mentalhealth <= 0:
		get_tree().change_scene_to_file("res://ending.tscn")
func _physics_process(_delta: float) -> void:
	if choice == 1 or choice == 4:
		%Option1.visible = true
		%Option2.visible = true
		%Option3.visible = true
		%Option4.visible = true

func _on_option_1_pressed() -> void:
	if choice == 1:
		%Images.texture = load("res://sleeping.jpg")
		%Label.text = "You go back to sleep\nYour parents call you up"
		Global.mentalhealth -= 2
		Global.physicalhealth += 1
		choice = 2
		await get_tree().create_timer(1.0).timeout
		%Images.texture = load("res://wake up.jpg")
	elif choice == 2:
		%Label.text = "You get up"
		%Images.texture = load("res://walk indoors.jpg")
		choice = 4
		Global.mentalhealth -= 5
	elif choice == 3:
		%Label.text = "You go back to sleep, and never wake up \nagain"
		%Images.texture = load("res://sleeping.jpg")
		$AnimationPlayer.play("red")
		await get_tree().create_timer(2.0).timeout
		Global.ending = "sleepmania"
	elif choice == 4:
		%Label.text = "You eat breakfast"
		%Images.texture = load("res://eat breakfast.jpg")
		Global.physicalhealth += 3
		Global.mentalhealth += 1
		choice = 5
	elif choice == 5:
		%Label.text = "How are you going to get to school?"
		choice = 7
		%Images.texture = load("res://exit house.jpg")
	elif choice == 6:
		%Label.text = "So you forgot..."
		%Images.texture = load("res://parents confused.jpg")
		Global.mentalhealth -= 5
		await get_tree().create_timer(3.0).timeout
		%Label.text = "Well, so now you remember..."
		choice = 5
	elif choice == 7:
		%Label.text = "You decide to walk"
		Global.mentalhealth += 2
		Global.physicalhealth += 1
		choice = 9
		%Images.texture = load("res://walk outside.jpg")
	elif choice == 8:
		%Label.text = "How are you going to get to school?"
		choice = 7
		%Images.texture = load("res://exit house.jpg")
	elif choice == 9:
		%Label.text = "You keep going"
		Global.mentalhealth += 1
		Global.physicalhealth -= 1
		await get_tree().create_timer(1.0).timeout
		Global.ending = "school"

func _on_option_2_pressed() -> void:
	if choice == 1:
		%Images.texture = load("res://smash alarm clock.jpg")
		%Label.text = "You smash your alarm clock and feel better,\nbut your hand hurts."
		Global.mentalhealth += 2
		Global.physicalhealth -= 5
		await get_tree().create_timer(3.0).timeout
		%Label.text = "You wake up, and feel a bit tired"
		%Images.texture = load("res://wake up.jpg")
	elif choice == 2:
		%Label.text = "You go back to sleep, and you miss school"
		%Images.texture = load("res://sleeping.jpg")
		choice = 3
		await get_tree().create_timer(1.0).timeout
		%Images.texture = load("res://wake up.jpg")
	elif choice == 4:
		%Label.text = "You go back to sleep\nYour parents call you up"
		%Images.texture = load("res://sleeping.jpg")
		choice = 3
		await get_tree().create_timer(1.0).timeout
		%Images.texture = load("res://wake up.jpg")
	elif choice == 5:
		%Label.text = "Your parents ask you why"
		choice = 6
		%Images.texture = load("res://parents confused.jpg")
	elif choice == 6:
		%Label.text = "You look confused"
		await get_tree().create_timer(3.0).timeout
		%Label.text = "Your parents ask you why"
	elif choice == 7:
		%Label.text = "You sprint to school"
		%Images.texture = load("res://walk outside.jpg")
		await get_tree().create_timer(1.0).timeout
		Global.ending = "school"
	elif choice == 8:
		%Images.texture = load("res://sleeping.jpg")
		%Label.text = "You go back to sleep, and you miss school"
		choice = 3
		await get_tree().create_timer(1.0).timeout
		%Images.texture = load("res://wake up.jpg")
	elif choice == 9:
		%Label.text = "You take the shortcut"
		Global.mentalhealth += 1
		Global.physicalhealth += 1
		await get_tree().create_timer(1.0).timeout
		Global.ending = "school"

func _on_option_3_pressed() -> void:
	if choice == 1:
		%Images.texture = load("res://reach for phone.jpg")
		%Label.text = "You get your phone taken away"
		Global.mentalhealth -= 7
		await get_tree().create_timer(3.0).timeout
		%Label.text = "You wake up, and feel a bit tired"
		%Images.texture = load("res://wake up.jpg")
	elif choice == 4:
		%Images.texture = load("res://looking out of window.jpg")
		await get_tree().create_timer(1.0).timeout
		%Images.texture = load("res://out of window.jpg")
		await get_tree().create_timer(1.0).timeout
		%Images.texture = load("res://fall.jpg")
		%Label.text = "You feel better, but you fell badly"
		Global.mentalhealth += 10
		Global.physicalhealth -= 10
		await get_tree().create_timer(2.0).timeout
		%Images.texture = load("res://enter house.jpg")
		%Label.text = "You reenter the house"
	elif choice == 5:
		%Images.texture = load("res://sleeping.jpg")
		%Label.text = "You go back to sleep\nYour parents call you up"
		choice = 3
		await get_tree().create_timer(1.0).timeout
		%Images.texture = load("res://wake up.jpg")
	elif choice == 6:
		%Images.texture = load("res://sad.jpg")
		%Label.text = "Isolated from your friends\nYou are depressed\nYou have stopped doing sports as well"
		await get_tree().create_timer(3.0).timeout
		Global.ending = "quitter"
	elif choice == 7:
		%Images.texture = load("res://parents confused.jpg")
		%Label.text = "Your parents ask you why"
		choice = 6
	elif choice == 8:
		%Images.texture = load("res://sleep bus.jpg")
		%Label.text = "You wake up just as the bus arrives at school"
		await get_tree().create_timer(1.0).timeout
		Global.ending = "school"

func _on_option_4_pressed() -> void:
	if choice == 1:
		%Label.text = "You get up"
		choice = 4
		%Images.texture = load("res://walk indoors.jpg")
	elif choice == 4:
		%Images.texture = load("res://sad.jpg")
		%Label.text = "Isolated from your friends\nYou are depressed\nYou have stopped doing sports as well"
		await get_tree().create_timer(3.0).timeout
		Global.ending = "quitter"
	elif choice == 5:
		%Images.texture = load("res://bussin'.jpg")
		%Label.text = "You take the bus"
		choice = 8
	elif choice == 6:
		%Images.texture = load("res://sleeping.jpg")
		%Label.text = "You go back to sleep, and you miss school"
		choice = 3
		await get_tree().create_timer(1.0).timeout
		%Images.texture = load("res://wake up.jpg")
	elif choice == 7:
		%Images.texture = load("res://bussin'.jpg")
		%Label.text = "You take the bus"
		choice = 8
