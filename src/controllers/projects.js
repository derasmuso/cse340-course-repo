// Import any needed model functions
import { getAllProjects, getUpcomingProjects, getProjectDetails } from '../models/projects.js';

const NUMBER_OF_UPCOMING_PROJECTS = 5;

// Define any controller functions
const showProjectsPage = async (req, res) => {
    const projects = await getUpcomingProjects(NUMBER_OF_UPCOMING_PROJECTS);
    const title = 'Upcoming Service Projects';
    const page = 'projects';

    res.render('projects', { title, projects, page });
};

const showProjectDetailsPage = async (req, res) => {
    const projectId = req.params.id;
    const project = await getProjectDetails(projectId);
    const title = 'Service Project Details';
    const page = 'projects';

    res.render('project', { title, project, page });
};





// Export any controller functions
export { showProjectsPage, showProjectDetailsPage };






