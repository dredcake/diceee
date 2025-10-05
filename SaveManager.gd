extends Node

const SAVE_FILE = "user://balance.save"

func save_money(amount: int):
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	if file:
		var save_data = {
			"money": amount,
			"timestamp": Time.get_unix_time_from_system()
		}
		file.store_string(JSON.stringify(save_data))
		file.close()
		print("Money saved: ", amount)
	else:
		print("Failed to save money")

func load_money() -> int:
	if not FileAccess.file_exists(SAVE_FILE):
		print("No save file found, starting with default money")
		return 100
		
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	if file:
		var json_text = file.get_as_text()
		file.close()
		
		var json = JSON.new()
		var parse_result = json.parse(json_text)
		
		if parse_result == OK and json.data.has("money"):
			var loaded_money = json.data["money"]
			print("Money loaded: ", loaded_money)
			return loaded_money
		else:
			print("Save file corrupted, using default")
			return 100
	else:
		print("Failed to open save file")
		return 100