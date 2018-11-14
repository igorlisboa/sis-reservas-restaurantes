const mysql = require('mysql');

const config = require('../config');

/**
 * Busca as reservas ja feitas nos proximos 30 dias
 */

consultarMesasDisponiveis = (req, res) => {
    // console.log(req);
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
    var reserva = {...req.body};
    var data = req.body.data;
    data = data.slice(0,10);
    var hora = req.body.horario;

    // console.log(req);
    var  db = mysql.createConnection(config);
    db.connect();
    db.query("SELECT * FROM `reservas` WHERE `data` = '"+data+"' AND `horario` = '"+hora+"';",
        (err, response)=>{
            if(err){
                res.status(400).json({ fail : {err}});
                throw err;
            }
            var qtdTotalMesas = 0;
            var teste = response;
            var sucesso = { success: { result : teste }};
            if(sucesso.success){
                if(sucesso.success.result.length > 0){
                    sucesso.success.result.forEach(x => {
                        qtdTotalMesas += x.qtd_mesas;
                    });
                }
                if((Number(qtdTotalMesas) + Number(req.body.qtd_mesas)) > 15){
                    console.error("Quantidades de mesas indisponivel. Temos apenas: "+((qtdTotalMesas - 15)*-1));
                    res.status(401).send("Quantidades de mesas indisponivel. Temos apenas: "+((qtdTotalMesas - 15)*-1));
                    db.end();
                }else {
                    db.query("INSERT INTO reservas set ?", reserva,
                        (err, result)=>{
                            if(err){
                                res.status(400).json({ fail : {err}});
                                throw err;
                            }
                            db.end();
                            res.status(200).json({ success: { result }});
                        })
                }
            }else{
                db.end();
            }
        });
};


module.exports = {
    salvaReservas,
    consultarMesasDisponiveis

}

// "INSERT INTO `usuarios` (`nome_usuario`, `email`, `telefone`) VALUES ('"+novoUsuario.nome+"', '"+novoUsuario.email+"', '"+novoUsuario.telefone+"')"
