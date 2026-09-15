# Semana del 16 de septiembre; comienzo del curso

> Si no entiendes bien esto a la primera lectura, lee el [COMO](COMO.md)

Agradeceré que contestes la [encuesta
inicial]()
si no lo has hecho ya.

Se recuerda al estudiante que es su obligatorio asistir a clase o, si está
justificado, enterarse de los contenidos impartidos en la misma a través de esta
web, el grupo de Telegram o los compañeros. Se recomienda encarecidamente, en
todo caso, asistir al menos a las primeras clases, incluso pidiendo tiempo en el
trabajo, al menos hasta que complete el [segundo
objetivo](http://jj.github.io/IV/documentos/proyecto/2.Modelo).

## Antes de la clase

Se habrá recibido un correo electrónico con instrucciones y se habrá tenido que
aceptar la invitación al grupo de Telegram (tutorías grupales) de la asignatura.

Lista de comprobación:

  * ¿Estáis en el grupo de Telegram?
  * ¿Habéis inscrito vuestros nicks tras solicitar acceso a la hoja de cálculo
    compartida?
  * ¿Os habéis abierto cuenta en GitHub o configurado para usarla desde el
    equipo que vayáis a usar en clase?

## Objetivos a cubrir en la semana

1. Entender la metodología docente, de evaluación y de interacción de la asignatura.
2. Darse de alta (si no se está) y comprender el funcionamiento básico de GitHub
   y el grupo de Telegram de la asignatura (se debe haber recibido una
   invitación en el correo de la UGR) y conocer el resto de los recursos de la
   misma.
2. Entender el concepto de software libre y su aplicación práctica en esta asignatura.
3. [Entender como enfocar el aprendizaje en ingeniería](https://www.youtube.com/watch?v=HLXrAdK1iZ4)
4. Entender y entregar el
   [objetivo
   0](http://jj.github.io/IV/documentos/proyecto/0.Repositorio) en la primera
   clase o la siguiente.
5. Entender qué es lo que se evalúa y por qué. Se trata de aprender metodologías
   y aplicarlas para obtener un resultado, ** *no* de poner un resultado y luego
   decir que se han aplicado metodologías**.
6. Entender el proceso de *design thinking* y comenzarlo para entender
   el problema que se va a abordar en la asignatura.
7. Empezar a usar git y GitHub (o usarlo más intensamente). Por
   ejemplo, [seguir este
   vídeo](https://www.youtube.com/watch?v=gmXyJI01qa8) o cualquier
   otro tutorial online, tal como
   [este](https://learngitbranching.js.org/?locale=es_ES).

## Contenidos

### Clases divididas ( de septiembre)

* Presentación del profesor de la asignatura.
* Enlaces a los recursos:
  * Presentación de los recursos de la asignatura: [web](http://jj.github.io/IV) y
  el grupo de Telegram.
  * [Visión general de la
  asignatura](https://grados.ugr.es/informatica/pages/infoacademica/guias_docentes/curso_actual/cuarto/tecnologiasdelainformacion/infraestructuravirtual).
  * Metodología docente:
  [Clase invertida](http://www.tecnologiasparalaeducacion.es/la-clase-inversa-flip-classroom-tecnologias/), y evaluación formativa
  incluyendo eliminación de la distinción teoría/prácticas y las
  consecuencias que trae.
  * [Metodología y criterios de evaluación](../Metodología_y_criterios_de_evaluación.md).
  * Bases de la evaluación formativa, basada en objetivos:
    * Los objetivos se pre-evalúan automáticamente usando sistemas
  integrados en GitHub. Cuando los indicadores están en rojo, es que
  ha habido algún error. Hay que pinchar en el mismo y navegar hasta
  encontrar el error concreto en la página del sistema que lanza los
  tests.
    * *Cómo se va a usar la evaluación formativa*: los tests automáticos indicarán
  si se han alcanzado los objetivos mínimos, a través del pull request que se
  haga se indicará qué es necesario para cubrir el resto de los objetivos. Los
  objetivos alcanzados se calificarán al final de la asignatura según la
  dificultad de los mismos.
    * En el momento que se alcance el quinto objetivo, se puede
    solicitar al profesor calificación del 30% restante para
    abandonar, si se desea, la asignatura.
    * Para "entregar" cada objetivo:
      * Se crea una rama específica por objetivo en el repositorio del proyecto
      *del estudiante*.
      * Se hace un PR **a uno mismo, en el mismo repositorio** indicando qué
    cambios se han hecho para alcanzar este objetivo *y siguiendo la lista de
    comprobación*.
    * Se incluye en el fichero `objetivos-x.md` *de este repositorio*
    un *enlace al pull request* desde el que se esté haciendo el PR.
    * En la columna correspondiente se tendrá que incluir una versión del envío
      siguiendo las reglas comunes en versiones, y las indicadas en el guión del
      objetivo. Si han fallado los tests y hay que enviar de nuevo, habrá que
      incrementar la versión.
    * Una vez fusionado el PR *en este repositorio*, el profesor revisará el PR
      *del estudiante* haciendo indicaciones para que el estudiante supere el
      objetivo en otro caso.
    * Hay que esperar que el profesor apruebe el PR *de nuestro repositorio*, es
    decir, el objetivo se considere alcanzado, para fusionarlo.

* **Juego de rol**: formular y entender un problema para abordar en la asignatura.

#### Entrando en materia

* Introducción al [desarrollo ágil](https://jj.github.io/IV/preso/agil.html) y el software libre. Los proyectos que se
  presenten *son software libre* y por tanto no pueden ser privados *todo el
  tiempo*. Se le pedirá al estudiante que cuando no estén bajo evaluación se
  mantengan privados, sin embargo.
* Cómo trabajar remotamente o llevar al día la asignatura. Respondiendo a la
  pregunta: ¿asistir a clase es obligatorio?
* Entender git a través de esta [introducción a
git](http://jj.github.io/IV/preso/git.html#/), y las buenas prácticas de uso de
GitHub.
* [Entender el objetivo 0](http://jj.github.io/IV/documentos/proyecto/0.Repositorio) que se revisará
sobre la marcha (dentro de lo posible).

#### *Design* thinking y cómo usarlo para formular problemas a resolver en informática.

[Sigue estas instrucciones](http://jj.github.io/IV/documentos/actividades/juego-rol-design-thinking).

> Os ruego que una vez terminada la actividad, [rellenéis este formulario para
> evaluarla](https://docs.google.com/forms/d/e/1FAIpQLScAOYA-114fbgh7pDsKH0g_iqm4yOzlOOH1GvzSL8t-IIomlw/viewform)

Una vez esté el problema (que se va a resolver en la asignatura) validado, se puede proceder a entregar el
objetivo 0, siguiendo las
[instrucciones](http://jj.github.io/IV/documentos/proyecto/0.Repositorio)
(que también están detalladas más abajo).

#### Al final de esta clase: Objetivos mínimos

Se habrá dado de alta GitHub (si no se está), inicializado el repositorio con el
proyecto, entendido qué se espera del estudiante en la asignatura.

### Sesión conjunta (día  de septiembre)

Comenzaremos con el hackatón. La **asistencia al hackatón** es obligatoria
durante las primeras 8 semanas de clase.

  * Se trabajará en equipo en un proyecto a elegir entre
  [este](https://github.com/danibarranqueroo/TransporteEquitativo) y
  [este](https://github.com/smallPingu/antiTarjetas).


#### En caso de que haya tiempo

Comenzar con el siguiente [objetivo del
proyecto](http://jj.github.io/IV/documentos/proyecto/1.Infraestructura),
explicando los objetivos correspondientes [contenidos en la siguiente
semana](semana-02.md).

## Material de la asignatura

Todo [el material de la asignatura está en GitHub](http://jj.github.io/IV).

Texto del [objetivo cero de la
asignatura](http://jj.github.io/IV/documentos/proyecto/0.Repositorio).

## Siguientes sesiones

[Segunda semana](semana-02.md)
