extends Control

const AXIS_OFFSET := 3.0
const WINDOW_DRAG_STATUS_NONE := 0
const WINDOW_DRAG_STATUS_PRESSED := 1
const WINDOW_DRAG_STATUS_PRESSED_AND_MOVED := 2

var _window_drag_status := 0
var _window_drag_offset := Vector2()

# _ready est appellé une seule fois au démarrage
func _ready():
	# enlève le fond de la fenêtre
	get_tree().get_root().set_transparent_background(true)
	# récupère la taille de l'écran pour mettre la fenêtre à droite
	var screen_size := OS.get_screen_size(OS.get_current_screen())
	OS.set_window_position(Vector2(screen_size.x - 512, screen_size.y / 2 - 288))

# _input est appellé chaque fois qu'un input (souris / clavier ou manette)
func _input(event: InputEvent):
	# options
	$Skin_Gamepad/K_Share.visible = Input.is_action_pressed("ps_share")
	$Skin_Gamepad/K_Options.visible = Input.is_action_pressed("ps_options")
	# boutons
	$Skin_Gamepad/K_Cross.visible = Input.is_action_pressed("ps_cross")
	$Skin_Gamepad/K_Circle.visible = Input.is_action_pressed("ps_circle")
	$Skin_Gamepad/K_Square.visible = Input.is_action_pressed("ps_square")
	$Skin_Gamepad/K_Triangle.visible = Input.is_action_pressed("ps_triangle")
	# gachettes
	$Skin_Gamepad/K_L1.visible = Input.is_action_pressed("ps_l1")
	$Skin_Gamepad/K_L2.visible = Input.is_action_pressed("ps_l2")
	$Skin_Gamepad/K_R1.visible = Input.is_action_pressed("ps_r1")
	$Skin_Gamepad/K_R2.visible = Input.is_action_pressed("ps_r2")
	# pad directionnel
	$Skin_Gamepad/K_Up.visible = Input.is_action_pressed("ps_dpad_up")
	$Skin_Gamepad/K_Down.visible = Input.is_action_pressed("ps_dpad_down")
	$Skin_Gamepad/K_Left.visible = Input.is_action_pressed("ps_dpad_left")
	$Skin_Gamepad/K_Right.visible = Input.is_action_pressed("ps_dpad_right")
	# valeur des axes
	$Skin_Gamepad/Axis_Left.offset = AXIS_OFFSET * Vector2(Input.get_joy_axis(0, JOY_ANALOG_LX), Input.get_joy_axis(0, JOY_ANALOG_LY))
	$Skin_Gamepad/Axis_Right.offset = AXIS_OFFSET * Vector2(Input.get_joy_axis(0, JOY_ANALOG_RX), Input.get_joy_axis(0, JOY_ANALOG_RY))
	# bouger la fenêtre avec la souris
	if event.is_class("InputEventMouse"):
		if _window_drag_status == WINDOW_DRAG_STATUS_NONE and event.is_class("InputEventMouseButton") and event.button_index == BUTTON_LEFT and event.pressed:
			_window_drag_status = WINDOW_DRAG_STATUS_PRESSED
			_window_drag_offset = OS.window_position - (event.global_position + OS.window_position)
		if _window_drag_status == WINDOW_DRAG_STATUS_PRESSED and event.is_class("InputEventMouseMotion"):
			_window_drag_status = WINDOW_DRAG_STATUS_PRESSED_AND_MOVED
		if _window_drag_status == WINDOW_DRAG_STATUS_PRESSED_AND_MOVED and event.get_button_mask() != BUTTON_LEFT:
			_window_drag_status = WINDOW_DRAG_STATUS_NONE

# _process est appellé en boucle tant que l'app tourne
# on déplace la fenêtre si le bouton gauche de la souris est enfoncé
func _process(_delta: float):
	if _window_drag_status == WINDOW_DRAG_STATUS_PRESSED_AND_MOVED:
		OS.window_position = (get_viewport().get_mouse_position() + OS.window_position) + _window_drag_offset

# on quitte l'app si on clique sur la croix
func _on_quit_button_pressed():
	get_tree().quit(0)
