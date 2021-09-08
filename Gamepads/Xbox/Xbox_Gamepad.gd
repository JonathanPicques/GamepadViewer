extends Node2D

const AXIS_MAGNITUDE := 7.0

onready var GamepadViewer: GamepadViewerNode = get_parent()

onready var Axis_Left := $Gamepad/Axis_Left
onready var Axis_Right := $Gamepad/Axis_Right

onready var Dpad_Up := $Gamepad/Dpad_Up
onready var Dpad_Down := $Gamepad/Dpad_Down
onready var Dpad_Left := $Gamepad/Dpad_Left
onready var Dpad_Right := $Gamepad/Dpad_Right

onready var Button_A := $Gamepad/Button_A
onready var Button_B := $Gamepad/Button_B
onready var Button_X := $Gamepad/Button_X
onready var Button_Y := $Gamepad/Button_Y
onready var Button_Start := $Gamepad/Button_Start
onready var Button_Select := $Gamepad/Button_Select

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
	Button_A.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_XBOX_A)
	Button_B.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_XBOX_B)
	Button_X.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_XBOX_X)
	Button_Y.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_XBOX_Y)
	Button_Start.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_START)
	Button_Select.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_SELECT)
	# triggers
	Trigger_L1.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_L)
	Trigger_L2.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_L2)
	Trigger_R1.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_R)
	Trigger_R2.visible = GamepadViewer.is_gamepad_button_pressed(GamepadViewer.gamepad_device, JOY_R2)
	# axis values
	Axis_Left.offset = AXIS_MAGNITUDE * Vector2(GamepadViewer.get_gamepad_axis_value(GamepadViewer.gamepad_device, JOY_ANALOG_LX), GamepadViewer.get_gamepad_axis_value(GamepadViewer.gamepad_device, JOY_ANALOG_LY))
	Axis_Right.offset = AXIS_MAGNITUDE * Vector2(GamepadViewer.get_gamepad_axis_value(GamepadViewer.gamepad_device, JOY_ANALOG_RX), GamepadViewer.get_gamepad_axis_value(GamepadViewer.gamepad_device, JOY_ANALOG_RY))
