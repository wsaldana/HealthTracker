const express = require('express');
const app = express();

//Middlewares
app.use(express.json());
app.use(express.urlencoded({extended:false}));
app.disable('etag');

//Creacion de rutas
app.use(require('./routes/index.routes'));

app.listen(3000);
console.log('Server on port 3000');
