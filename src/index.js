const express = require('express');
const app = express();

//Middlewares
app.use(express.json());
app.use(express.urlencoded({extended:false}));

//Creacion de rutas
app.use(require('./routes/index.routes'));

app.listen(3000);
console.log('Server on port 3000');

app.post("/register", (req, res) => {

    const username = req.body.username;
    const password = req.body.password;
  
       pool.query(
        "INSERT INTO usuario (id_usuario, contraseña) VALUES ($1, $2)",
        [username, password],
        (err, result) => {
          console.log(err);
          res.status(200).send("Usuario registrado");
        }
      );
    });
