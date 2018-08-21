const User = require('./models/usuarios');

const configureDefaultUser = async () => {
	let users = await User.find({});
	if (users[0]) return;
	let userDefault = new User({
		username : 'admin',
		senha : 'senha',
		nome : 'nome',
		perfil : 2
	})
	await userDefault.save();
	console.info('Banco de dados conectado')
};

module.exports = {
	configureDefaultUser
};