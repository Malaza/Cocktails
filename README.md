# Installation

After downloading the project, please run "pod install" on the command line, on the root folder of the project where the podfile is.

Once done, in order to build the project, you should run the Cocktails.xcworkspace file, to take into consideration the pod files.

# Architecture

I used the VIPER architecture in the project, albeit with a slight flavour of my own here and there.

The project displays a list of cocktails on a menu, from which one can view more information on how to prepare one, and the ingredients used in a cocktail.

I used the open API from https://rapidapi.com/thecocktaildb/api/the-cocktail-db. I added two Cocoapods, Lottie and Cuckoo, one for showing loading screens, and the other for testing.

I added the optional functionality, namely the search functionality, as well as pull to refresh on the main UI, which runs a service call when the tableView is refreshed

# Testing

Because of time constraints, I didn't prioritize the testing functionality, although I added the Cuckoo testing framework into the project.

# Design

The design and color scheme on the project is inspired by this Dribbble project: https://dribbble.com/shots/8899481-My-Bar-Cocktail-app-Full-flow/attachments/1069490?mode=media

# Whats missing?

There are some items I intentionally left out, because it wasn't priority or its negligible functionality.

When you search, ideally there should be live filtering on the array, which means anything that returns true is added to the array, and anything that is outside the filter scope is removed, actively, but this process happens only once when you search. I believe an alternative approach would have been to have to have temp array from which we filter, and the original data array which we do not modify in order to keep the full list of items available for searching.

The Service Call class was also not neccessary, the idea was to create a base class for all service calls going out, which will take the path as a parameter, but because we are only making one service call, I decided to leave it as is, there is a certain level of abstraction with the implementation, but not abstract enough because the path is hardcoded.

The back button treatment could have been handled better, for a more aesthetic UI, but its functional.

There is a service call when going back to the home UI, from the detail view, that implementation is intentional but I understand that the detail view doesn't perform changes to the backend which neccessitates the need to refresh the home view, I could have called the service once on load, and only refresh when the refreshControl is used.

There are unused implementations, like the ability to search for a particular cocktail using ingredients, or cocktail name, it is not there by mistake, I wanted to implement (on a different screen) functionality to search from API, on top of the local search. I have intentionally left those in, it was not a botched copy paste job :)

I hope I have covered every thought process when working on the project.
