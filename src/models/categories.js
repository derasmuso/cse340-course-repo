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

const assignCategoryToProject = async (categoryId, projectId) => {
    const query = `
        INSERT INTO service_project_category (category_id, service_project_id)
        VALUES ($1, $2);
    `;

    await db.query(query, [categoryId, projectId]);
};

const updateCategoryAssignments = async (projectId, categoryIds) => {
    // First, remove existing category assignments for the project
    const deleteQuery = `
        DELETE FROM service_project_category
        WHERE service_project_id = $1;
    `;
    await db.query(deleteQuery, [projectId]);

    // Next, add the new category assignments
    for (const categoryId of categoryIds) {
        await assignCategoryToProject(categoryId, projectId);
    }
};



export { getAllCategories, getCategoryDetails, getCategoriesByProjectId, getProjectsByCategoryId, assignCategoryToProject, updateCategoryAssignments };
