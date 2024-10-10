# Errores frecuentes objetivo 1

En este objetivo y en todos los demás debe haber en el PR *sólo* lo que sea
relevante para la corrección del mismo. Si hay que cambiar algún fichero de
nombre, meter un fichero o borrarlo, se hace en la rama principal *antes* de
crear la rama desde la que se lanza el PR. Y si ya se ha hecho, habrá que
añadirlo a la rama principal y *quitarlo* de la secundaria haciendo un rebase
(añadiendo a la principal y mergeando de la principal a la secundaria)

- Se deben resolver *todos* los comentarios. Igualmente quien comente no debe
  aprobar hasta que no se hayan resuelto todos los comentarios.

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
  aclarar a qué parte del problema del cliente se circunscribe siempre es conveniente.

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

## Sobre las historias de usuario

* Hay que escribirlas *para otra persona*, explicando todos los
  términos del problema que necesiten explicación, sobre todo en el
  marco de poder entender por qué es un problema trabajar con esos
  términos o hacer esa actividad.
  
