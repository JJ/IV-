exports.objetivo_msg = (objetivo) => {
  return "\t✔ Comprobando 🎯 Objetivo " + objetivo;
};

exports.all_good = (mensaje) => {
  return "✅🍊️‍🔥 " + mensaje;
};

exports.sorry = (mensaje) => {
  return "🍋💥❌ " + mensaje;
};

exports.compruebaYFalla = (expresion, falla, comprobado ) => {
  if ( expresion) {
    core.setFailed( sorry(falla))
  } else {
    core.info( all_good(comprobado) );
  }
};