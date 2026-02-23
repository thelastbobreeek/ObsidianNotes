`Vector3` - [[Структура|структура]] в [[Unity]], которая хранит три числа типа `float`:
```cs
public float x;
public float y;
public float z;
```
То есть это точка или направление в 3D-пространстве.
Если совсем просто, то `Vector3` это способ описать позицию, направление или смещение в трехмерном мире.
- - - 
## Использование
`Vector3` используется повсеместно в Unity, где есть 3D:
- Позиция объекта - `Vector3`
  ```cs
  Vector3 position = transform.position;
  ```
- Направление движения:
  ```cs
  Vector3 direction = Vector3.forward;
  ```
- Оно используется для:
	- Движения
	- Поворотов
	- Лучей(`Raycast`)
	- Физики
- Масштаб - тоже `Vector3`
  ```cs
  transform.localScale
  ```
-  Физика(`Rigidbody`)
	  ```cs
rigidbody.velocity
rigidbody.AddForce(Vector3.up);
	  ```
## Возможности `Vector3`
`Vector3` - это не просто контейнер из трех чисел.
`Vector3` даёт возможность:
- Складывать вектора
- Вычитать
- Умножать на число
- Находить длину
- Нормализовать
- Найти расстояние
- Найти направление
Например, 
```cs
Vector3 direction = target.position - transform.position;
```
получается вектор направления к цели, очень удобно.
### Готовые значения
Unity уже дает готовые направления:
```cs
Vector3.zero      // (0, 0, 0)
Vector3.one       // (1, 1, 1)
Vector3.up        // (0, 1, 0)
Vector3.down      // (0, -1, 0)
Vector3.left      // (-1, 0, 0)
Vector3.right     // (1, 0, 0)
Vector3.forward   // (0, 0, 1)
Vector3.back      // (0, 0, -1)
```
- - -
## `Vector3` - структура
`Vector3` - структура, это не [[Класс|класс]].
Это значит, что:
- значения хранятся в [[Стэк и куча|стэке]]
- передаётся по значению
- не создаёт лишних аллокаций
Для геймдева это важно по производительности.
- - -
## Методы `Vector3` 
`Vector3` имеет множество вспомогательных методов для упрощения работы в Unity.
1. `Distance` - возвращает расстояние между двумя точками:
   ```cs
   float distance = Vector3.Distance(a, b);
   ```
   >[!warning] Внутри считается квадратный корень - не самая дешевая операция. Если будет вызываться часто, лучше использовать `sqrMagnitude`
2. `magnitude` - длина вектора (с корнем)
   ```cs
   float length = vector.magnitude;
   ```
  `sqrMagnitude` - квадрат длины (без корня - быстрее)
	  ```cs
	float sqrLength = vector.sqrMagnitude;
	  ``` 
	`magnitude` и `Distance` оба считают корень из длины, разница лишь в удобстве синтаксиса в разных случаях. Для частых вычислений следует использовать `sqrMagnitude`:
	```cs
	pos.sqrMagnitude < pos2.sqrMagnitude
	```
	Однако это рассчитывает, какой из векторов ближе к точке (0,0,0). Для расстояния между двумя позициями следует написать так:
	```cs
	Vector3 direction = pos1 - pos2;
if (direction.sqrMagnitude < _range * _range)
{
}
	```

3. `Normalize` и `normalized` - делают длину вектора равной 1, сохраняя направление:
   ```cs
   vector.Normalize();
Vector3 normalized = vector.normalized;
   ```
   `Normalize()` изменяет текущий вектор.
   `normalized` возвращает новый вектор.
   
   Если не нормализовать вектор, то, например, при движении будет неправильная скорость:
   ```cs
   Vector3 direction = target.position - transform.position;
transform.position += direction * _speed * Time.deltaTime;
   ``` 
   Чем дальше цель - тем больше `direction`,
   Чем больше `direction` - тем быстрее объект летит.
   Это неправильно.
   
   Правильно нормализовать `direction` и использовать только его:
   ```cs
   Vector3 direction = target.position - transform.position;
Vector3 normalizedDirection = direction.normalized;
transform.position += normalizedDirection * _speed * Time.deltaTime;
   ```
   Теперь, направление сохраняется, а скорость передвижения регулируется только `_speed`.
3. `Dot`(скалярное произведение) - считает, в какие стороны смотрят объекты относительно друг друга:
	```cs
	float dot = Vector3.Dot(a, b);
	```
	Если выдает >0 -> смотрят примерно в одну сторону
	Если <0 -> в разные стороны
	Если = 0 -> смотрят перпендикулярно
	Используется для проверки:
	- смотрит ли объект на цель
	- угла обзора врага
	- проверка направления удара