exports.objetivo_msg = (objetivo) => {
  return "\t✔ Comprobando 🎯 Objetivo " + objetivo;
};

exports.all_good = (mensaje) => {
  return "✅🍊️‍🔥 " + mensaje;
};

exports.sorry = (mensaje) => {
  return "🍋💥❌ " + mensaje;
};

exports.ramaNoValidaMsg = (rama) => {
  return exports.sorry("😞 Lo sentimos mucho. Este Pull Request ha sido cerrado automáticamente porque has creado el PR desde tu rama `" + rama + "`.\n\n" +
        "**¿Por qué es esto un problema?**\n" +
        "- Trabajar directamente en la rama `" + rama + "` puede causar conflictos al hacer merge\n" +
        "- Es una mala práctica de Git que puede complicar tu flujo de trabajo\n" +
        "- Puede causar problemas al sincronizar tu fork con el repositorio original\n\n" +
        "**¿Cómo solucionarlo?**\n" +
        "1. Crea una nueva rama para tu trabajo: `git checkout -b nombre-de-tu-rama`\n" +
        "2. Haz tus cambios en esa nueva rama\n" +
        "3. Haz commit de tus cambios: `git commit -am \"Descripción de cambios\"`\n" +
        "4. Sube la rama: `git push origin nombre-de-tu-rama`\n" +
        "5. Crea un nuevo Pull Request desde esa rama\n\n" +
        "**Guías y recursos útiles:**\n" +
        "- [Guía específica para entrega de la práctica](https://jj.github.io/IV/documentos/proyecto/0.Repositorio#entrega-de-la-pr%C3%A1ctica)\n" +
        "- [Guía de branches en Git](https://git-scm.com/book/es/v2/Ramificaciones-en-Git-Procedimientos-B%C3%A1sicos-para-Ramificar-y-Fusionar)\n" +
        "- [Flujo de trabajo con Git](https://www.atlassian.com/es/git/tutorials/comparing-workflows)\n\n" +
        "Por favor, crea un nuevo Pull Request desde una rama que no sea `" + rama + "`.\n\n" +
        "¡Gracias! 🙂");
};

exports.compruebaYFalla = (core, expresion, falla, comprobado ) => {
  if ( expresion) {
    core.setFailed( exports.sorry(falla))
  } else {
    core.info( exports.all_good(comprobado) );
  }
};

// Helper to format a status line (title or body) without duplication
const _formatLine = (label, status, msg) => {
  let niceStatus = status === "ERROR" ?  `~~${status}~~` :  status ;
  let niceLabel = status === "ERROR" ? `❌ ${label}` : `✓ ${label}`;
  return (msg && msg.trim() !== '')
    ? `- ${niceLabel}: ${niceStatus} - ${msg}`
    : `- ${niceLabel}: ${niceStatus}`;
};

exports.generarResumen = (tituloStatus, tituloMsg, cuerpoStatus, cuerpoMsg) => {
  const lines = [];
  lines.push('## Resumen de comprobaciones');
  lines.push('');
  // Title line
  lines.push(_formatLine('Título', tituloStatus, tituloMsg));
  // Body line
  lines.push(_formatLine('Cuerpo', cuerpoStatus, cuerpoMsg));
  lines.push('');
  if (tituloStatus === 'ERROR' || cuerpoStatus === 'ERROR') {
    lines.push(exports.sorry('Se han encontrado errores. Consulta las instrucciones de entrega: https://jj.github.io/IV/documentos/proyecto/0.Repositorio#entrega-de-la-pr%C3%A1ctica'));
    lines.push('');
    lines.push('❌ Una o más comprobaciones fallaron.');
  } else {
    lines.push('✔ Todas las comprobaciones pasaron correctamente.');
  }
  return lines.join('\n');
};