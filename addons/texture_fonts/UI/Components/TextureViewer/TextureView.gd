@tool
extends TextureRect


var hovering := false
var texture_font_mapping: TextureFont.Mapping


@onready var rect_preview: ColorRect = $RectPreview
@onready var label: Label = $RectPreview/Label


func _on_TextureView_mouse_entered():
	hovering = true
	rect_preview.visible = true
	

func _on_TextureView_mouse_exited():
	hovering = false
	rect_preview.visible = false

func _gui_input(event):
	if hovering and event is InputEventMouseMotion:
		var c := texture_font_mapping.get_char_at_position(event.position)
		if c == "":
			rect_preview.visible = false
			return
		else:
			label.text = c
			var rect := texture_font_mapping.get_rect_for_position(event.position)
			rect_preview.position = rect.position
			rect_preview.size = rect.size
			rect_preview.visible = true
