import db from './db.js'

const getAllProjects = async () => {
    const query = `
        SELECT sp.service_project_id, sp.organization_id, sp.service_project_title, sp.service_project_description, sp.service_project_location, sp.service_project_date, o.name AS organization_name
        FROM service_project sp
        JOIN organization o ON sp.organization_id = o.organization_id;
    `;

    const result = await db.query(query);

    return result.rows;
}

const getProjectsByOrganizationId = async (organizationId) => {
    const query = `
        SELECT
            service_project_id,
            organization_id,
            service_project_title,
            service_project_description,
            service_project_location,
            service_project_date
        FROM service_project
        WHERE organization_id = $1
        ORDER BY service_project_date;
      `;

    const queryParams = [organizationId];
    const result = await db.query(query, queryParams);

    return result.rows;
};

const getUpcomingProjects = async (number_of_projects) => {
    const query = `
        SELECT
            sp.service_project_id,
            sp.service_project_title,
            sp.service_project_description,
            sp.service_project_date,
            sp.service_project_location,
            sp.organization_id,
            o.name AS organization_name
        FROM service_project sp
        JOIN organization o ON sp.organization_id = o.organization_id
        WHERE sp.service_project_date >= CURRENT_DATE
        ORDER BY sp.service_project_date ASC
        LIMIT $1;
    `;

    const queryParams = [number_of_projects];
    const result = await db.query(query, queryParams);

    return result.rows;
};

const getProjectDetails = async (id) => {
    const query = `
        SELECT
            sp.service_project_id,
            sp.service_project_title,
            sp.service_project_description,
            sp.service_project_date,
            sp.service_project_location,
            o.organization_id,
            o.name AS organization_name
        FROM service_project sp
        JOIN organization o ON sp.organization_id = o.organization_id
        WHERE sp.service_project_id = $1;
    `;

    const queryParams = [id];
    const result = await db.query(query, queryParams);

    return result.rows[0];
};


// Export the model functions
export { getAllProjects, getProjectsByOrganizationId, getUpcomingProjects, getProjectDetails };










