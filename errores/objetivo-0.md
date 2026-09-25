# Errores comunes en el objetivo 0

## Errores en el envío

- No se puede fusionar el PR hasta que no se apruebe, en el repositorio del
  estudiante, el PR.
- Solo hace falta enviar el PR una vez. El resto de las veces basta
  con solicitar revisión con un comentario en el propio repositorio
  del estudiante.

## Errores en el envío que llevan a errores en el contenido

- No incluir la lista de comprobación o no seguirla directamente. Hay puntos
  esenciales en la misma, como el hecho de que se tengan datos o no (lo que
  también estaba en la ficha de validación).

## Errores en la descripción del problema

Lo esencial del problema es que el mismo, o parte de él, pueda llevar a una
lógica de negocio que se pueda testear automáticamente para ver si efectivamente
ha resuelto el problema. Si la descripción del problema es tal que simplemente
haciendo lo que se pide ("organizarse", "recordar") se resuelve el problema es
que no lo es.

- No describir un problema, sino "el usuario quiere una aplicación que". No, el
  usuario no quiere ninguna aplicación. Quiere que le resuelvan su problema. Y
  sin este problema es imposible modelizarlo, ni testearlo, ni nada. La
  aplicación que tú crees que quiere el usuario no puede ser una base para un
  desarrollo ágil, iterativo, que en cada paso añada valor al cliente,
  simplemente porque no se sabe qué es lo que quiere el cliente ni qué le aporta
  valor.
  - Una variante de esto es "el usuario quiere hacer *x*", generalmente
    "organizarse". Esto no es una descripción de un problema. Es una descripción
    de una aplicación que se ha trabajado hacia atrás para hacerla parecer un
    problema.
- Describir un problema para el que no se tienen datos. Inventarse un problema y
  luego inventarse los datos no lleva a ningún lado. Desde el punto de vista del
  desarrollo, es simplemente un problema mal especificado que en un momento
  determinado va a tener que detenerse porque no se sabe responder a
  preguntas sobre el mismo o se responden de forma ad hoc inventando algo
  incoherente con el resto de lo hecho hasta ahora.

## Sobre los conjuntos de datos

- Se tiene que decir concretamente de dónde se van a obtener esos datos, no
  decir cosas como "web pública"
- Nada que requiera inventar datos va a ser un buen problema, simplemente porque
  no se tiene suficiente conocimiento del problema para resolverlo.
- No se deben poner fuentes de datos que no inclyan la información que se supone
  que se va a extraer de ellas; y si se pone, por favor mostrar de dónde y cómo
  se va a extraer en vez de poner toda una página web entera o un PDF.
- La extracción de datos, salvo el paso de pdf a txt que se supone que se hace
  de alguna forma, tiene que hacerse *íntegramente* con código del
  estudiante. Si es un formato específico como CSV o XML el estudiante tendrá
  que procesar ese formato (o su texto) para extraer la información.
- Ningún problema que consista en calcular distancias sobre un mapa es
  factible. No se puede hacer sin un API, y las estimaciones no son realistas.
