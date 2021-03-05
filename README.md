# Interview to solve the Brewery Problem
## Quick project description

This is an interview test project, developed using MVVM architecture. The goal of this project is to show a list of Beer from the free and public [PunkAPI](https://punkapi.com) and also a details screen for each beer.

The test project has at moment more than 90% of coverage with tests that have a sample app flow as UI tests.The project is using Alamofire to help with requests and also contain an image extension to download the images so I could show both ways how to handle the networking layer.

#### NEXT STEPS?!
###### Mock the networking layer for the UI Tests as well.
###### Improve the UI related if there is no "internet" or content on the first screen
###### Cache the images that are downloaded
###### Keep a local store to save beers and also state the buttons from the details screen.

---
## Challenged propose by the company.

Adding bellow the description from the problem and the expected result for this test.



Quick project descriptionThis is an interview test project, developed using MVVM architecture. The goal of this project is to show a list of Beer from the free and public PunkAPI and also a details screen for each beer.The test project has at moment more than 90% of coverage with tests that have a sample app flow as UI tests.The project is using Alamofire to help with requests and also contain an image extension to donwload the images so I could show both ways how to handle the networking layer.NEXT STEPS?!Mock the networking layer for the UI Tests as well.Improve the UI related if there is no "internet" or content on the first screenCache the images that are downloadedkeep a local store to save beers and also state the buttons from the details screen.


Engineering - Code Challenge
The Brewery problem
You run a Brewery, and there are a few different types of Beers you can prepare for
customers. Each Beer can be either "Classic" or "Barrel Aged". You have a number of
customers, and each has some Beers that they like, either classic or barrel aged. No
customer will like more than one Barrel Aged Beer. You want to mix the Beers, so that:
There is just one batch for each type of Beers, and it's either Classic or Barrel Aged.
For each customer, there is at least one Beer they like. You make as few Barrel Aged
Beers as possible (because they are more expensive).
Your app should download an input file, and print a result on screen.
An example input file is:

```
5
1 B 3 C 5 C
2 C 3 B 4 C
5 B

```

The first line specifies how many Beers types there are (5 in this case). Each
subsequent line describes a customer. For example, the first customer likes Beer 1
Barrel Aged, Beer 3 Classic and Beer 5 Classic. Your program should read an input
string like this, and print out either that it is impossible to satisfy all the customers, or
describe, for each of the Beers, whether it should be made Classic or Barrel Aged. The
output for the above file should be a list of beer cells with the following labels

```
[1->Classic; 2->Classic; 3->Classic; 4->Classic;5->Barrel]
```
Or in short form
```
[C C C C B]
```

...because all customers can be made happy by every Beer being prepared as
Classic except number 5.
An example of a file with no solution is:
```
1
1 C
1 B
```
Your app should print: No solution exists
A slightly richer example is:

```
5
2 B
5 C
1 C
5 C 1 C 4 B
3 C
5 C
3 C 5 C 1 C
3 C
2 B
5 C 1 C
2 B
5 C
4 B
5 C 4 B
```
...which should show:
```
C B C B C
```

One more example. The input:
```
2
1 C 2 B
1 B
```

...should produce
```
B B
```

Result screen
The result screen contains a list of beer cells with the following information:
- Image
- Name
- ABV
- Either is Classic or Barrel Aged
Note: The id to use for retrieving the beer info from the API is the Beer Type
index, usually [1,2,3,4,..., # of types]
When tapping on a beer cell a Beer Details Screen is presented.
Beer Details screen
The beer screen is a guide for the brewer and contains:
-Image
-Name
-ABV
-Description
-Display all Hops in a list
-Display all Malts in a list
-Display all Methods in a list
(nice to have) The following behaviour is expected:
1. For each element of each list (i.e. Hops, Malts & Methods), a button with two possible
states - IDLE and DONE - should be present;
2. The buttons should start in the IDLE state.
3. When the button is clicked there is a transition to the DONE status, indicating that the
ingredient has been used or the method has been applied;

Public API
The remote input file is located here:
https://gist.githubusercontent.com/LuigiPapinoDrop/d8ed153d5431bbad23e1e1c6b5ba1e3c/raw
/4ec1c8064e51838240e941679d3ac063460685c2/code_challenge_richer.txt
The beer list can be accessed through the PUNK API: https://punkapi.com/documentation/v2
Further Requirements for iOS candidates
1. Use the latest Swift and Xcode version.
2. Try to minimize the number of dependencies. (Networking libraries are fine.)
3. We do care about SOLID principles. Each requirement should be properly encapsulated
and the architecture should allow the developer to add new business requirements, not
necessarily involving changes to the UI, but just adding a new encapsulated component.
4. Any domain logic should be unit tested.
5. The app should be ready to accept a beer that has hundreds of ingredients or methods.
6. Include dependencies in the repo. Project should be ready to run out of the box.
7. Include a README file with instructions to run the project. In this file, also mention your
architectural decisions, known issues, dependencies or anything else that you think is
important.
