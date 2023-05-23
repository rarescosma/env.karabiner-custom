CONFIG_DIR?=$(HOME)/.config/karabiner/assets/complex_modifications

default:
	jsonnet -- ./jsonnet/minimal.jsonnet > $(CONFIG_DIR)/custom_shortcuts.json

