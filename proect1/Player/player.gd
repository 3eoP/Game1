extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D  # Подключаем анимацию

var speed : float = 50.0  # Скорость движения

func _process(_delta):
	velocity = Vector2.ZERO  # Обнуляем скорость

	# Получаем ввод
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	# Нормализация скорости
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		if animated_sprite.animation != "Walk":
			play_animation("Walk")  # Анимация движения

		# Поворачиваем персонажа в направлении движения
		if velocity.x > 0:
			# Двигаемся вправо, ставим положительный scale.x
			animated_sprite.scale.x = 1
		elif velocity.x < 0:
			# Двигаемся влево, ставим отрицательный scale.x
			animated_sprite.scale.x = -1
	else:
		if animated_sprite.animation != "idle":
			play_animation("idle")  # Анимация бездействия

	# Применяем движение
	move_and_slide()

# Функция смены анимации (чтобы избежать повторного воспроизведения)
func play_animation(anim_name):
	animated_sprite.play(anim_name)
