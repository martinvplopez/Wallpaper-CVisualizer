# Wallpaper-CVisualizer
## Realizado por Martín van Puffelen López
### Práctica  CIU: *Procesamiento de imagen y vídeo*
___

#### Introducción: Visualizador de *wallpapers* interactivo con detección de movimiento.
#### Basado en los trabajos de [Bryan WC Chung](https://www.researchgate.net/publication/319307779_Pro_Processing_for_Images_and_Computer_Vision_with_OpenCV) y el algoritmo ["Two-Frame Motion Estimation Based on polynomial Expansion"](https://link.springer.com/chapter/10.1007/3-540-45103-X_50).
##### Una adaptación del algoritmo de detección de flujo óptico (Gunnar) con interacción mediante regiones (Chung). Esto es, analizar el movimiento relativo de los pixeles entre fotogramas consecutivos.


#### Instrucciones
##### Iniciar programa, la interfaz estará dividida en 2 partes: la parte izquierda con la visualización del flujo óptico y la grabación de la cámara; parte derecha, en el modo inicial, las instrucciones con las regiones y en el caso de haber iniciado el modo *galería* se verán los wallpapers en la mitad derecha. 
##### Para iniciar la visualización de los wallpapers se deberá tocar cualquiera de las dos regiones y luego la otra. En el modo *galería* se deberá realizar un movimiento rápido a la región para interactuar y visualizar otra imagen.


![Inicio](https://github.com/martinvplopez/Wallpaper-CVisualizer/blob/main/Practica_6/capInit.png)
![Galería](https://github.com/martinvplopez/Wallpaper-CVisualizer/blob/main/Practica_6/capGaleria.png)

#### Detalles implementación
- ##### **Información**: *Texto*, dispone de un buen tamaño, fuente legible con buen contraste, diseño minimalista. Al simplemente tener que gesticular sobre las regiones, el texto que indica cómo entrar en el modo *galería* es directo y conciso. También se ha añadido un *contador* de imagen para aportar información extra sobre qué wallpaper está visualizando el usuario.
- ##### **Color**: Se han utilizado blanco como color principal para generar una sensación de limpieza y fluidez con el movimiento. Los colores de interacción con las regiones: verde y rojo son para aportar información extra, verde significa movimiento correcto y rojo refleja que el usuario no puede avanzar o retroceder la imagen ya que está en la última o primera.
- ##### **Interactividad**: Se ha implementado dos regiones que tienen distinta funcionalidad en el modo de inicio que en la *galería*, y por esto, dos modos de interacción distintos. 
- ##### **Controles**: Realizar movimientos en las regiones.

#### Referencias
- [Documentación asignatura](https://github.com/otsedom/otsedom.github.io/blob/main/CIU/P6/README.md)
- [Imágenes de Google](https://www.google.com/imghp?hl=EN)
- [Documentación Processing](https://processing.org/reference)
- [Wallpapers](https://www.wallpapersafari.com)
- [OpenCV](https://docs.opencv.org/3.4/dc/d6b/group__video__track.html)
- [Efectos de sonido](https://freesound.org/)
