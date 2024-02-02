@tool
extends HBoxContainer


signal changed
signal delete_requested

@onready var fromLine: LineEdit = $LineEditFrom
@onready var toLine: LineEdit = $LineEditTo
@onready var offsetLine: SpinBox = $SpinBoxOffset

var font_settings: TextureFont.Settings


@onready var idx := get_index()


# The passed Dictionary holds info about a kerning pair:
# {
# 	from: String,
# 	to: String,
# 	kerning: float
# }
func set_kerning_pair(new_kerning: Dictionary):
	if not is_node_ready(): await ready
	
	fromLine.text = new_kerning.from
	toLine.text = new_kerning.to
	offsetLine.value = new_kerning.kerning


func _on_LineEditFrom_text_changed(new_text: String):
	font_settings.set_kerning_pair_from(idx, new_text)
	emit_signal("changed")

func _on_LineEditTo_text_changed(new_text: String):
	font_settings.set_kerning_pair_to(idx, new_text)
	emit_signal("changed")

func _on_SpinBoxOffset_value_changed(value: float):
	font_settings.set_kerning_pair_kerning(idx, value)
	emit_signal("changed")

func _on_DeleteButton_pressed():
	emit_signal("delete_requested")
