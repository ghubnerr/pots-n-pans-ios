# Pots N' Pans Mobile


## Week 10 Submission
- Progress: [Video Follow-along](https://www.loom.com/share/9f64c5598333477db57c29aa21ca367e?sid=5886ddbc-5a5c-4f64-ae28-a830d958e156)

**Sprints completed:**
- [X] Getting custom font and assets
- [X] Navigation and Pages
- [X] Styling (part I)
- [X] Turning on API (Now availble at [https://api.runpod.ai/v2/mi1w7cfskbr6up/runsync](https://api.runpod.ai/v2/mi1w7cfskbr6up/runsync))
- [X] Creating a data model for the response and for the recipes 
- [X] Getting data from the API
- [X] Querying the database for instructions and ingredients
<hr>

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview
Pots n' Pans is the mobile version app of ["Let's Cook!"](https://github.com/ghubnerr/pots_n_pans) (also made by me and my team) that offers an effortless way for users to minimize food waste. Through Let's Cook, users have the ability to upload a photo of the contents of their refrigerator. The website then provides viable recipes using the ingredients present in their fridge. Our main functionality interfaces with a **Computer vision** model that we made and trained that scans items in your fridge and recognizes them, allowing you to use that data to fetch recipes that contain it. Both versions just interface with the model via API.

### Web Version:
<img width="1294" alt="Untitled" src="https://github.com/ghubnerr/pots_n_pans/assets/144561702/c9acc9d9-0100-4b78-958b-9a0fcb5dc837">


### Description

**Hack GT X Winner for Sustainability**: Minimizing food waste through smart recipes! Save yourself from the Freshman 50 with an app that tells you exactly what you can cook from the items in your fridge!
### App Evaluation

- **Market**: The marketing for this app is any person who struggles with cooking ideation from a set of ingredients. Also someone who doesn't want to spend too much on food, and wants to use their groceries to their best extent. Could also be someone who needs some help creatively.
- **Story**: In the mobile version, it continues to address the significant issue of food waste and the lack of recipe ideas from miscellaneous ingredients. It would effectively convey its value to users by emphasizing the convenience of reducing waste, saving money, and embracing new recipes, all on the go.
- **Mobile**: The uniqueness of this project comes from the fact that it takes data straight out of your fridge and tells you what you can cook with it. It's catered to the user and has a unique, simple and user-friendly design.
- **Habit**: The mobile app can be designed to be habit-forming by encouraging users to regularly check their fridge contents, try new recipes, and actively reduce food waste. Frequent use of the app to minimize waste could be habit-forming.
- **Scope**: The technical challenges, such as using mobile camera capabilities for ingredient input are feasible. The most significantly difficult task -- the computer vision model -- is already taken care of from the backend of its Web version, which comes out in the form of a simple API!

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can scan any type of ingredients, from any angle to get their desired recipes
* User can see from the recipes that the app displays, what ingredients were identified in the picture, and which ones were missing.
* User can upload a photo
* User can see multiple recipes
* User can come back to the upload page if the picture didn't work really well
* User can have a detailed view of the recipe that they select, with pictures and everything.

**Optional Nice-to-have Stories**

* User can login to keep track of ingredients last identified

### 2. Screen Archetypes

- Landing Screen
    - Title screen with "Let's Cook" button!
- Scan/Upload Screen
    - Big button to upload, and another button to confirm
- Loading Screen
    - Just displays text - Can cancel anytime
- Recipes Screen
    - Users can view all recipes that matched the model's response to their image with ingredients
- Individual Recipe Screen
    - Users can view the recipes they chose in detail 
### 3. Navigation

**Tab Navigation** 

* No tabs needed

**Flow Navigation**
- Landing Screen
    - => Scan/Upload Screen
- Scan/Upload Screen
    - <= Home
- Loading Screen
    - <= Scan/Upload Screen
- Recipes Screen
    - <= Loading Screen
    - => /any recipe
- Individual Recipe Screen
    - <= Recipes
## Wireframes
### Figma Wireframe (see [Wireframe file](./WireFrame.fig))
<img width="760" alt="image" src="https://github.com/ghubnerr/pots-n-pans-ios/assets/91924667/3672729f-f8c8-4937-adfd-8e1c207279b7">

### Model -- API Documentation can be found [here](https://github.com/Acty101/hackgtX-pots-and-pans)

API Response Data model and Usage:

- `POST` a request to the following URL [https://api.runpod.ai/v2/mi1w7cfskbr6up/runsync](https://api.runpod.ai/v2/mi1w7cfskbr6up/runsync) with proper credentials and a payload of a base_64 encoded image
- Returns an object with the following schema:

```
{
delayTime: number;
executionTime: number;
id: string;
output: {classes: string[], recipes: string[]};
status: string;
}
```

### Networking

- The Scan/Upload screen does an API call (as specified above) with a base64 version of the image that is uploaded and returns it into the data model above.
