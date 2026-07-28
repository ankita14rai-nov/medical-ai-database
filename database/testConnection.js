const pool = require("./database");

async function testConnection() {
    try {
        const result = await pool.query("SELECT NOW();");
        console.log("✅ Database Connected Successfully!");
        console.log("Current Time:", result.rows[0]);
    } catch (error) {
        console.error("❌ Database Connection Failed!");
        console.error(error.message);
    } finally {
        await pool.end();
    }
}

testConnection();