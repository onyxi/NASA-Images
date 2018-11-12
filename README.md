# NASA-Images
A simple app to search NASA's images API

Version 1.0

READ_ME

Rationale
	•	I’ve tried to use a MVVM architecture to minimise transformation code inside ViewControllers and to simplify testing.
	•	As much as possible, access to remote service (http) has been abstracted away from the views/controllers - to minimise the effect on the front end if further development is done to the API service.
	•	3rd-Party Libraries used:
	⁃	Kingfisher - provides easy implementation for downloading and displaying image resources over the Internet - using only the image’s url-String (which is returned as part of NASA’s API response). The library also provides a handy cache for downloaded content so images are loaded more quickly if the same image resource has been recently requested.
	⁃	Alamofire - provides simplified implementation of URL sessions with validation tools and handlers for response data types (in the case JSON)

Improvements
	•	If more time allowed I would have liked to test the app more throughly with more extensive Unit Tests and User Interface Tests. I wrote some basic unit tests for the ImageCellViewModel, ImageDetailsViewModel and HTTPService classes but I was learning as I went so did not have time to test more thoroughly.
	•	More extensive search parameters could be implemented. Currently the user can search NASA’s image API using a general search term and a year-range. The API accepts many other parameters, such as center, location, photographer etc, which could be added to the SearchParametersViewController and built into the HTTPService API url to refine search results further.
	•	Image descriptions could be developed to provide Web functionality (WebKit) - so that hyperlinks are opened in a web-view/appropriate app. At the moment, hyperlinks to external sites/apps are recognised in the HTML text and displayed appropriately, but the user cannot yet interact with them.

Known Bugs
	1.	If, in the image-list screen, the device is in landscape mode when the user taps an image to view its details, then on the details screen if the device is rotated to portrait mode, the description label will extend off the bottom of the view (if long enough). The scrollViewContainer on the ImageDetailsViewController needs to be resized appropriately if the device changes orientation.
