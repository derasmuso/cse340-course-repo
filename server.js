import express from 'express';
import { fileURLToPath } from 'url';
import path from 'path';

// Define the application environment
const NODE_ENV = process.env.NODE_ENV?.toLowerCase() || 'production';

// Define the port number the server will listen on
const PORT = process.env.PORT || 3000;

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();


/**
  * Configure Express middleware
  */

// Serve static files from the public directory
app.use(express.static(path.join(__dirname, 'public')));

// Set EJS as the templating engine
app.set('view engine', 'ejs');

// Tell Express where to find your templates
app.set('views', path.join(__dirname, 'src/views'));


/**
  * Routes
  */

/**
 * Routes
 */
app.get('/', async (req, res) => {
    const title = 'Home';
    const page = 'home';
    res.render('home', { title, page });
});

app.get('/organizations', async (req, res) => {
    const title = 'Our Partner Organizations';
    const page = 'organizations';
    res.render('organizations', { title, page });
});
app.get('/projects', async (req, res) => {
    const title = 'Service Projects';
    const page = 'projects';
    res.render('projects', { title, page });
});

app.get('/categories', async (req, res) => {
    const title = 'Categories';
    const page = 'categories';
    res.render('categories', { title, page });
});


app.listen(PORT, () => {
    console.log(`Server is running at http://127.0.0.1:${PORT}`);
    console.log(`Environment: ${NODE_ENV}`);
});
