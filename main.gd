extends Node2D

var money := 100
var is_spinning := false
var save_manager

@onready var dice_anim = $AnimatedSprite2D
@onready var spinBtn = $TextureButton
@onready var coin_label = get_coin_label()

func _ready():
	randomize()
	print("Game starting...")
	
	# Try to load SaveManager
	var save_script = load("res://SaveManager.gd")
	if save_script:
		save_manager = save_script.new()
		money = save_manager.load_money()
		print("SaveManager loaded")
	else:
		print("SaveManager not found, using defaults")
	
	update_coin_display()
	
	# Always connect the button (the scene connection should work, but let's be sure)
	print("Connecting spin button...")
	if spinBtn:
		spinBtn.pressed.connect(on_spin_pressed)
		print("Button connected successfully")
		print("Button disabled state: ", spinBtn.disabled)
	else:
		print("ERROR: Spin button not found!")

func get_coin_label():
	# Try primary name first, then fallback
	var label = $Sprite2D/coinLabel if has_node("Sprite2D/coinLabel") else null
	if not label and has_node("Sprite2D/coinLabel1"):
		label = $Sprite2D/coinLabel1
	
	if not label:
		print("coin label not found - continuing without display")
	
	return label

func on_spin_pressed():
	if is_spinning:
		return
	
	# Check if player has enough money to roll
	if money < 5:
		print("Not enough money to roll! Need 5 coins")
		flash_label_color(Color.RED)
		return
		
	print("Spin pressed")
	is_spinning = true
	spinBtn.disabled = true
	
	# Charge 5 coins for the roll
	money -= 5
	print("Paid 5 coins to roll. Balance: ", money)
	update_coin_display()
	
	# Roll the dice and wait for it to finish
	dice_anim.roll_dice()
	await get_tree().create_timer(1.6).timeout  # slightly longer than max dice roll time
	
	var rolled_val = dice_anim.get_val()
	print("Rolled: ", rolled_val)
	
	# Apply winnings (no more losses since we already paid to roll)
	if rolled_val >= 4:
		money += 15  # Win 15 coins (net +10 after paying 5 to roll)
		flash_label_color(Color.GREEN)
		print("Win! +15 coins (net +10)")
	else:
		# No additional loss - we already paid 5 to roll
		flash_label_color(Color.RED)
		print("Loss! No additional coins (already paid 5 to roll)")
	
	print("money now: ", money)
	update_coin_display()
	
	# Save money if save system exists
	if save_manager:
		save_manager.save_money(money)
	
	# Re-enable button
	spinBtn.disabled = false
	is_spinning = false

func update_coin_display():
	if coin_label:
		coin_label.text = str(money)

func flash_label_color(flash_color: Color):
	if not coin_label:
		return
		
	var original_color = coin_label.modulate
	coin_label.modulate = flash_color
	
	# Flash for 0.3 seconds
	await get_tree().create_timer(0.3).timeout
	coin_label.modulate = original_color

# Placeholder save/load methods - will be overridden if SaveManager is present
func save_money(amount: int):
	pass

func load_money() -> int:
	return 100
