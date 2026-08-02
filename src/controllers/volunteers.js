import { volunteerForProject, cancelVolunteer } from '../models/volunteers.js';

const processVolunteerSignup = async (req, res) => {
    const userId = req.session.user.user_id;
    const projectId = req.params.id;

    try {
        const result = await volunteerForProject(userId, projectId);

        if (result) {
            req.flash('success', 'You have successfully signed up to volunteer!');
        } else {
            req.flash('error', 'You are already signed up for this project.');
        }
    } catch (error) {
        console.error('Error signing up to volunteer:', error);
        req.flash('error', 'An error occurred while signing up. Please try again.');
    }

    res.redirect(`/project/${projectId}`);
};

const processVolunteerRemoval = async (req, res) => {
    const userId = req.session.user.user_id;
    const projectId = req.params.id;
    const redirectUrl = req.body.redirectTo === '/dashboard' ? '/dashboard' : `/project/${projectId}`;

    try {
        await cancelVolunteer(userId, projectId);
        req.flash('success', 'You have been removed as a volunteer for this project.');
    } catch (error) {
        console.error('Error removing volunteer signup:', error);
        req.flash('error', 'An error occurred. Please try again.');
    }

    res.redirect(redirectUrl);
};


export { processVolunteerSignup, processVolunteerRemoval };