// Import any needed model functions
import { getAllCategories } from '../models/categories.js';

// Define any controller functions
const showCategoriesPage = async (req, res) => {
    const categories = await getAllCategories();
    const title = 'Service Categories';
    const page = 'categories';

    res.render('categories', { title, categories, page });
};

// Export any controller functions
export { showCategoriesPage };









