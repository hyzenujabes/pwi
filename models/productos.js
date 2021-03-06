const pool = require('./../utils/bd');

const getAll = async () => {
    const query = "SELECT p.id, p.nombre, p.descripcion, p.precio, p.stock, c.nombre AS nombreCategoria FROM ?? AS p JOIN ?? AS c WHERE p.id_categoria = c.id AND p.eliminado = 0";
    const params = [process.env.T_PRODUCTOS, process.env.T_CATEGORIAS];
    const rows = await pool.query (query, params);
    return rows;
}
const getSingle = async (id) =>{
    const query = "SELECT p.id, p.nombre, p.descripcion, p.precio, p.stock, p.id_categoria, c.nombre AS nombreCategoria FROM ?? AS p JOIN ?? AS c ON p.id_categoria = c.id WHERE p.id = ? AND p.eliminado = 0";
    const params = [process.env.T_PRODUCTOS, process.env.T_CATEGORIAS, id];
    const rows = await pool.query (query, params);
    return rows;
}
const create = async(obj) => {
    const query = "INSERT INTO ?? SET ?"
    const params = [process.env.T_PRODUCTOS, obj];
    return await pool.query(query, params);
}
const update = async (id, obj) => {
    const query = "UPDATE ?? SET ? WHERE id = ?";
    const params = [process.env.T_PRODUCTOS, obj, id];
    return await pool.query(query, params);
}
const del = async (id) => {
    const query = "UPDATE ?? SET eliminado = 1 WHERE id = ?"
    const params = [process.env.T_PRODUCTOS, id];
    return await pool.query(query, params);
}
const getNombre = async (nombre) => {
    const query = "SELECT p.id, p.nombre, p.descripcion, p.precio, p.stock, p.id_categoria, c.nombre AS nombreCategoria FROM ?? AS p JOIN ?? AS c ON p.id_categoria = c.id WHERE p.nombre LIKE ? AND p.eliminado = 0";
    const params = [process.env.T_PRODUCTOS, process.env.T_CATEGORIAS, nombre];
    const rows = await pool.query (query, params);
    return rows;
}

module.exports = {getAll, getSingle, create, update, del, getNombre};