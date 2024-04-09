# YAML Validator & Parser App

Hey there! Welcome to our project readme! 🚀 Our professor threw us this challenge:

## What's This Project About?
So, you know how everyone's stuck to their phones? Well, there's no app out there that checks YAML files on your phone directly. We thought, why not make one?

## What We Used
We built this app using Flutter and Dart.


# Features

## Reading and  Parsing YAML
Our app parsing YAML files and turns them into JSON. You can even save the JSON file!

## Validating YAML


We've got you covered with three models for validating YAML:

1. Student: Includes fields like name (String), surname (String), age (Integer greater than 0), and grades (List) in math, physics, and compilation, with grades between 0 and 20. Email field is optional.
2. Product: Fields include name, ID, quantity, price, and isNew status (Bool). Description is optional.
3. Car: Requires fields like brand, model, year, engine type and power, features, price, and isNew status.


### You just pick the model and the YAML file, and we'll do the rest..

## How to Do It

## Getting It
To get the app, just tap on the app icon. Easy, right?

## Checking Code
If you wanna play with the code:

1. Clear things up with `flutter clean`.
2. Get the stuff you need with `flutter pub get`.
3. Now, you're good to go in your dev tools.



## Reading YAML
1. Choose your YAML file (make sure it's `.txt` because phones don't like `.yml` yet).
2. Boom! We'll turn it into JSON for you.
3. Wanna keep it? Just tap "Download Parsed YAML."



## Checking YAML
1. Pick your model.
2. Choose the file you wanna check.
3. Done! We'll tell you if something's off.

      Don't worry if it seems hard, our app's easy to use. We'll guide you through it. Piece of cake!


## Note
   Right now, you can only pick .txt files on phones. But on other devices like Windows, you'll get .yaml or .yml options soon. (We're working on it!) 

#
Give it a shot and tell us what you think. 🎉