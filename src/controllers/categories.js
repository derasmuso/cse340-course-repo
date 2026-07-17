// Import any needed model functions
import { getAllCategories, getCategoryDetails, getProjectsByCategoryId } from '../models/categories.js';

// Define any controller functions
const showCategoriesPage = async (req, res) => {
    const categories = await getAllCategories();
    const title = 'Service Categories';
    const page = 'categories';

    res.render('categories', { title, categories, page });
};

const showCategoryDetailsPage = async (req, res) => {
    const categoryId = req.params.id;
    const categoryDetails = await getCategoryDetails(categoryId);
    const projects = await getProjectsByCategoryId(categoryId);
    const title = 'Category Details';
    const page = 'categories';

    res.render('category', { title, categoryDetails, projects, page });
};


// Export any controller functions
export { showCategoriesPage, showCategoryDetailsPage };









