@tool
extends Container

var texture: Texture2D

func set_texture(tex: Texture2D):
	texture = tex
	self.offset = Vector2.ZERO


@export var offset := Vector2.ZERO: get = get_offset_, set = set_offset_
func set_offset_(new_offset: Vector2):
	if not texture:
		return
	
	var rect := self.get_rect()
	var t_size = texture.get_size()
	var child: Control = get_children().front()
	var scale = child.scale
	
	var total_bounds = (rect.size + t_size * scale) / 2.0
	
	const MARGIN := 8.0
	offset.x = clamp(new_offset.x, -total_bounds.x + MARGIN, total_bounds.x - MARGIN)
	offset.y = clamp(new_offset.y, -total_bounds.y + MARGIN, total_bounds.y - MARGIN)
	rect.position += offset
	
	fit_child_in_rect(get_children().front(), rect)
	child.scale = scale
func get_offset_() -> Vector2:
	return offset


func _on_TextureContainer_resized():
	set_offset_(offset)
