# Error en todos los objetivos a partir de este

- Los comentarios tienen que resolverse *siempre* con un cambio en la línea
  indicada, porque si hay un comentario, es porque hay alguna cosa adicional que
  hay que considerar o bien lo que se ha explicado no se ha hecho con suficiente
  claridad y por eso no lo entiende quien revisa.

# Errores frecuentes objetivo 2

- Si no está asignado a ninguna historia de usuario, un issue es incorrecto y lo
  único razonable que se puede hacer con él es cerrarlo y descartar todo código
  que se haya creado con él.

- Lo primero que hay que mirar son los issues que se creen, porque son
  parte de la metodología que hay que hacer correctamente para que
  este producto sea válido.

- Limitarse a preguntar ¿Qué es esto? o ¿Qué es esto otro?, aunque es
  válido como primera aproximación, eventualmente lleva a código
  inválido que refleja más el nombre de las cosas que una verdadera
  modelización del problema. Aunque se puede empezar por ahí si hay
  bloqueo, conviene que se revisen una vez hechos para buscar cosas
  que sean restricciones a otras cosas, cosas que sean en realidad
  funciones o entradas a la lógica de negocio o cosas que sean
  simplemente irrelevantes.

- Si no habéis seguido correctamente domain driven design, no tendréis una
  entidad. Si en el modelo hecho no sabéis decir qué es una entidad, no habréis
  aprendido correctamente el concepto, pero sobre todo no podréis trabajar con
  él más adelante.
