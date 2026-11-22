# Errores frecuentes - objetivo 5

Si a estas alturas no os habéis dado cuenta que no se trata de escribir un
Dockerfile, es que no habéis entendido bien la asignatura. Se trata de que
sigáis una metodología que os permita crear imágenes de contenedores que se
adecúen al proyecto y tengan una serie de características fijas y bien
documentadas.

El problema principal es que no debéis tener en la imagen nada que no entendáis
y que no resuelva problemas específicos. Copiar y pegar de algún lugar o generar
usando AI no hace que se aprenda nada, y al final sigue uno desconociendo lo
mismo que al principio. Como se ha dicho repetidamente, usar repetidamente AI
para generar el código que se evalúa puede hacer que no se supere el objetivo.

- Usar imágenes base con versiones. Y más si son versiones arbitrarias.

- Escribir "esta imagen no es buena porque no tiene el lenguaje de programación". Se trata de que *vosotros* instaléis ese lenguaje y el resultado lo comparéis con otras imágenes en las que esté instalado. Si os limitáis a las imágenes que ya lo traen instalado os estáis perdiendo la mitad de las posibilidades de aprender a crear una imagen Docker.
