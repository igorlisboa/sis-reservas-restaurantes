/* IMPORTS */
const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const knex = require('knex');
const app = express();

//ROTAS
const indexRouter = require('./routes/index');

const config = require('./config');

//conexao do banco de dados
// knex({
//     client: 'mysql',
//     connection: {
//         host : '127.0.0.1',
//         user : 'restabgd',
//         password : 'restabgd',
//         database : 'restauranteDoBigode'
//     }
// });

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

//inicialização das rotas que acessam os metodos HTTP(get,post,put,delete)
// aqui vai ter uma rota para direcionar para cada caso de uso e seus controllers
app.use('/', indexRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
