# Errores frecuentes objetivo 4

> Consulta [los del año pasado](objetivo-4-25-26.md)

Tened en cuenta que este objetivo, como el resto, tiene que revisarlo el
profesor personalmente para poder ayudar al estudiante. Si usáis AI generativa
para generar 30 ficheros y más de mil líneas de código, se hace imposible
revisarlo. Tratad de reducir el problema a una dimensión que sea manejable por
los dos.

En todo caso, usar IA indiscriminadamente no es nunca una buena idea y acaba
siendo más problema que solución, porque rara vez el código generado sigue las
buenas prácticas y aunque las siga, no se habrá aprendido nada si se ha hecho
integralmente con IA.

## Sobre las bibliotecas de test

- Igual que en el [objetivo 3](objetivo-3.md), no uséis criterios arbitrarios o
  irrelevantes. Por ejemplo, ¿número de dependencias os parece que es objetivo
  (e inmutable independientemente de la versión?
- El coste de instalación es indistinguible dentro de todo lo que se va a
  instalar más adelante.

## Errores en el código

- En muchos casos, o bien porque os lo he dicho yo, o porque se ha aprobado por
  el trabajo realizado por la otra persona, o porque simplemente no se han
  tenido en cuenta los problemas a la hora de crear el modelo, tendrás que
  trabajar sobre el modelo, cambiándolo. Tendrás que tener en cuenta todo lo que
  se dijo en el objetivo 2 sobre las entidades y las fuentes de verdad: si no
  hay una única fuente de verdad que tendrá que estar gestionada por una
  entidad, no puedes de ninguna manera aplicarle la lógica de negocio.
- **No se puede usar ninguna biblioteca externa**. Esto tendría que haber
  quedado claro desde el objetivo 0.
- Parece bastante obvio, pero hay que programar la lógica de negocio.
