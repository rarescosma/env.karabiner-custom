CONFIG_DIR?=$(HOME)/.config/karabiner/assets/complex_modifications

default:
	jsonnet -- ./jsonnet/custom_shortcuts.jsonnet > $(CONFIG_DIR)/custom_shortcuts.json

