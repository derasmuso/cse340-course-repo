-- ========================================
-- Organization Table
-- ========================================
CREATE TABLE organization (
	organization_id SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- ========================================
-- Insert sample data: Organizations
-- ========================================
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

-- ========================================
-- Service Project Table
-- ========================================

CREATE TABLE service_project (
	service_project_id SERIAL PRIMARY KEY,
	organization_id INT NOT NULL,
    service_project_title VARCHAR(150) NOT NULL,
    service_project_description TEXT NOT NULL,
    service_project_location VARCHAR(255) NOT NULL,
    service_project_date DATE NOT NULL,
	CONSTRAINT fkey_organization -- names the rule "fkey_organization" instead of the default name
        FOREIGN KEY (organization_id)  -- the rule applies to my organization_id column
        REFERENCES organization (organization_id) -- and it must match a real row in organization.organization_id
);

-- ========================================
-- Insert sample data: Service Projects
-- ========================================

INSERT INTO service_project
    (organization_id, service_project_title, service_project_description, service_project_location, service_project_date)
VALUES
    (1, 'Habitat Home Build', 'Assist skilled crews with framing and finishing work on a new affordable home.', 'Glendale Neighborhood, Salt Lake City, UT', '2026-08-15'),
    (1, 'Community Playground Build', 'Construct and install new playground equipment for a neighborhood park.', 'Liberty Park, Salt Lake City, UT', '2026-08-22'),
    (1, 'Senior Home Repair Day', 'Perform minor home repairs and safety upgrades for elderly homeowners.', 'Sunrise Senior Community, Murray, UT', '2026-09-05'),
    (1, 'Youth Center Renovation', 'Paint, repair, and refresh common areas at a local youth center.', 'West Side Youth Center, West Valley City, UT', '2026-09-12'),
    (1, 'Accessible Ramp Installation', 'Build wheelchair-accessible ramps for residents with mobility needs.', 'Sandy Community Housing, Sandy, UT', '2026-09-19');

INSERT INTO service_project
    (organization_id, service_project_title, service_project_description, service_project_location, service_project_date)
VALUES
    (2, 'Community Garden Planting', 'Till soil and plant seasonal vegetables in shared garden plots.', 'Sugar House Park, Salt Lake City, UT', '2026-08-16'),
    (2, 'River Cleanup Day', 'Remove trash and debris from riverbanks to protect local wildlife habitats.', 'Jordan River Parkway, Salt Lake City, UT', '2026-08-29'),
    (2, 'Tree Planting Initiative', 'Plant native trees in a public park to support the urban canopy program.', 'Millcreek Canyon, Salt Lake City, UT', '2026-09-06'),
    (2, 'Farmers Market Food Drive', 'Collect and distribute surplus produce from local farmers to food-insecure families.', 'Downtown Farmers Market, Salt Lake City, UT', '2026-09-13'),
    (2, 'Composting Workshop Setup', 'Help set up and lead a community workshop on home composting techniques.', 'Community Garden Hub, West Jordan, UT', '2026-09-27');

INSERT INTO service_project
    (organization_id, service_project_title, service_project_description, service_project_location, service_project_date)
VALUES
    (3, 'Food Pantry Restocking', 'Sort and shelve donated canned goods and dry foods for weekly food pantry distribution.', 'Downtown Food Bank, Salt Lake City, UT', '2026-08-18'),
    (3, 'Blood Drive Support', 'Assist with registration and refreshments at a community blood donation event.', 'Red Cross Center, Sandy, UT', '2026-08-25'),
    (3, 'Literacy Tutoring Program', 'Provide one-on-one reading support to elementary school students.', 'Whittier Elementary School, Salt Lake City, UT', '2026-09-08'),
    (3, 'Winter Coat Drive', 'Collect, sort, and distribute donated winter coats to families in need.', 'Community Center, Taylorsville, UT', '2026-09-15'),
    (3, 'Holiday Gift Wrapping', 'Wrap donated toys and gifts for distribution to families during the holidays.', 'Volunteer Center, Taylorsville, UT', '2026-09-29');


-- ========================================
-- Category Tables
-- ========================================

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE service_project_category (
    service_project_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (service_project_id, category_id),
    CONSTRAINT fkey_service_project
        FOREIGN KEY (service_project_id)
        REFERENCES service_project (service_project_id),
    CONSTRAINT fkey_category
        FOREIGN KEY (category_id)
        REFERENCES category (category_id)
);

-- ========================================
-- Insert sample data: Categories
-- ========================================

INSERT INTO category (category_name)
VALUES
    ('Environmental'),
    ('Community Building'),
    ('Education & Literacy'),
    ('Health & Wellness'),
    ('Basic Needs & Relief');


INSERT INTO service_project_category (service_project_id, category_id)
VALUES
    -- Habitat Home Build (1) — Community Building
    (1, 2),
    -- Community Playground Build (2) — Community Building
    (2, 2),
    -- Senior Home Repair Day (3) — Community Building, Health & Wellness
    (3, 2),
    (3, 4),
    -- Youth Center Renovation (4) — Community Building
    (4, 2),
    -- Accessible Ramp Installation (5) — Community Building, Health & Wellness
    (5, 2),
    (5, 4),
    -- Community Garden Planting (6) — Environmental
    (6, 1),
    -- River Cleanup Day (7) — Environmental
    (7, 1),
    -- Tree Planting Initiative (8) — Environmental
    (8, 1),
    -- Farmers Market Food Drive (9) — Environmental, Basic Needs & Relief
    (9, 1),
    (9, 5),
    -- Composting Workshop Setup (10) — Environmental
    (10, 1),
    -- Food Pantry Restocking (11) — Basic Needs & Relief
    (11, 5),
    -- Blood Drive Support (12) — Health & Wellness
    (12, 4),
    -- Literacy Tutoring Program (13) — Education & Literacy
    (13, 3),
    -- Winter Coat Drive (14) — Basic Needs & Relief
    (14, 5),
    -- Holiday Gift Wrapping (15) — Basic Needs & Relief, Community Building
    (15, 5),
    (15, 2);

    
-- ========================================
-- Roles Table
-- ======================================== 
CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL,
    role_description TEXT
);


-- ========================================
-- Insert sample data: Roles
-- ========================================
INSERT INTO roles (role_name, role_description) VALUES 
    ('user', 'Standard user with basic access'),
    ('admin', 'Administrator with full system access');


-- ========================================
-- Users Table
-- ======================================== 

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role_id INTEGER REFERENCES roles(role_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
