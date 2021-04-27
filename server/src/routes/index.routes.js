const { Router } = require('express');
const router = Router();

const { getUsuarios, getUsuario, getUsuarioByNombre, addUsuario } = require('../controllers/index.controller');

router.get('/usuarios', getUsuarios);
router.get('/usuario/:id', getUsuario);
router.get('/usuarios/:nombre', getUsuarioByNombre);

router.post('/usuario/', addUsuario);

module.exports = router;