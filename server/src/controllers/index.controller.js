const { Pool } = require('pg');
const parameters = require('./parameters');

const pool = new Pool(parameters);

const login = async(req, res) => {
    const { email, password } = req.headers;
    const response = await pool.query("SELECT * FROM usuarios WHERE correo=$1 AND contrasena=crypt($2, contrasena)", [email, password]);
    if(response.rowCount === 1){
        res.json({
            statusCode: 200,
            body: response.rows[0]
        });
    }else{
        res.json({
            statusCode: 404
        });
    }
};

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
    const {nombre, correo, contrasena, telefono, historial} = req.body;
    console.log(req)
    const response = await pool.query("INSERT INTO usuarios VALUES (default, $1, $2, crypt($3, gen_salt('bf')), $4, $5)", [nombre, correo, contrasena, telefono, historial]);
    res.json({
        statusCode: 200,
        message: 'User added',
        body: {
            user: {nombre, correo, contrasena, telefono, historial}
        }
    })
};

const getHistoriales = async (req, res) => {
    const response = await pool.query('SELECT * FROM historial_medico');
    res.json({rows: response.rows});
};

const getHistorialById = async(req, res) => {
    const response = await pool.query("SELECT * FROM historial_medico WHERE id_historial=$1", [req.params.id]);
    res.json(response.rows[0]);
}

const addHistorial = async (req, res) => {
    const {tipo_de_sangre, padecimientos, cirugias, enfermedades_hereditarias} = req.body;
    const response = await pool.query("INSERT INTO historial_medico VALUES (default, $1, $2, $3, $4)", [tipo_de_sangre, padecimientos, cirugias, enfermedades_hereditarias]);
    res.json({
        statusCode: 200,
        message: 'Historial agregado',
        body: {
            medical_history: {tipo_de_sangre, padecimientos, cirugias, enfermedades_hereditarias}
        }
    })
};

module.exports = { 
    login,
    getUsuarios,
    getUsuario,
    getUsuarioByNombre,
    addUsuario,
    getHistoriales,
    getHistorialById,
    addHistorial
}