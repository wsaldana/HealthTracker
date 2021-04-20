const { Pool } = require('pg');

const pool = new Pool({
    host: 'queenie.db.elephantsql.com',
    user: 'liomrjgg',
    password: '0FHVBpKg_av5L96hvsXoMdWlbSRf2n7a',
    database: 'liomrjgg',
    port: '5432'
});

const get = async (req, res) => {
    const response = await pool.query("SELECT * FROM usuarios");
    res.json(response.rows[0]);
}

module.exports = { get}