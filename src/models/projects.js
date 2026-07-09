import db from './db.js'

const getAllProjects = async () => {
    const query = `
        SELECT sp.service_project_id, sp.organization_id, sp.service_project_title, sp.service_project_description, sp.service_project_location, sp.service_project_date, o.name AS organization_name
        FROM public.service_project sp
        JOIN public.organization o ON sp.organization_id = o.organization_id;
    `;

    const result = await db.query(query);

    return result.rows;
}

export { getAllProjects }










