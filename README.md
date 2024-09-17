# MovieNight
The purpose of this project is to demonstrate technical skills.

## Project Specs

The app implements the following functionalities:

* Lists the the currently playing movies horizontally by using a collectionView with a custom layout
* Displays the most popular movies vertically by using a tableView with infinite scroll
* When a user clicks on any movie item, a detail screen is presented modally.
* In order to display the movie's runtime (both in the most popular movies list and the movie detail)  the movie detail service is called
* The app does not implement image caching. As a bypass, the Kingfisher pod is used to quickly implement image downloading
* RatingView was implemented by using a Bezier Path
* A Binding class was implemented to make it easier for the viewModel and viewController to connect
* Unit tests are provided for viewModels, viewControllers, and routers
* Unit tests are also provided for a couple of helper classes
