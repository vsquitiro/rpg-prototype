class_name PartyHexes extends Menu

func toggle_hex_active(i: int, active: bool):
	var hexes = get_buttons()
	hexes[i].toggle_hex_active(active)
