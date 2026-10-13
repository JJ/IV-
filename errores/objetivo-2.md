# Errores comunes objetivo 2

- Hay que resolver *todos* los comentarios cambiando el código.
- Cada commit que atiende un comentario referencia su issue (`refs #n`), y se
  contesta en el hilo con el hash del commit.
- Si el modelo cambia tras la revisión, hay que actualizar los issues para que
  sigan describiendo lo que hay en el código.

## Con respecto al milestone

- El milestone tiene que contener exactamente lo que pide el objetivo, y hay que
  hacer solo y exclusivamente lo que se pide.
- Este objetivo es solo un modelo del problema. No se añaden tests, linter,
  workflows de integración continua, ficheros de configuración de herramientas
  ni cambios en `.gitignore`. Todo eso se hará cuando sea necesario, y en todo
  caso antes del primer PR evaluable que lo requiera (objetivo 4).
- Que el objetivo diga que se *puede* adaptar el workflow `lint-yaml.yml` no
  significa que se deba hacer ahora.
- No se tocan las historias de usuario.
- No se escribe un documento de metodología en `docs/` ni se pone como criterio
  de validación del milestone. El análisis está en los issues y en los mensajes
  de commit.
- No se toman decisiones implícitas: toda decisión debe poder rastrearse a un
  issue.

  ## Con respecto al código

- Sin comentarios en el código. También son código, hay que mantenerlos y
  generan deuda técnica.
- Un modelo no incluye getters ni setters.
- Sin lógica de negocio (consultas, cálculos, agregados con operaciones): es del
  milestone 1.
- Una clase o tipo con un solo atributo hay que replantearlo muy seriamente:
  ¿qué aporta aparte de cambiar el nombre a un dato? ¿Se resuelve con un
  atributo de otra clase?
- Si es inmutable, es un objeto valor. Los objetos valor no llevan identificadores
  (IDs); los IDs en entidades tienen que estar muy bien justificados.
- Un objeto valor sin una entidad que lo gestione deja el modelo incompleto.
  Organizar los objetos valor dentro de entidades es precisamente para eso.
- Todo atributo y todo tipo tiene que estar respaldado por una historia de
  usuario o un issue.

## Recomendaciones

- Hacer un diagrama Mermaid y ponerlo para que todo quede mucho mas claro facilita muchísimo la corrección por parte del profesor.
