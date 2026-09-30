# Errores comunes objetivo 1

En todos los objetivos es un error añadir cosas que no se
pidan. Impiden que el evaluador vea si efectivamente se está
cumpliendo el objetivo y añade más trabajo al mismo. Limitarse a
registrar como se ha seguido la metodología es esencial para una
corrección eficiente; y por otro lado, cada objetivo es un producto
mínimamente viable, por lo que añadir más de lo que se pide lo invalidaría.


## Sobre los milestones

1. Crear milestones con características o funcionalidades específicas. Los
   milestones son productos mínimamente viables y se describe como están
   empaquetados, no qué van a hacer, sobre todo porque el proceso de desarrollo
   no es determinista y no se sabe de antemano qué características se van a
   incluir en una versión determinada.

2. No empecéis a jugar con las palabras modelo, estructura, datos y miles de
   variantes al respecto. Lo que hace a un producto válido no es lo que
   contenga, al menos que puedas comprobar automáticamente si lo que contiene es
   correcto (por ejemplo, en el objetivo 4). Lo que lo hace válido es el proceso
   que se sigue. La "validez" es la forma que vosotros tenéis de comprobar si lo
   que se hace está bien, y por supuesto la persona que trabaje.

3. ¿Documentación en un directorio `/docs`? ¿En serio?

## Sobre las historias de usuario

1. Las historias del usuario, igual que el problema del objetivo 0, son también
   problemas. Decir "el usuario quiere" + lo que tú piensas que vas a programar
   no es una historia de usuario, es una tarea. La clave de las historias de
   usuario es que, al representar un problema, sirvan de base para su
   modelización en el objetivo 2/milestone 0 y para su testeo en el objetivo
   4/milestone 2.

2. Las historias de usuario, junto con el user journey si es necesario, son
   documentos de trabajo para su uso en el siguiente milestone. Tienen que
   contener todos los datos necesarios: los diferentes aspectos del problema,
   incluso las fuentes de datos que se vayan a usar. Si hay datos adicionales en
   el user journey, hay que enlazarlo. Los user journey son documentos que
   ayudan a entender el contexto y la información que tiene el cliente y por
   supuesto cómo y cuando necesita una solución.

## Sobre la estructura de archivos y personas

1. **Separar personas y jornadas de usuario:** Para mantener una organización limpia a medida que el proyecto escala, se aconseja estructurar la documentación en archivos independientes. Colocar las descripciones de las personas en un fichero específico y las jornadas de usuario en otro evita mezclar conceptos y facilita el mantenimiento futuro del repositorio, asegurando unas bases sólidas desde el principio.
2. **Referenciar los nuevos ficheros:** Si se opta por modularizar la documentación en varios archivos, es fundamental no olvidar enlazarlos y referenciarlos correctamente desde el `README.md` principal para que el evaluador pueda localizarlos sin fricciones.

## Sobre el flujo de trabajo en la interfaz web y directorios

1. **Uso de stubs en la interfaz web:** En esta fase inicial, el contenido expuesto directamente en la web de GitHub debe limitarse a stubs o plantillas de relleno básicas (por ejemplo, identificadores genéricos tipo `[HU001]` y títulos orientativos) cuya única finalidad sea pasar los tests de estructura iniciales.
2. **Ubicación del contenido real en `docs/`:** Las historias de usuario y artefactos reales deben residir y modificarse dentro del directorio `docs/`. El flujo de trabajo ideal consiste en mantener los stubs para la Pull Request, esperar el visto bueno del profesor sobre los documentos de `docs/` y, una vez hecho el merge, reemplazar los stubs por las versiones definitivas.
