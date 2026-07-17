import db from './db.js'

const getAllCategories = async () => {
    const query = `
        SELECT category_id, category_name
        FROM public.category;
    `;

    const result = await db.query(query);

    return result.rows;
};

const getCategoryDetails = async (categoryId) => {
    const query = `
        SELECT category_id, category_name
        FROM category
        WHERE category_id = $1;
    `;

    const queryParams = [categoryId];
    const result = await db.query(query, queryParams);

    return result.rows[0];
};

const getCategoriesByProjectId = async (projectId) => {
    const query = `
        SELECT c.category_id, c.category_name
        FROM category c
        JOIN service_project_category spc ON c.category_id = spc.category_id
        WHERE spc.service_project_id = $1;
    `;

    const queryParams = [projectId];
    const result = await db.query(query, queryParams);

    return result.rows;
};

const getProjectsByCategoryId = async (categoryId) => {
    const query = `
        SELECT
            sp.service_project_id,
            sp.organization_id,
            sp.service_project_title,
            sp.service_project_description,
            sp.service_project_location,
            sp.service_project_date
        FROM service_project sp
        JOIN service_project_category spc ON sp.service_project_id = spc.service_project_id
        WHERE spc.category_id = $1;
    `;

    const queryParams = [categoryId];
    const result = await db.query(query, queryParams);

    return result.rows;
};

export { getAllCategories, getCategoryDetails, getCategoriesByProjectId, getProjectsByCategoryId };
