# Errores comunes objetivo 2

Consultar también [los errores comunes del año anterior](objetivo-2-25-26.md).

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

## Con respecto a los issues

Un issue es un problema, no una enumeración de atributos para una clase que está
ya determinada. Qué es una clase y qué no tendrá que obtenerse como solución a
un problema.

- ¿Como se representa x? o Necesito un modelo de y no enuncia ningún
  problema. Establece un lenguaje ubicuo, pero conduce a código que ni sirve
  adecuadamente para la lógica de negocio ni establece una única fuente de
  verdad.

## Con respecto al código

- Los constructores, en general, no son lógica de negocio, luego no son
  aceptables. ¿Es código que pueda ser aceptable sin tests? Si no lo es, es que
  es lógica de negocio. Y si es lógica de negocio, no forma parte del milestone.
  - Adicionalmente, en un 100% de los casos el código generado por IA no sigue
    las mejores prácticas de Go, así que es mejor no aceptarlo.

- Si no hay ninguna entidad, o no sabes qué es una entidad y qué no, es que hay
  un error. Los objetos-valor no pueden contener lógica de negocio.
  - Un objeto valor sin una entidad que lo gestione deja el modelo incompleto.
    Organizar los objetos valor dentro de entidades es precisamente para eso.
- Sin comentarios en el código. También son código, hay que mantenerlos y
  generan deuda técnica.
- Un modelo no incluye getters ni setters.
- Una clase o tipo con un solo atributo hay que replantearlo muy seriamente:
  ¿qué aporta aparte de cambiar el nombre a un dato? ¿Se resuelve con un
  atributo de otra clase?
- Si es inmutable, es un objeto valor. Los objetos valor no llevan identificadores
  (IDs); los IDs en entidades tienen que estar muy bien justificados.
- Todo atributo y todo tipo tiene que estar respaldado por una historia de
  usuario o un issue.

## Recomendaciones

- Hacer un diagrama Mermaid y ponerlo para que todo quede mucho mas claro facilita
  muchísimo la corrección por parte del profesor. Pidele a la IA que dado tu codigo
  te genere un diagrama de Mermaid y manda la foto.
