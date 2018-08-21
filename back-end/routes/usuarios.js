const express = require('express');
const Usuarios = require('../models/usuarios');

const router = express.Router();
const UsuariosController = require('../controllers/usuarios');

/* rotas que dão acesso aos controladores das suas funcionalidades */
//GET consulta Usuarios: retorna lista com todos os usuarios registrdos no bd
router.route('/')
	.get(UsuariosController.index);

//POST salva novo usuario
router.route('/')
	.post(UsuariosController.save);

//PUT atualiza usuario
router.route('/')
	.put(UsuariosController.update);

//PUT atualiza usuario
router.route('/')
	.delete(UsuariosController.del);

module.exports = router;