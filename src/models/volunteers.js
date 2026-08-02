import db from './db.js'

const volunteerForProject = async (userId, projectId) => {
    const query = `
        INSERT INTO volunteers (user_id, service_project_id)
        VALUES ($1, $2)
        ON CONFLICT (user_id, service_project_id) DO NOTHING
        RETURNING user_id, service_project_id;
    `;
    const result = await db.query(query, [userId, projectId]);
    return result.rows[0];
};

const cancelVolunteer = async (userId, projectId) => {
    const query = `
        DELETE FROM volunteers
        WHERE user_id = $1 AND service_project_id = $2;
    `;
    await db.query(query, [userId, projectId]);
};

const getProjectsForUser = async (userId) => {
    const query = `
        SELECT sp.service_project_id, sp.service_project_title, sp.service_project_date
        FROM service_project sp
        JOIN volunteers v ON sp.service_project_id = v.service_project_id
        WHERE v.user_id = $1;
    `;
    const result = await db.query(query, [userId]);
    return result.rows;
};

const isUserVolunteering = async (userId, projectId) => {
    const query = `
        SELECT 1
        FROM volunteers
        WHERE user_id = $1 AND service_project_id = $2;
    `;
    const result = await db.query(query, [userId, projectId]);
    return result.rows.length > 0;
};

export { volunteerForProject, cancelVolunteer, getProjectsForUser, isUserVolunteering };