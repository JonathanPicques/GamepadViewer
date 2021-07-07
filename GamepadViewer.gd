extends Node
class_name GamepadViewer

var _window_drag_status := 0
var _window_drag_offset := Vector2()

const WINDOW_DRAG_STATUS_NONE := 0
const WINDOW_DRAG_STATUS_PRESSED := 1
const WINDOW_DRAG_STATUS_PRESSED_AND_MOVED := 2

onready var ContextMenuExitButton := $ContextMenuExitButton

# @impure
func _ready():
	# make the window transarent.
	get_tree().get_root().set_transparent_background(true)

# @impure
func _input(event: InputEvent):
	# drag the window around by selecting the content.
	if event is InputEventMouse:
		if _window_drag_status == WINDOW_DRAG_STATUS_NONE and event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
			_window_drag_status = WINDOW_DRAG_STATUS_PRESSED
			_window_drag_offset = OS.window_position - (event.global_position + OS.window_position)
		if _window_drag_status == WINDOW_DRAG_STATUS_PRESSED and event is InputEventMouseMotion:
			_window_drag_status = WINDOW_DRAG_STATUS_PRESSED_AND_MOVED
		if _window_drag_status == WINDOW_DRAG_STATUS_PRESSED_AND_MOVED and event.get_button_mask() != BUTTON_LEFT:
			_window_drag_status = WINDOW_DRAG_STATUS_NONE
	# display context menu when using right click on the window.
	if event is InputEventMouseButton and event.button_index == BUTTON_RIGHT:
		ContextMenuExitButton.rect_position = event.global_position
		match event.pressed:
			true: ContextMenuExitButton.visible = true
			false: ContextMenuExitButton.visible = false

# @impure
func _process(_delta: float):
	# drag the window around by selecting the content.
	if _window_drag_status == WINDOW_DRAG_STATUS_PRESSED_AND_MOVED:
		OS.window_position = (get_viewport().get_mouse_position() + OS.window_position) + _window_drag_offset

# @impure
func _on_context_menu_quit_button_pressed():
	get_tree().quit(0)

##
# Gamepad helpers
##

# @pure
static func get_gamepad_axis_value(device: int, axis: int, deadzone := 0.15) -> float:
	var axis_value := Input.get_joy_axis(device, axis)
	if abs(axis_value) < deadzone:
		return 0.0
	return axis_value

# @pure
static func is_gamepad_button_pressed(device: int, button_index: int) -> bool:
	return Input.is_joy_button_pressed(device, button_index)
