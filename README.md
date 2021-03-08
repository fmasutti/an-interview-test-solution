# An interview test
## Quick project description

This is an interview test project, developed using MVVM architecture. The goal of this project is to show a list of itens on the screen from an free and public API and also show the details for each item on the screen.

The test project has at moment more than 90% of coverage with UnitTests + a quick app flow as UI tests (that aren't using mocked date yet for the connection layer). 

#### Extra information about the project
###### THE APP UI isn't my main goal on this test, this test got focused on the APP architecture / tests, so don't expected something outside the box on the UI side of it.
###### Added Alamofire to help with Networking layer and also using the direct "URLSession" on the UIImageView extension to donwload the beer images, so I could show the networking on both approaches.
###### Added a Coordinator + XIB files that I think would be easilly escalable - I know that an Storyboard would also do its job, just showing another way to do the app workflow using a coordinator.
###### Created an stack view on the "Item details page using custom views" to show an approach using custom views on a screen.
###### Using Dependency Injection for the APIService that is something that help with UnitTests.
###### NOT using SwiftUI because I believe most companies are not using it yet. (bear in mind that I published it on 03/2021)

#### NEXT STEPS?!
###### Mock the networking layer for the UITests like the others UnitTests.
###### Improve the UI related if there is no "internet" or content on the first screen
###### Cache the images that are downloaded
###### Keep a local store to save the itens and also state the buttons from the details screen.

---
## Challenged propose by the company.

Adding bellow the description from the problem and the expected result for this test, using images instead of text so other candidates will not be able to find it :)

![Problem description](https://github.com/fmasutti/an-interview-test-solution/blob/master/otherFiles/problem-description1.png)
![Problem description](https://github.com/fmasutti/an-interview-test-solution/blob/master/otherFiles/problem-description2.png)
![Problem description](https://github.com/fmasutti/an-interview-test-solution/blob/master/otherFiles/problem-description3.png)
