# Oyster Card challenge - Week 2
---
_pair coding: Anna & Aleks_  

## Topics to cover:

- [ ] I write code that is easy to change  
- [ ] I can test-drive my code  
- [ ] I can build with objects  
- [ ] Use all of week 1's skills 
- [ ] Break one class into two classes that work together, while maintaining test coverage  
- [ ] Unit test classes in isolation using mocking  

### Set up the project:

- [x] Create a Gemfile
- [x] Create RSpec conventional files
- [x] Review debugging basics

### Create a basic Oyster card:
- [x] Add the balance  
- [x] Enable top up functionality  
- [x] Enforce maximum balance  
- [x] Deduct the money  

### Add touch in/out functionality:
- [x] Add touch in/out support  
- [ ] Checking mininum balance on touch in  
- [ ] Charging for the journey  

### Record the journeys
- [ ] Saving the entry station  
- [ ] Adding journey history  
- [ ] Creating the station class  

### Refactor to extract Journey class
- [ ] Handling a journey without a touch out

### Refactoring: get the code into shape
- [ ] Extracting the journey log out of the Oystercard

### Make fares depends on zones
- [ ] Calculating the fare between zones

## User stories to cover:

```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

## Things learned:

- creating Gemfile with:

```
bundle init
```

- we started off with manually adding gem files - then read up on doing it via bundler
- updating local versions of ruby and gems with rvm & bundler
- Rspec config file - not generated automatically by rspec --init; purpose: ??
- reading & interpreting the rspec stack trace
- attribute readers and instance variables, and initialising new objects in a given state - and writing unit tests to verify it
- using constants in Rspec: accessing by ClassName::CONSTANT_NAME (can be used in string interpolation)

