# COMPUTACIÓN VISUAL
# Introducción al procesamiento de imágenes

## Taller 1

Implementar las siguientes operaciones de análisis para imágenes/video:

* Conversión a escala de grises: promedio rgb y [luma](https://en.wikipedia.org/wiki/HSL_and_HSV#Disadvantages).
* Aplicación de algunas [máscaras de convolución](https://en.wikipedia.org/wiki/Kernel_(image_processing)).
* Conversión  a ascii.
* (solo para imágenes) Despliegue del histograma.
* (solo para video) Medición de la [eficiencia computacional](https://processing.org/reference/frameRate.html) para las operaciones realizadas.

Emplear dos [canvas](https://processing.org/reference/PGraphics.html), uno para desplegar la imagen/video original y el otro para el resultado del análisis.



*  **Conversión a escala de grises (Promedio RGB y Luma) y ascii**: Se recorre la imagen pixel a pixel tomando el promedio de los 3 colores RGB del pixel y se reemplaza el valor por el promedio obtenido obteniendo el resultado final una vez promediados todos los pixeles, en un determinado valor de gris.
Para convertir la imagen en ascii, se define un array de simbolos de tamaño 256 que nos van a servir como insumo para la imagen resultado, como segundo paso recorremos la imagen, con un paso determinado por la variable resolución que hemos definido de acuerdo si queremos simbolos mas grandes o pequeños para una textura más fina, para cada iteración obtenemos el valor del color con el fin de obtener su valor de brillo, y le asociamos un caracter definido en el array de simbolos.

Para Luma se realiza el mismo procedimiento procedimiento anterior, pero en vez de sacar un promedio del RGB usamos la siguiente fórmula que toma cada componente del RGB y lo multiplica por un factor:
**color_gray = 0.2126R + 007152G + 0.0722B**
*  **Conversión a escala de grises (Luma Shader)**: Para esta parte se emplea shaders para hacer el procesamiento a escala de grises por hardware, y realizando la conversion por la formula Luma



* **Despliegue del histograma**:  Para esta parte del taller se usan tres canvas(imagen original, imagen escala de grises e histograma). Se almacenan las frecuencias de los diferentes valores de brillo de la imagen en escala de grises, tomando en cuenta que cada canal de color tiene 256 niveles de intensidad posibles, cad apunto representado por un valor de brillo en un rango desde 0(negros) hasta 255(blancos) y valores intermedios los diferentes valores de gris  y luego se gráfica estas frecuencias mostrando información sobre el brillo y contraste de la imagen.

Con ayuda de la funcion map(), mapeamos la posición del puntero del mause en el eje x, entre el rango ocupado por la imagen del histograma, se mapea a un rango de 0 a 256, que es el tamaño del arreglo del histograma donde tenemos almacenados las frecuencias de los diferentres valores de brillo de la imagen, asi mismo definimos un intervalo para recorrer la foto y el histograma a medida que nos desplazamos con el puntero a través del histograma, el valor inicial es el valor retornado por la funcion map(), y el valor final sera esa misma cantidad mas un determinada valor, dependiendo del tamaño del segmento que se desee.



+ imagen de Histograma





*  **Aplicación de algunas máscaras de convolución**: Se realizó la aplicación de 4 mascaras de convolución,recorriendo la imagen pixel a pixel y aplicando a cada uno la matriz de convolución respectiva, esto con el fin de lograr el filtro o mascara deseado donde los resultados fueron los siguientes:

    -  **Detección de bordes (edgeDetect)**: Los  bordes  de  una  imagen  digital  se  pueden  definir  como  transiciones  entre  dos  regiones  de  niveles  de  gris  significativamente  distintos.  Suministran  una  valiosa  información  sobre  las  fronteras de los objetos y puede ser utilizada para segmentar la imagen, reconocer objetos.
    + ![edgedetec](https://wikimedia.org/api/rest_v1/media/math/render/svg/f800ad5f76b6c26c729ff0c1fef44284d7cade7a)

   -  **boxBlur**:  Desenfoca una imagen basándose en el color promedio de sus píxeles circundantes. Con niveles de radio altos se obtiene un efecto "box". Con niveles de radio más bajos se obtiene un efecto similar al Desenfoque gaussiano.
   + ![boxBlur](https://wikimedia.org/api/rest_v1/media/math/render/svg/c1e0a314554ab3663f129961ebd28fec307e74c4)

    -  **Filtro de Sharpen**: ayuda a resaltar los detalles y mejorar los bordes de los objetos en una imagen.
    + ![Sharpen](https://wikimedia.org/api/rest_v1/media/math/render/svg/beb8b9a493e8b9cf5deccd61bd845a59ea2e62cc)


    *  **Medición de la eficiencia computacional**: Se aplicaron diferentes tipos de mascaras para un video con extensión .mov y se utilizo la mencionada anteriormente función map() para mapear la posición del puntero del mouse en el rango de espacio donde se despliega el video, con el fin de llevar estos valores dentro del rango a un rango entre 1 y 5, con el fin de aplicar un filtro definido para una determinada subregion dentro del video:
    + 1 - Escala de grises.
    + 2 - Edge detect
    + 3 - Boxblur
    + 4 - Sharpen

Los resultados de este proceso mostraron una disminución  de frames a medida que aplica los filtros debido a la carga computacional que estos implican.



|       Estudiantes     |                 usuario github                    |
|-----------------------|-----------------------------------------------|
| |                                          |
| |                                          |
| |                                          |
|Rafael Antonio Salgado López |                                          |
