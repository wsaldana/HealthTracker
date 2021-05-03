const { Router } = require('express');
const router = Router();

const { login, getUsuarios, getUsuario, getUsuarioByNombre, addUsuario, getHistorialById, addHistorial} = require('../controllers/index.controller');

router.get('/login', login);

router.get('/usuarios', getUsuarios);
router.get('/usuario/:id', getUsuario);
router.get('/usuarios/:nombre', getUsuarioByNombre);
router.post('/usuario/', addUsuario);

router.get('/historiales/:id', getHistorialById);
router.post('/historial/', addHistorial);

module.exports = router;