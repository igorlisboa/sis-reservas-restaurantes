const express = require('express');
const router = express.Router();

const controllers = require('../controllers');


/* GET home page. */
router.get('/', (req, res, next) =>{res.send('ok')});

/**
 * Usuarios
 * @type {Router|router}
 */
// router.get('/usuario/', controllers.usuarios.);
router.post('/usuario/novoUsuario', controllers.usuarios.salvaUsuario);
router.post('/reserva', controllers.reservas.salvaReservas);
router.get('/reserva/consulta', controllers.reservas.consultarMesasDisponiveis);
// router.delete('/usuario/', controllers.usuarios.);

module.exports = router;
