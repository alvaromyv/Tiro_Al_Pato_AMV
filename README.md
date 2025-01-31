# 🎯 Proyecto GODOT: Tiro Al Pato

![image](https://github.com/user-attachments/assets/0b5f1758-4939-49b6-956f-c428fd5cf498)

## 📌 Introducción
"Tiro Al Pato" es un videojuego desarrollado en Godot basado en la clásica atracción de feria de "Tiro al Plato" o "Tiro al Blanco". El objetivo es conseguir la máxima puntuación dentro del tiempo disponible, derribando la mayor cantidad de objetivos posible.

## 🚀 Funcionamiento
- Durante un tiempo determinado, se generan objetivos que se desplazan de izquierda a derecha.
- Los jugadores deben derribar estos objetivos para ganar puntos.
- Al finalizar el tiempo, se muestra una pantalla con la puntuación final y opciones para reiniciar o volver al menú principal.

## 🎮 Mecánicas de Juego
### 🎯 Object Pooling
- Se generan un número predefinido de objetivos al inicio.
- Los objetivos abatidos o que salen de la pantalla se reutilizan para optimizar la memoria.

### 🔥 Niveles de Dificultad
| Dificultad | Tiempo (s) | Multiplicador | Velocidad Objetivos | Munición Máxima | Recarga (s) |
|------------|------------|---------------|---------------------|-----------------|-------------|
| Fácil      | 90         | x2            | 6                   | 7               | 0.5         |
| Media     | 60         | x1.5          | 9                   | 5               | 1.0         |
| Difícil    | 30         | x1            | 12                  | 3               | 1.5         |

> **Nota:** En dificultad difícil, recargarás automáticamente al abatir un objetivo.

### 🔫 Arma
- Se usa el cursor como mira, ocultando el ratón y mostrando una interfaz de rifle.
- Munición limitada, con recarga automática según la dificultad.
- Si te quedas sin munición, la mira se oculta hasta que puedas disparar de nuevo.

### 🦆 Objetivos
- Se generan aleatoriamente patos y dianas con diferentes apariencias.
- La profundidad de los objetos cambia según su posición en el eje Y para dar efecto de perspectiva.

### 🏆 Sistema de Puntuación
- La puntuación depende de la precisión del disparo.
- Disparos más cercanos al centro del objetivo otorgan más puntos.
- Multiplicador de puntuación según la dificultad.

## 📺 HUD
El HUD muestra información clave como:
- Objetivos abatidos
- Tiempo restante
- Dificultad
- Puntos acumulados
- Cantidad de munición disponible
![image](https://github.com/user-attachments/assets/414acd62-2191-423d-a5c2-0aa4da088862)

## 🎛️ Extras
- **Pausa**: Puedes pausar el juego con la tecla `ESC`.
- **Configuración**: Ajuste de resolución, modo ventana y volumen desde el menú.

## ⌨️ Controles
- **Disparar**: `Clic Izquierdo` / `Barra Espaciadora`
- **Menú Pausa**: `ESC` (Abrir/Cerrar)

## 📚 Recursos y Bibliografía
- [Kenney Assets](https://www.kenney.nl/assets/shooting-gallery)
- [Documentación de Godot](https://docs.godotengine.org/es/4.x/index.html)
- [Tutorial para menú de pausa](https://youtu.be/e9-WQg1yMCY?si=yynqWrasR5ViyvnL)
- [Tutorial para cambio de resolución](https://youtu.be/YsdkcPV0BAo?si=8o4GrKaIt7-R98r-)

---
¡Diviértete desarrollando y jugando! 🚀🎯

