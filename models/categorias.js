const pool = require ('./../utils/bd');

const getAll = async () => {
    const query = "SELECT * FROM ??"
    const params = [process.env.T_CATEGORIAS]
    return await pool.query(query, params);
}

const getSingle = async (id) => {
    const query = "SELECT id, nombre, descripcion FROM ?? WHERE eliminado = 0"
    const params = [process.env.T_CATEGORIAS, id];
    const rows = await pool.query (query, params);
    return rows;
}

const create = async(obj) => {
    const query = "INSERT INTO ?? SET ?"
    const params = [process.env.T_CATEGORIAS, obj];
    return await pool.query(query, params);
}

const update = async (id) => {
    const query = "UPDATE ?? SET ? WHERE id = ?";
    const params = [process.env.T_CATEGORIAS, obj, id];
    return await pool.query(query, params);
}

const del = async (id) => {
    const query = "UPDATE ?? SET eliminado = 1 WHERE id = ?"
    const params = [process.env.T_CATEGORIAS, id];
    return await pool.query(query, params);
}

    module.exports = {getAll, getSingle, create, update, del};