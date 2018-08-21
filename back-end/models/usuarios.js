const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const usuarioSchema = new Schema({
	username : String,
	senha : String,
	nome : String,
	perfil : Number
});

const Usuarios = mongoose.model('Usuarios', usuarioSchema);
module.exports = Usuarios;