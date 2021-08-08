const express = require('express');
const app = express();
const { NODE_ENV } = require('../config');

//Middlewares
app.use(express.json());
app.use(express.urlencoded({extended:false}));
app.disable('etag');

//Creacion de rutas
app.use(require('./routes/index.routes'));

PORT = process.env.PORT || 3000
app.listen(PORT);
console.log('Server on port '+PORT);
