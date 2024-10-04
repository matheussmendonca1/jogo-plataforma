extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$Animacao.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	setAnimation()
	setCamera()
	move_and_slide()
	
	
func setAnimation():
	var anim = "idle"
	if(velocity.x != 0 and is_on_floor()):
		anim = "run"
	if(!is_on_floor()):
		anim = "jump"
	$Animacao.animation = anim
	
func setCamera():
	if $"/root/Global".fase == 1:
		$Camera1.enabled = true
		$Camera2.enabled = false
	if $"/root/Global".fase == 2:
		$Camera1.enabled = false
		$Camera2.enabled = true
