# planetarium
This repo serves as a Wiki for work done in the Pomona Planetarium. Here you will find files and tutorials for how to do various things with the planetarium.

<h2> Slicing </h2>
There are many dome movies that can be used on the dome (many of which can be found here: https://www.eso.org/public/usa/products/planetariumshows/). In many cases,
these movies come in the following format: a folder with n frames ordered frame_000.jpeg to frame_<n>.jpeg, where each jpeg is a 4k image. The planetarium includes software
to convert this directory of images to a movie. `how-to-slice.pdf` is a set of instructions for how to do this.

Sometimes, the dome movie needs to be converted to a directory of images to fed to the slicer. If it is already a movie, you can use the `extract_frames_from_vid.py` script to do so.

<h2> Mapping images to the dome </h2>
<b>Matlab Script</b>: Given a directory of rectangular images and a csv file of pitches and yaws, the `images_to_dome.m` script converts the images to a circular image directory to be sliced.
In particular, if you have n images, with corresponding n pitches and n yaws (pitch here ranges from 0 to 90, 0=looking straight ahead, 90=looking up at zenith, and yaw here ranges from 0 to 360, counterclockwise rotation), the script will stich them together as you would think.

<b>Skymaps</b>: Skymaps are a media asset in the dome that can be rendered as a "skin" for the dome. They take as input a jpeg image to map to a sphere (think a rectangular world map that stands in for a spherical globe). An example skymap with the correct dimensions is in the folder.

<h2>Conducting Shows</h2>
The planetarium only seats 32, and given the enormous interest on the 5C's, it can be challenging ensuring everyone gets to see the show you create. Here is a routine I have used to make this process relatively easy. 

<ol><li>Create a 20-25 minute show you think people would like. </li>
<li> Choose a night and a 2-hour chunk of time to conduct the show (i.e. 9-9:30, 9:30-10, 10-10:30, 10:30-11)</li>
<li> Create a google form where you ask people for names, email and which show they are RSVPing for (like this one: https://goo.gl/forms/m2Mi1ta8bJ515K8z2) </li>
<li> Create a facebook event using the Pomona Planetarium facebook page (https://www.facebook.com/pomonaplanetarium/, if you're not an admin ask Adam or Elvis for privelages or to post it for you), where you request people to follow to google form link to RSVP</li>
<li>Track responses on GF to ensure you don't overflow. </li>
</ol>

<h2>Thesis</h2>
Many of the lessons and techniques I learned are discussed in detail in my media studies thesis. The PDF for it is in this repo as well.

