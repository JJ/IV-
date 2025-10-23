exports.objetivo_msg = (objetivo) => {
  return "\t✔ Comprobando 🎯 Objetivo " + objetivo;
};

exports.all_good = (mensaje) => {
  return "✅🍊️‍🔥 " + mensaje;
};

exports.sorry = (mensaje) => {
  return "🍋💥❌ " + mensaje;
};

exports.compruebaYFalla = (core, expresion, falla, comprobado ) => {
  if ( expresion) {
    core.setFailed( exports.sorry(falla))
  } else {
    core.info( exports.all_good(comprobado) );
  }
};