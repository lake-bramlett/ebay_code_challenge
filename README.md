# _eBay Item Viewer_

#### _Updated 16 October 2019_

#### By _**Lake Bramlett**_

## Description

_'eBay Item Viewer' is a mobile native application designed to let users browse items offered on ebay and view details on any particular item._

## Setup/Installation Requirements

* Install Flutter (https://flutter.dev/docs/get-started/install)
* Register for an eBay developer account (https://developer.ebay.com) -- this may take a day or two to process.
* _Clone https://github.com/lake-bramlett/ebay_code_challenge repo locally_
* _In the command line, navigate to the cloned repo_
* _Execute `flutter pub global` in the command line_
* _Create a `.env` file in the surface level of the project directory_
* _In the `.env` store your eBay developer account client ID and client secret (https://developer.ebay.com/my/keys) repsectively as `CLIENT_ID` and `CLIENT_SECRET`_ 
* _Open up either Xcode SDK or Android Developer SDK and start a virtual mobile device of your choosing_
* _In the terminal run `flutter run` to build application to currently available mobile device._

## Specs

### Users
* No need for user login.
* Users can begin search for products using words or terms of their choosing.
* Users can tap on a particular item to see more details pertaining to said item.

### Home/Search
* The home page doubles as the primary search view.
* Search operates by user inputting string data into seach input field and tapping enter/return on their mobile keyboard or tapping the search icon to the right of the text input.
* Search takes user input to make an API call and fetch data that it then passes to the Product List screen.

### Product List
* Taking in data provided from the Home/Search screen, a list view will populate with items pertaining to the user input.
* Infinite scroll is enabled by user reaching the end of the provided list, at which point another API call will be made to fetch more data and populate more items on the list.
* Users can tap on any item in the list to direct themselves to a Product Detail screen.
* Users can tap on the 'back' arrow, or the search icon, in the nav bar to be directed back to the Home/Search screen.

### Product Detail
* The Product Detail screen populates itself with data passed to it from the Product List screen.
* The user is presented with information on the products such as a product description, price, location, etc.
* Users can swipe through an image carousel of images pertaining to the item. 
* Users can tap on inidivual images to see a popup modal of that image.
* Users can tap on the 'back' arrow to go back to the Product List screen populated with the products that they had just come from, or tap the search icon to be directed back to the Home/Search screen.


  ## Known Bugs

  _No observed bugs currently at this time (16 October 2019)._

  ## Support and contact details

  _email: lake.bramlett@gmail.com_

  ## Technologies Used


  * _Flutter_
  * _Dart_
  * _Git_



  ### License

  *This software is licensed under the MIT license.*

  Copyright (c) 2019 **_Lake Bramlett_**

