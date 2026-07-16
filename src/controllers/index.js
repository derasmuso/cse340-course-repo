// Import any needed model functions (none are needed for the home page, so this is empty)

// Define any controller functions
const showHomePage = async (req, res) => {
    const title = 'Home';
    const page = 'home';

    res.render('home', { title, page });
};

// Export any controller functions
export { showHomePage };
