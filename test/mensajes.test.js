const { test, mock } = require('node:test')
const assert = require('node:assert/strict')
const {
  objetivo_msg,
  all_good,
  sorry,
  ramaNoValidaMsg,
  compruebaYFalla
} = require('../lib/mensajes.js')

test('objetivo_msg incluye el número de objetivo', () => {
  assert.match(objetivo_msg(3), /Objetivo 3/)
})

test('all_good antepone el emoji de éxito al mensaje', () => {
  assert.equal(all_good('todo en orden'), '✅🍊️‍🔥 todo en orden')
})

test('sorry antepone el emoji de fallo al mensaje', () => {
  assert.equal(sorry('algo falló'), '🍋💥❌ algo falló')
})

test('ramaNoValidaMsg menciona la rama recibida y usa sorry', () => {
  const mensaje = ramaNoValidaMsg('master')
  assert.match(mensaje, /rama `master`/)
  assert.match(mensaje, /^🍋💥❌/)
})

test('compruebaYFalla llama a core.setFailed cuando la expresión es verdadera', () => {
  const core = { setFailed: mock.fn(), info: mock.fn() }

  compruebaYFalla(core, true, 'mensaje de falla', 'mensaje ok')

  assert.equal(core.setFailed.mock.callCount(), 1)
  assert.equal(core.setFailed.mock.calls[0].arguments[0], sorry('mensaje de falla'))
  assert.equal(core.info.mock.callCount(), 0)
})

test('compruebaYFalla llama a core.info cuando la expresión es falsa', () => {
  const core = { setFailed: mock.fn(), info: mock.fn() }

  compruebaYFalla(core, false, 'mensaje de falla', 'mensaje ok')

  assert.equal(core.info.mock.callCount(), 1)
  assert.equal(core.info.mock.calls[0].arguments[0], all_good('mensaje ok'))
  assert.equal(core.setFailed.mock.callCount(), 0)
})
