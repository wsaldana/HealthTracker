const { Router } = require('express');
const router = Router();

const { get } = require('../controllers/index.controller');

router.get('', get);

module.exports = router;