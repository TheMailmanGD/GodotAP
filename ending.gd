extends CanvasLayer

func _process(delta: float) -> void:
	if Global.mentalhealth <= 0:
		%Ending.text = "Your mental health was too low"
		%WinLose.text = "You Lost!"
		%Mentalhealth.text = "Mental Health: " + str(Global.mentalhealth)
		%Physicalhealth.text = "Physical Health: " + str(Global.physicalhealth)
	if Global.mentalhealth >= 20:
		%Ending.text = "You have very good mental health!"
		%WinLose.text = "You Won!"
		%Mentalhealth.text = "Mental Health: " + str(Global.mentalhealth)
		%Physicalhealth.text = "Physical Health: " + str(Global.physicalhealth)
	if Global.physicalhealth <= 0:
		%Ending.text = "Your physical health was too low"
		%WinLose.text = "You Lost!"
		%Mentalhealth.text = "Mental Health: " + str(Global.mentalhealth)
		%Physicalhealth.text = "Physical Health: " + str(Global.physicalhealth)
	if Global.physicalhealth >= 20:
		%Ending.text = "You have very good mental health!"
		%WinLose.text = "You Won!"
		%Mentalhealth.text = "Mental Health: " + str(Global.mentalhealth)
		%Physicalhealth.text = "Physical Health: " + str(Global.physicalhealth)
	if Global.ending == "sleepmania":
		%Ending.text = "You slept forever..."
		%WinLose.text = "You Lost!"
		%Mentalhealth.text = "Mental Health: " + str(Global.mentalhealth)
		%Physicalhealth.text = "Physical Health: " + str(Global.physicalhealth)
	if Global.ending == "quitter":
		%Ending.text = "You quit school"
		%WinLose.text = "You Lost!"
		%Mentalhealth.text = "Mental Health: " + str(Global.mentalhealth)
		%Physicalhealth.text = "Physical Health: " + str(Global.physicalhealth)
	if Global.ending == "school":
		%Ending.text = "You got to school"
		%WinLose.text = "You Won!"
		%Mentalhealth.text = "Mental Health: " + str(Global.mentalhealth)
		%Physicalhealth.text = "Physical Health: " + str(Global.physicalhealth)
		Archipelago.set_client_status(Archipelago.ClientStatus.CLIENT_GOAL)



func _on_retry_pressed() -> void:
	Global.mentalhealth = 10
	Global.physicalhealth = 10
	Global.ending = ""
	get_tree().change_scene_to_file("res://Options.tscn")
