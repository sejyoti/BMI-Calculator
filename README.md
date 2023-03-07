# BMI-Calculator
This BMI Calculator for adult and it is created using R/Shiny

This is a BMI calculator Shiny app created using R programming language. The app allows the user to input their height and weight, and calculates their Body Mass Index (BMI) using the formula: BMI = weight / (height / 100)^2. The output is displayed in a table, along with a status/output text box that displays messages to the user.

The app consists of two tabs: Home and About. The Home tab contains the input sliders, an action button, and the output table and text box. The About tab contains information about the app.

The server function of the app contains the logic for calculating the BMI based on the input values, and displaying the output in the table. The renderPrint function is used to display messages in the status/output text box.

The app uses the shiny and shinythemes libraries in R, and has a theme of "united" applied to it.
