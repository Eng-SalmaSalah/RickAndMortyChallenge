# RickAndMortyChallenge

This project is a simple iOS application that displays characters from the Rick and Morty universe. 
Users can view a list of characters, filter them by status (alive, dead, unknown), and view detailed information about each character.

Instructions for Building and Running the Application

Prerequisites
* iOS 16.0 or later

Installation
1. Clone the Repository: repoURL: https://github.com/Eng-SalmaSalah/RickAndMortyChallenge.git 
2. Open the Project: Open the .xcworkspace file with Xcode 
3. Build and Run the App: Select the appropriate simulator or device, then build and run the app using Xcode.


Application Structure
* Home View: Displays a list of all characters with their image, name, and species. Users can filter characters by status (alive, dead, unknown).
* Details View: Shows detailed information about a selected character, including their image, name, species, status, gender, and location.

Assumptions and Decisions
* Data Handling: The application fetches all characters from the remote API (API Documentation: https://rickandmortyapi.com/documentation/).
* UI/UX: Minimalistic design to keep the focus on character information. The character list is presented using a UITableView (UIKit) , but each cell content, character details screen and filtering options are implemented in swift ui.
* Filtering: The filtering option allows users to narrow down the list based on the character's status.
* Testing: Comprehensive unit testing has been implemented to ensure the reliability of the ViewModel, repository, and use cases.

Challenges Encountered and How They Were Addressed
* Networking Architecture: Implementing a custom protocol-based networking architecture required careful design to ensure flexibility and scalability. This was addressed by defining endpoint configurations that allow easy extension and maintenance.
* Data Filtering: Efficiently filtering characters based on their status was a challenge, to reload the view without any issues and to avoid memory leaks.
* Unit Testing: Ensuring high test coverage for the ViewModel, repository, and use cases was challenging. The use of mocks for the use case, repository, and endpoint, along with a mocked JSON response, helped create reliable and isolated tests.

Unit Testing
Unit tests have been implemented for:
* ViewModel: Mocked the use case to test the ViewModel's logic and data handling.
* Use Case: Mocked the repository to test the business logic without relying on actual data fetching.
* Repository: Mocked the endpoint to test the repository's ability to fetch and process data.
These tests ensure that each layer of the application works independently and correctly, providing a robust and maintainable codebase.
