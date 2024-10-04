extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0
var direction = -1



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	if direction:
		velocity.x = direction * SPEED

	if $Direcao.is_colliding():
		direction *= -1
		self.scale.x *= -1


	move_and_slide()
