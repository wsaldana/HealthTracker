const { Pool } = require('pg');

const pool = new Pool({
    host: 'queenie.db.elephantsql.com',
    user: 'liomrjgg',
    password: '0FHVBpKg_av5L96hvsXoMdWlbSRf2n7a',
    database: 'liomrjgg',
    port: '5432'
});

const getUsuarios = async (req, res) => {
    const response = await pool.query('SELECT * FROM usuarios');
    res.json({rows: response.rows});
};

const getUsuario = async(req, res) => {
    const response = await pool.query("SELECT * FROM usuarios WHERE id_usuario=$1", [req.params.id]);
    res.json(response.rows[0]);
}
 
const getUsuarioByNombre = async(req, res) => {
    const response = await pool.query("SELECT * FROM usuarios WHERE LOWER(nombre) LIKE LOWER('%"+req.params.nombre+"%')");
    res.json(response.rows[0]);
}

const addUsuario = async (req, res) => {
    const {nombre, correo, contrasena, telefono, historial} = req.query;
    const response = await pool.query("INSERT INTO usuarios VALUES (default, $1, $2, crypt($3, gen_salt('bf')), $4, $5)", [nombre, correo, contrasena, telefono, historial]);
    res.json({
        message: 'User added',
        body: {
            user: {nombre, correo, contrasena, telefono, historial}
        }
    })
};

module.exports = { 
    getUsuarios,
    getUsuario,
    getUsuarioByNombre,
    addUsuario
}