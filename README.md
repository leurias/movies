# README

## Overview
This project allows you to import movies and reviews into a MongoDB database and provides functionality to search through movies based on various criteria and display sorted reviews.

## Improt Instructions

1. **Import Data:**
   - To import movies, run: 
     ```bash
     rake import:movies
     ```
   - To import reviews, run:
     ```bash
     rake import:reviews
     ```

2. **Search Functionality:**
   - You can search through the movies database using the following criteria:
     - **Directors**
     - **Actors**
     - **Filming Locations**
     - **Countries**

3. **Display and Sort Reviews:**
   - You can display movie reviews and sort them by their star ratings.
