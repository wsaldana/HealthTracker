const { Router } = require('express');
const router = Router();

const { login, 
    getUsuarios, getUsuario, getUsuarioByNombre, addUsuario, getPacientesByMedico,
    getHistoriales, getHistorialById, addHistorial,  
    addRegistroSintomas, getListRegistrosSintomas, getRegistroSintomas, 
    getResumenSintomasDolorDeCabeza, getResumenSintomaMolestiaEspaladaBaja, getResumenSintomaDiarrea, getResumenSintomaSangrados, getResumenSintomaCalambres, getResumen 
} = require('../controllers/index.controller');

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

router.get('/sintomas/DolorCabezaResumen/:id_usuario', getResumenSintomasDolorDeCabeza)
router.get('/sintomas/MolestiaEspaldaBajaResumen/:id_usuario', getResumenSintomaMolestiaEspaladaBaja)
router.get('/sintomas/DiarreaResumen/:id_usuario', getResumenSintomaDiarrea)
router.get('/sintomas/SangradosResumen/:id_usuario', getResumenSintomaSangrados)
router.get('/sintomas/SangradosResumen/:id_usuario', getResumenSintomaCalambres)
router.get('/sintomas/resumen/:id_usuario', getResumen)

module.exports = router;