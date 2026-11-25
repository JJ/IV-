# Errores comunes objetivo 3

> [Consulta errores del curso anterior](objetivo-3-25-26.md)

En este objetivo es especialmente pernicioso usar IA. Habitualmente resulta en
una pérdida de tiempo y posible no superación del mismo. Por favor, evitarlo.

## Común a todos los objetivos

Los PRs están para que los lea la gente, el equipo o el profesor. Por favor,
tenlo en cuenta antes de añadir toneladas de información irrelevante para la
evaluación. Y más si está generada por IA.

## Otros errores comunes

- Conviene evitar los *AIismos*. Cuando se le pregunta a una IA en español, a
  veces traduce términos en inglés que no se suelen manejar de tal forma en
  español, sino usando el mismo término. Por ejemplo, *lockfile*.
      - En general, conviene evitar la IA en este objetivo siempre.

- Tratad de evitar criterios arbitrarios, como que use no sé qué fichero o no sé
  qué formato. Usad solo criterios objetivos, relevantes y medibles.

- Se trata de que se investigue un poco y se busquen diferentes alternativas,
  algunas de las cuales pueden ser emergentes o estar ahora mismo en desarrollo.
  Si se pone `make`, `mage`, `just` y `task` en el caso de go va a ser imposible
  saber si lo ha hecho uno, si se ha copiado de una IA o de un compañero. Por
  favor, no caer en la tentación de limitarse a ese cuarteto.

- Normalmente vuestro proyecto se testeará y ejecutará en Linux. Hacer las
  mediciones en Windows no va a dar medidas significativas, ni es el entorno
  ideal para medir.

- Si medís la velocidad de instalación, indagad un poco y buscad la más rápida
  posible, no la primera que aparezca.

- Las herramientas de desarrollo tienen que instalarse todas en el espacio del
  usuario. Es un error usarlas e instalarlas desde root.

- En todo caso, no se debe usar un shell de root *nunca*. Para eso esá `sudo`
  que es más seguro al caducar el login al cabo de cierto tiempo.
