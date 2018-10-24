const mysql = require('mysql');

const config = require('../config');

/**
 * Busca as reservas ja feitas nos proximos 30 dias
 */

consultarMesasDisponiveis = (req, res) => {
    console.log(req);
    var data = req.query.data;
    var hora = req.query.hora;

    let  db = mysql.createConnection(config);
    db.connect();
    db.query("SELECT * FROM `reservas` WHERE `data` = "+data+" AND `horario` = "+hora+";",
        (err, result)=>{
            if(err){
                res.status(400).json({ fail : {err}});
                throw err;
            }
            db.end();
            res.status(200).json({ success: { result }});
        })
};


/**
 *
 * @param req
 * @param res
 */
salvaReservas = (req, res) => {
    var reserva = req.body;
    let  db = mysql.createConnection(config);
    db.connect();
    db.query("INSERT INTO reservas set ?", reserva,
		(err, result)=>{
            if(err){
				res.status(400).json({ fail : {err}});
                throw err;
			}
			db.end();
            res.status(200).json({ success: { result }});
        })
};


module.exports = {
    salvaReservas,
    consultarMesasDisponiveis

}

// "INSERT INTO `usuarios` (`nome_usuario`, `email`, `telefone`) VALUES ('"+novoUsuario.nome+"', '"+novoUsuario.email+"', '"+novoUsuario.telefone+"')"
