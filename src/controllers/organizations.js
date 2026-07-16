// Import any needed model functions
import { getAllOrganizations } from '../models/organizations.js';

// Define any controller functions
const showOrganizationsPage = async (req, res) => {
    const organizations = await getAllOrganizations();
    const title = 'Our Partner Organizations';
    const page = 'organizations';

    res.render('organizations', { title, organizations, page });
};

// Export any controller functions
export { showOrganizationsPage };







