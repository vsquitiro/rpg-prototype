class_name PartyHexes extends Menu

func toggle_hex_active(i: int, active: bool):
	var hexes = get_buttons()
	print('hexes:', hexes)
	hexes[i].texture_normal = ResourceLoader.load("res://Battle/Art/Layout/hex_party_active.png" if active else "res://Battle/Art/Layout/hex_party.png")
