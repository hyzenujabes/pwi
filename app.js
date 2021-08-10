var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const dotenv = require('dotenv'); // AGREGUE YO
const session = require('express-session'); // AGREGUE YO
const {verifyUser, verifyAdmin} = require('./middlewares/auth'); // AGREGUE YO

dotenv.config();
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
const productos = require('./routes/productos'); // AGREGUE YO
const registro = require('./routes/registro'); //AGREGUE YO
const login = require('./routes/login'); // AGREGUE YO
const categorias = require('./routes/categorias'); // AGREGUE YO

const usuarios = require('./routes/usuarios'); // AGREGUE YO
const carrito = require('./routes/carrito'); // AGREGUE YO

const adminIndex = require ('./routes/admin/index'); // AGREGUE YO
const adminProductos = require ('./routes/admin/productos'); // AGREGUE YO
const adminCategorias = require ('./routes/admin/categorias'); // AGREGUE YO
const adminUsuarios = require ('./routes/admin/usuarios'); // AGREGUE YO
const adminEmpleados = require('./routes/admin/empleados'); // AGREGUE YO

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({ // AGREGUE YO
  secret: 'passwordSecreto',
  cookie: {maxAge : null},// vencimiento de sesion
  resave: true,
  saveUninitialized: false
}))

//TODO
app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/productos', productos);// AGREGUE YO
app.use('/registro', registro); // AGREGUE YO
app.use('/login', login); // AGREGUE YO
app.use('/categorias', categorias);// AGREGUE YO

app.use('/usuarios', usuarios);
app.use('/carrito',  carrito);

//ADMIN
app.use('/admin', verifyAdmin, adminIndex); // AGREGUE YO
app.use('/admin/productos', adminProductos); // AGREGUE YO
app.use('/admin/usuarios', adminUsuarios); // AGREGUE YO
app.use('/admin/empleados', adminEmpleados); // AGREGUE YO
app.use('/admin/categorias', adminCategorias); // AGREGUE YO

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
