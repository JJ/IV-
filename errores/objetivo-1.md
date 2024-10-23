# Errores frecuentes objetivo 1

Para empezar, el [error frecuente del objetivo 0 mencionado en la
introducción](https://github.com/JJ/IV-/blob/master/errores/objetivo-0.md) se
sigue produciendo. En este caso, cosas como:

- Poner el "objetivo" de un milestone.
- Poner "HUs asociadas"
- Poner primero "modelo del problema", luego "estructura del problema", y
  luego "dominio del problema", sin entender en ningún caso de qué se está
      hablando. O decir "se va a modelizar las entidades y las relaciones entre
      ellas". ¿No es eso un modelo del problema?
- Poner 4 o 5 milestones.
- Poner "el milestone lo validará el validador".
- Decir que el código debe ser "flexible y adaptable". ¿Cómo se mide eso?
- Decir que en el milestone 0 hay que hacer un "análisis detallado".

Todos estos errores frecuentes están explicados abajo; también se explica por
qué son errores. Pero el verdadero error es no tratar de hacer el trabajo
necesario para superar el objetivo, sino mirar como lo ha hecho otra persona,
así que sirve de muy poco explicar por qué están mal si no interesa aprender por
qué es así.

> En general, si se encuentra uno o más de estos "patrones suficientemente
> repetidos" se señalará el error, se apuntará a este fichero de errores comunes
> y se dejará de corregir, con lo que el estudiante tendrá que hacer otra ronda
> de correcciones.

Por si no ha quedado claro en las correcciones hasta ahora, hacer esto cuesta
caro en términos de tiempo perdido por el estudiante (que seguramente de haber
intentado entender qué se hace y por qué habría tardado menos) pero sobre todo
tiempo perdido por el profesor, que hace comentarios dos o tres o cinco veces
sobre el mismo contenido que no van a servir para nada, porque no corresponden a
un entendimiento equivocado de un concepto, sino a la falta no sólo de
entendimiento, sino de la necesidad de entender tal concepto. Tiempo que resta
para ayudar a compañeros que sí puedan necesitarlo.

En este objetivo y en todos los demás debe haber en el PR *sólo* lo que sea
relevante para la corrección del mismo. Si hay que cambiar algún fichero de
nombre, meter un fichero o borrarlo, se hace en la rama principal *antes* de
crear la rama desde la que se lanza el PR. Y si ya se ha hecho, habrá que
añadirlo a la rama principal y *quitarlo* de la secundaria haciendo un rebase
(añadiendo a la principal y mergeando de la principal a la secundaria)

Finalmente, dejar de venir a clase ya en este objetivo, cuando todavía no se
conoce o no se maneja bien la mecánica de la asignatura, demuestra una falta de
interés que sólo perjudica al estudiante, que no tiene ni siquiera el tiempo
en clase dedicado a la asignatura.

- Se deben resolver *todos* los comentarios. Igualmente quien comente no debe
  aprobar hasta que no se hayan resuelto todos los comentarios. Y no resolverlos
  cambiando la línea poniendo a veces frases absurdas. Esto representa doble
  trabajo para quien revisa: tiene que mirar el comentario original. Todo lo que
  se cambia se queda registrado, y si se cambia una palabra por otra o se añade
  una palabra para eliminarlo lo único que genera es trabajo adicional para el
  profesor, pero sobre todo una sensación de que el estudiante no tiene interés
  en aprender nada relacionado con el objetivo, sino simplemente quitárselo de
  en medio.

- Es un error demasiado común escribir *mucho*. Escribir *mucho* no hace que los
  revisores entiendan que has comprendido el concepto del objetivo. La brevedad
  es esencial no sólo para revisar bien el objetivo, sino también para
  trabajar. 10 reglas de validación, 12 componentes de un producto, no hacen más
  que añadir oscuridad y complejidad al trabajo, no ayudan a responder la
  pregunta sobre si lo que se hace está bien, y sobre todo oscurecen una
  documentación que debería ser solamente técnica.

- Si se entiende cualquier pregunta o comentario que se hace en el PR como "hay
  que cambiar esto por cualquier otra cosa" no se va a avanzar hacia la
  consecución del objetivo. Se debe de intentar contestar a las preguntas que se
  hacen, y si las respuestas no se conocen o no son satisfactorias, se debe
  simplemente eliminar el texto correspondiente.

## Errores de los revisores

- No se trata de una evaluación donde se esté aprobando o suspendiendo al
  compañero/a. Se trata de una revisión técnica, donde la persona que haya
  abierto el PR tiene que incluir una información que esté clara para todo el
  mundo. Si no está clara para el estudiante, o simplemente no la entiende, se
  puede preguntar y se debe responder porque se trata de que las dos personas lo
  entiendan, y lo entiendan de la misma manera.
- Hasta que no se entienda lo que se ha escrito, no se resuelvan
  *satisfactoriamente* todos los comentarios y sobre todo no corresponda lo que
  está escrito al guión y a la lista de comprobación, *no se debe aprobar*. Si
  se aprueba prematuramente por quedar bien para empezar es posible que la
  persona que apruebe no haya aprendido adecuadamente los conceptos involucrados
  (lo que va a volverse en su contra si es que todavía no está aprobado su PR),
  pero lo más seguro es que la persona que ha hecho el PR no los entienda y por
  lo tanto va a ser eventualmente más trabajo para el profesor y para ella.
- Ni la persona que comenta ni quien ha hecho el PR deben imponer soluciones
  específicas a la otra. No hay soluciones óptimas, hay soluciones que presentan
  uno o dos o muchos problemas, y por supuesto formas mejores o peores de
  transmitir esas soluciones codificadas en el PR. Si la persona que ha hecho el
  PR dice "esto es así porque el profesor ha dicho esto o lo otro, o porque no
  ha dicho nada así que lo pongo" generalmente está equivocada. Si la persona
  que revisa dice "esta solución es incorrecta, pon esta otra" también está
  equivocada. Un PR no se hace nunca para imponer soluciones, sino para aprender
  juntos.

## Sobre los milestones

* Escribir en el primer milestone (milestone 0) "Modelo del problema" no es
  suficiente. Primero, tiene que describirse qué producto se va a
  entregar. Segundo, es importante especificar qué se consideraría un modelo
  válido del problema. Dado que este producto lo va a recibir *realmente* el
  estudiante de manos de otro estudiante en el objetivo 2, es esencial que este
  formule cuidadosamente, para que esa persona lo entienda, qué es lo que espera
  recibir. Como en casi todos los casos en esta asignatura, lo que se entrega
  son documentos de trabajo *reales* que ayudan en el proceso ingenieril de
  desarrollo de un producto.

* Aunque los milestones en principio no tienen por qué tener información sobre
  las historias de usuario, si hay varias historias de usuario hablar de "modelo
  del problema" o de "lógica de negocio" no es suficiente, porque las dos
  historias de usuario (o las 5) pueden tener diferentes aspectos del problema,
  o incluso ser problemas diferentes. En todo caso, siempre es conveniente ser
  preciso en el lenguaje, porque en el momento que se vaya a trabajar con un
  milestone determinado puede haber más historias de usuario, o menos, así que
  aclarar a qué parte del problema del cliente se circunscribe siempre es
  conveniente.
  - De la misma forma, enlazar *todas* las historias de usuario sólo indica
    dejadez y falta de precisión a la hora de indicar a la persona que trabaje
    qué es lo que debe hacer.

* Por favor, no inventéis y pidáis cosas que no vienen a cuento ni sirven
  realmente para nada. Estoy pensando en pedir "documentos" con el modelo del
  problema, pero no descarto que metáis diagramas UML o alguna otra cosa
  igualmente inútil. Un producto es código funcionando, y que siga algún
  criterio de viabilidad. Punto.

* Los criterios de viabilidad tienen que ser, si no totalmente objetivos, al
  menos que sigan algún criterio más o menos objetivo. "Que lo apruebe alguien"
  no es objetivo. ¿Qué pasa si no lo aprueba? ¿Está mal entonces? Si no se puede
  comprobar de forma totalmente objetiva, habrá al menos que indicar algún
  criterio cualitativo o cuantitativo que se vaya a seguir a la hora de
  aprobarlo o no.

* Si se dice qué forma debe tener un PMV, ni se deja al desarrollador trabajar
  sobre el mismo, ni de hecho hace falta que se haga ese trabajo, porque ya se
  ha hecho. Se debe decir la forma general del producto o qué tiene que hacer el
  producto para ser válido, no qué contiene, porque para eso es mejor que lo
  haga directamente quien lo dice.

* El exceso de detalles hace que se fuerce a soluciones determinadas, y hace que
  haya que cambiar una cantidad excesiva de cosas. Los milestones son
  agrupaciones de productos de complejidad creciente, que creen diferentes
  niveles de abstracción a la hora de trabajar con el problema. Decir que uno
  tenga "2 cosas" y otro "3 cosas" divide de forma artificial el problema,
  porque igual de trabajo cuesta programar para 3 cosas que para 5.
  - Otro ejemplo es decir "hacer un modelo que incluya la clase a, b y la
    c". "Hacer un modelo" es precisamente saber cuales son esas clases y qué es
    lo que incluyen o cómo se comportan. 

* A veces esos detalles vienen en forma de "palabras mágicas", por ejemplo,
  mencionar DDD, explicar que se trata de "expresar relaciones entre la
  estructura y no sé qué". ¿Ayudan en algo a entender ese milestone o
  simplemente tratan de ocultar que no se entiende realmente qué es lo que se le
  va a pedir al otro usuario en el objetivo 2? En cuanto a mencionar DDD, ¿qué
  pasa si no se documenta el uso de DDD? ¿Se va a rechazar el entregable? (Y ya
  digo desde ahora que *nadie* usa DDD ni lo documenta). Aparte que es sólo un
  ejemplo de metodología. Hay otras metodologías para esta fase, como hay
  metodologías para todas las fases del desarrollo.

* En desarrollo ágil más allá de dos milestones por delante no tiene mucho
  sentido planificar. Pero si se hace, conviene que se mire la progresión de
  objetivos de la asignatura para que se ajusten, en lo posible, a lo que se
  encuentra ahí.

## Sobre las historias de usuario

* Hay que escribirlas *para otra persona*, explicando todos los
  términos del problema que necesiten explicación, sobre todo en el
  marco de poder entender por qué es un problema trabajar con esos
  términos o hacer esa actividad.

* Sólo hay que incluir las HUs que realmente se vayan a usar en el desarrollo.

## Sobre los *user journeys*

Los user journeys sirven principalmente para añadir detalle y contexto a las
historias de usuario. Por lo tanto, ponerlos de forma independiente sin ningún
enlace con las mismas les priva de utilidad.
