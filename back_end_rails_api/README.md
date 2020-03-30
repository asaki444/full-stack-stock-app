# Stock-Back-End-Rails-Api

Api with ability to register, login, and purchase stocks.

## To install

Clone this repo

cd into repo, and run:  
```bundle install```

To start the server

```rails s ``
## Usage

Here are the routes that are available

| Routes        | HTTP METHODS  |    |
| ------------- |:-------------:| -----:|
| /sessions   | POST |  create new log in sessions  |  
| /registrations     | POST      |   create new account|
| /transactions | POST   |   add transaction |
| /logged_in | POST     |  check if user is logged in|


The json objects expected for each post request

To register a new account:

` user: {
    name: name,
    email : email,
    password: password,
    password_confirmation: password_confirmation
} `

To log in:

`user: {
    email: email
    password: password
 }`

 To add another transaction:

 `  transaction: {
     purchase_amount: total,
     amount_of_stock: amount_of_stock ,
     stock_symbol: stock_symbol
 } `

 
 #Testing

  This api uses minitest to test models, and controllers.

  To run tests, enter this in the command line:

  ```rails test```