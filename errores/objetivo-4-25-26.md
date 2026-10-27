# Error en todos los objetivos a partir de este

- Los comentarios tienen que resolverse *siempre* con un cambio en la línea
  indicada, porque si hay un comentario, es porque hay alguna cosa adicional que
  hay que considerar o bien lo que se ha explicado no se ha hecho con suficiente
  claridad y por eso no lo entiende quien revisa.

# Errores frecuentes objetivo 4

- Crear un solo issue para "resolver la lógica de negocio" es un error bastante
  grave, y normalmente conduce a una serie de iteraciones sin ningún tipo de
  avance. Por favor, leed los siguientes errores comunes.

- El mayor esfuerzo tiene que estar en la creación de los issues
  pensando siempre en el principio de responsabilidad única: cada
  función debe hacer una cosa y solo una. Así es más fácil de testear
  y también de implementar.

- No se debe pensar en la implementación hasta que se hayan planteado
  bien todos los issues. Y recordad que un issue debe ser un problema.

- Definir bien los errores es fundamental; hay que tener en cuenta que
  en los tests se debe de testear también el "camino infeliz", es
  decir, caso en que ocurra algún error o la entrada sea incorrecta.
