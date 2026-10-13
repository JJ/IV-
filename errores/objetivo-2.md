# Errores comunes objetivo 2

- Hay que resolver *todos* los comentarios cambiando el código.
- Cada commit que atiende un comentario referencia un solo issue (`refs #n`), *siempre* en la primera línea del mensaje de commit y prefereiblemente en los primeros caracteres y se
  contesta en el hilo con el hash del commit.
- No puede haber codigo relacvionado conm un issue antiguo, ya que de esta forma se rompe el mapeo de codigo a issue.
  De esta forma sabemos si:
  1. Se borra totalmente el código del issue antiguo.
  2. Si son solo cambios para evitar alguna ambigüedad. Pero ponerlo así realmente no creo que ayude.

## Con respecto al milestone

- El milestone tiene que contener exactamente lo que pide el objetivo, y hay que
  hacer solo y exclusivamente lo que se pide.
- Este objetivo es solo un modelo del problema. No se añaden nada que no sea parte del modelo del problema.
- Que el objetivo diga que se *puede* adaptar el workflow `lint-yaml.yml` no
  significa que se deba hacer *en el mismo PR*. Se debe hacer *antes*.
- No se tocan las historias de usuario a no ser que haga falta (aclaraciones, ambiguedades, etc...).
  Lo que no puedes hacer directamente es adaptarlas a lo que hay en el codigo.
- No se toman decisiones implícitas: toda decisión debe poder rastrearse a un
  issue.

## Con respecto al código

- Sin comentarios en el código. También son código, hay que mantenerlos y
  generan deuda técnica.
- Un modelo no incluye getters ni setters.
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

- Hacer un diagrama Mermaid y ponerlo para que todo quede mucho mas claro facilita
  muchísimo la corrección por parte del profesor. Pidele a la IA que dado tu codigo
  te genere un diagrama de Mermaid y manda la foto.
