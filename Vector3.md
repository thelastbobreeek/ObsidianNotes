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