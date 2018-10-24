const mysql = require('mysql');

const config = require('../config');

salvaUsuario = (req, res) => {
	let novoUsuario = req.body.usuario;
	let  db = mysql.createConnection(config);
	db.connect();
    // db.query("INSERT INTO `usuarios` (`nome`, `email`, `telefone`) VALUES ( '"+novoUsuario.nome+"', '"+novoUsuario.email+"', '"+novoUsuario.telefone+"');",
        db.query("INSERT INTO usuarios SET ?", novoUsuario,
		(err, result)=>{
			if(err){
				res.status(400).json({ fail : {err}});
                throw err;
			}
            db.end();
            res.json(JSON.stringify({ success: { result }}));
           	res.status(200);//.send({ success: { result }});//.json({ success: { result }});
        })
};

buscaPorEmail = (req, res)=>{
	let email = req.body.email;
    let  db = mysql.createConnection(config);
    db.connect();
	db.query();
	db.end();
};

module.exports = {

	salvaUsuario,
	buscaPorEmail

}

// "INSERT INTO `usuarios` (`nome_usuario`, `email`, `telefone`) VALUES ('"+novoUsuario.nome+"', '"+novoUsuario.email+"', '"+novoUsuario.telefone+"')"
