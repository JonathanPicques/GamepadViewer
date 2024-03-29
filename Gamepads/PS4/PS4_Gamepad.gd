extends Node2D

const AXIS_MAGNITUDE := 7.0

onready var GamepadViewer: GamepadViewerNode = get_parent()

onready var Axis_Left := $Gamepad/Axis_Left
onready var Axis_Right := $Gamepad/Axis_Right

onready var Dpad_Up := $Gamepad/Dpad_Up
onready var Dpad_Down := $Gamepad/Dpad_Down
onready var Dpad_Left := $Gamepad/Dpad_Left
onready var Dpad_Right := $Gamepad/Dpad_Right

onready var Button_Circle := $Gamepad/Button_Circle
onready var Button_Cross := $Gamepad/Button_Cross
onready var Button_Square := $Gamepad/Button_Square
onready var Button_Triangle := $Gamepad/Button_Triangle
onready var Button_Share := $Gamepad/Button_Share
onready var Button_Options := $Gamepad/Button_Options

onready var Trigger_L1 := $Gamepad/Trigger_L1
onready var Trigger_L2 := $Gamepad/Trigger_L2
onready var Trigger_R1 := $Gamepad/Trigger_R1
onready var Trigger_R2 := $Gamepad/Trigger_R2

# @impure
func _input(_event: InputEvent):
	# dpad
	Dpad_Up.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_DPAD_UP)
	Dpad_Down.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_DPAD_DOWN)
	Dpad_Left.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_DPAD_LEFT)
	Dpad_Right.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_DPAD_RIGHT)
	# buttons
	Button_Cross.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_XBOX_A)
	Button_Share.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_SELECT)
	Button_Circle.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_XBOX_B)
	Button_Square.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_XBOX_X)
	Button_Options.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_START)
	Button_Triangle.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_XBOX_Y)
	# triggers
	Trigger_L1.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_L)
	Trigger_L2.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_L2)
	Trigger_R1.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_R)
	Trigger_R2.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_R2)
	# axis values
	Axis_Left.offset = AXIS_MAGNITUDE * Vector2(GamepadViewer.get_gamepad_axis_value(GamepadViewer.gamepad_device, JOY_ANALOG_LX), GamepadViewer.get_gamepad_axis_value(GamepadViewer.gamepad_device, JOY_ANALOG_LY))
	Axis_Right.offset = AXIS_MAGNITUDE * Vector2(GamepadViewer.get_gamepad_axis_value(GamepadViewer.gamepad_device, JOY_ANALOG_RX), GamepadViewer.get_gamepad_axis_value(GamepadViewer.gamepad_device, JOY_ANALOG_RY))
