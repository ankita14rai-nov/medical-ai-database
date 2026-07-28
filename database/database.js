const { Pool } = require("pg");

const pool = new Pool({
    host: "localhost",
    port: 5433,
    database: "medical_ai",
    user: "postgres",
    password: "priya@45"
});

module.exports = pool;