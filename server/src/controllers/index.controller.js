const { Pool } = require('pg');
const { NODE_ENV } = require('../../config');

const pool = new Pool({
    'host': process.env.DB_HOST,
    'user': process.env.DB_USER,
    'password': process.env.DB_PASSWORD,
    'database': process.env.DB_DATABASE,
    'port': process.env.DB_PORT
});

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

const getPacientesByMedico = async (req, res) => {
    const response = await pool.query("SELECT * FROM usuarios u INNER JOIN historial_medico hm ON u.historial_medico = hm.id_historial WHERE u.medico = $1", [req.params.id_medico]);
    res.json(response.rows);
}

const addRegistroSintomas = async (req, res) => {
    console.log(req.body)
    const {dolor_cabeza, molestia_espalda_baja, diarrea, sangrados, calambres, fecha, trimestre ,id_usuario} = req.body;
    const response = await pool.query("INSERT INTO sintomas VALUES ($1, $2, $3, $4, $5, $6, $7, default, $8)", [dolor_cabeza, molestia_espalda_baja, diarrea, sangrados, calambres, fecha, id_usuario, trimestre]);
    res.json({
        statusCode: 200,
        message: 'Symptoms added',
        body: {
            symptoms: {dolor_cabeza, molestia_espalda_baja, diarrea, sangrados, calambres, fecha, id_usuario, trimestre}
        }
    })
}

const getListRegistrosSintomas = async (req, res) => {
    const response = await pool.query("SELECT * FROM sintomas WHERE id_usuario = $1", [req.params.id_usuario]);
    res.json(response.rows);
}

const getRegistroSintomas = async (req, res) => {
    const { id_usuario, fecha } = req.headers;
    let response;
    if(fecha){
        response = await pool.query("SELECT * FROM sintomas WHERE id_usuario = $1 AND fecha = $2", [id_usuario, fecha]);
    }else{
        response = await pool.query("SELECT * FROM sintomas WHERE id_usuario = $1 ORDER BY fecha DESC LIMIT 1", [id_usuario]);
    }
    res.json(response.rows);
}

const getResumenSintomasDolorDeCabeza = async (req, res) => {
    const response = await pool.query("Select  dolor_cabeza, fecha, trimestre from sintomas where id_usuario=$1 ", [req.params.id_usuario]);
    res.json(response.rows);
}

const getResumenSintomaMolestiaEspaladaBaja = async (req, res) => {
    const response = await pool.query("Select  molestia_espalda_baja, fecha, trimestre from sintomas where id_usuario=$1 ", [req.params.id_usuario]);
    res.json(response.rows);
}

const getResumenSintomaDiarrea = async (req, res) => {
    const response = await pool.query("Select  diarrea, fecha, trimestre from sintomas where id_usuario=$1 ", [req.params.id_usuario]);
    res.json(response.rows);
}

const getResumenSintomaSangrados = async (req, res) => {
    const response = await pool.query("Select  sangrados, fecha, trimestre from sintomas where id_usuario=$1 ", [req.params.id_usuario]);
    res.json(response.rows);
}

const getResumenSintomaCalambres = async (req, res) => {
    const response = await pool.query("Select  calambres, fecha, trimestre from sintomas where id_usuario=$1 ", [req.params.id_usuario]);
    res.json(response.rows);
}

const getResumen = async (req, res) => {
    const response = await pool.query("Select  fecha, dolor_cabeza, molestia_espalda_baja, diarrea, sangrados, calambres, trimestre from sintomas where id_usuario=$1 ", [req.params.id_usuario]);
    res.json(response.rows);
}

const getTrimestre = async (req, res) => {
    const response = await pool.query("Select trimestre, from sintomas where id_usuario=$1 ", [req.params.id_usuario]);
    res.json(response.rows);
}


module.exports = { 
    login,
    getUsuarios,
    getUsuario,
    getUsuarioByNombre,
    addUsuario,
    getHistoriales,
    getHistorialById,
    addHistorial,
    getPacientesByMedico,
    addRegistroSintomas,
    getListRegistrosSintomas,
    getRegistroSintomas,
    getResumenSintomasDolorDeCabeza,
    getResumenSintomaMolestiaEspaladaBaja,
    getResumenSintomaDiarrea,
    getResumenSintomaSangrados,
    getResumenSintomaCalambres,
    getResumen,
    getTrimestre
}