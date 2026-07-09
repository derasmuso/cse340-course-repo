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