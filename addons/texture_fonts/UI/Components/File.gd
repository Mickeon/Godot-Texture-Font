@tool
extends MarginContainer

signal file_removed(itself)
signal file_changed(itself)

@onready var name_label := $MarginContainer/HBoxContainer/ClipLabel/Label
@onready var preview := $MarginContainer/HBoxContainer/ImageContainer/TexturePreview
@onready var panel := $Panel

var texture: Texture2D
@onready var selected := false: get = get_selected, set = set_selected
var _selected: bool
func set_selected(new_selected: bool):
	_selected = new_selected
	
	if not is_inside_tree():
		return
	
	var stylebox: StyleBoxFlat = panel.get("theme_override_styles/panel")
	
	if new_selected:
		stylebox.bg_color.a = 0.2
		stylebox.border_color.a = 0.2
	else:
		stylebox.bg_color.a = 0.0
		stylebox.border_color.a = 0.0
func get_selected() -> bool:
	return _selected

func set_texture(new_texture: Texture2D):
	if is_inside_tree():
		name_label.text = new_texture.resource_path
		preview.texture = new_texture
	texture = new_texture


func _on_DeleteButton_pressed():
	emit_signal("file_removed", self)
	queue_free()


func _on_ToolButton_pressed():
	emit_signal("file_changed", self)
	self.selected = true
