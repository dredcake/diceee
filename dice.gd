extends AnimatedSprite2D

var val := 1
var is_rolling := false

func _ready():
	randomize()

func roll_dice():
	if is_rolling:
		return
		
	is_rolling = true
	print("Starting dice roll...")
	
	# Start roll sound if available
	var roll_sound = null
	if has_node("RollSound"):
		roll_sound = $RollSound
		if roll_sound.stream:
			roll_sound.play()
			print("Playing roll sound")
	
	# Spin animation - rapid frame changes
	var spin_duration = randf_range(0.9, 1.4)
	var elapsed = 0.0
	var frame_delay = randf_range(0.03, 0.08)
	
	while elapsed < spin_duration:
		# Make sure we don't exceed available frames
		var max_frame = 5 if sprite_frames and sprite_frames.get_frame_count("default") >= 6 else 0
		frame = randi_range(0, max_frame)
		
		await get_tree().create_timer(frame_delay).timeout
		elapsed += frame_delay
		frame_delay = randf_range(0.03, 0.08)  # vary the speed slightly
	
	# Final result
	val = randi_range(1, 6)
	var final_frame = val - 1
	
	# Safety check for frame count
	if sprite_frames and sprite_frames.get_frame_count("default") >= 6:
		frame = final_frame
	else:
		print("Warning: Not enough dice frames available")
		frame = 0
	
	# Stop sound
	if roll_sound and roll_sound.playing:
		roll_sound.stop()
	
	print("Dice stopped on: ", val)
	is_rolling = false

func get_val() -> int:
	return val
