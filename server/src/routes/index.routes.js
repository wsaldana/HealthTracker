const { Router } = require('express');
const router = Router();

const { login, 
    getUsuarios, getUsuario, getUsuarioByNombre, addUsuario, getPacientesByMedico,
    getHistoriales, getHistorialById, addHistorial,  
    addRegistroSintomas, getListRegistrosSintomas, getRegistroSintomas } = require('../controllers/index.controller');

router.get('/login', login);

router.get('/usuarios', getUsuarios);
router.get('/usuario/:id', getUsuario);
router.get('/usuarios/:nombre', getUsuarioByNombre);
router.get('/usuariosByMedico/:id_medico', getPacientesByMedico);
router.post('/usuario/', addUsuario);

router.get('/historiales', getHistoriales);
router.get('/historiales/:id', getHistorialById);
router.post('/historial', addHistorial);

router.get('/listaSintomas/:id_usuario', getListRegistrosSintomas)
router.get('/sintomas', getRegistroSintomas)
router.post('/sintomas', addRegistroSintomas)

module.exports = router;