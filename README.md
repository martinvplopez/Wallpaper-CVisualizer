# Wallpaper-CVisualizer
## Realizado por Martín van Puffelen López
### Práctica  CIU: *Procesamiento de imagen y vídeo*
___

#### Introducción: Visualizador de *wallpapers* interactivo con detección de movimiento.
#### Basado en los trabajos de [Bryan WC Chung](https://www.researchgate.net/publication/319307779_Pro_Processing_for_Images_and_Computer_Vision_with_OpenCV) y el algoritmo ["Two-Frame Motion Estimation Based on polynomial Expansion"](https://link.springer.com/chapter/10.1007/3-540-45103-X_50).
##### Una adaptación del algoritmo de detección de flujo óptico (Gunnar) con interacción mediante regiones (Chung). Esto es, analizar el movimiento relativo de los pixeles entre fotogramas consecutivos.


#### Instrucciones
##### Iniciar programa, la interfaz estará dividida en 2 partes: la parte izquierda con la visualización del flujo óptico y la grabación de la cámara; parte derecha, en el modo inicial, las instrucciones con las regiones y en el caso de haber iniciado el modo *galería* se verán los wallpapers.



![GIF Principal](https://github.com/martinvplopez/Sitycleta-Evolution-CIU/blob/main/interface.gif)

#### Detalles implementación
- ##### **Información**: *Texto*, dispone de un buen tamaño, fuente legible con buen contraste, diseño minimalista. Al simplemente tener que gesticular sobre las regiones, el texto que indica cómo entrar en el modo *galería* es directo y conciso.
- ##### **Color**: Se han utilizado blanco como color principal para generar una sensación de limpieza y fluidez con el movimiento. Los colores de interacción con las regiones: verde y rojo son para aportar información extra, verde significa movimiento correcto y rojo refleja que el usuario no puede avanzar o retroceder la imagen ya que está en la última o primera.
- ##### **Interactividad**: Se ha implementado dos regiones que tienen distinta funcionalidad en el modo de inicio que en la *galería*, 
- ##### **Controles**: Controles de zoom con la rueda del ratón y arrastrar clic izquierdo para mover por el mapa, [*R*], tecla de reinicio, control al usuario y tolerancia a errores. Se han elegido controles estándar para favorecer la intuición del usuario.
- ##### **Análisis de los datos**: Se ha realizado un sencillo script en Python con la librería Pandas para realizar un nuevo archivo *.csv* con la información necesaria para mi programa ([ver script](https://github.com/martinvplopez/Sitycleta-Evolution-CIU/blob/main/main.py)).

#### Posibles modificaciones
##### Transición animada del 2D al 3D.

#### Referencias
- [Documentación asignatura](https://github.com/otsedom/otsedom.github.io/blob/main/CIU/P5/README.md)
- [Imágenes de Google](https://www.google.com/imghp?hl=EN)
- [Documentación Processing](https://processing.org/reference)
- [Sagulpa: Portal de Transparencia](https://www.sagulpa.com/portal-transparencia)
- [Sitycleta](https://www.sitycleta.com/es/)
- [Efectos de sonido](https://freewavesamples.com/)
