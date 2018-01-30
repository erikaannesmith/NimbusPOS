# Nimbus POS Tracker

## About the app

Nimbus POS Tracker is an employee-facing Rails app that was designed for my client to track sales at his karaoke lounge. It accounts for the 16 rooms at the lounge, which each have a specified hourly rate. Each of the 16 room buttons are green, indicating that they are 'open'. When the user clicks on a room, a form dynamically renders to 'create a new order'. Inputs for the form include start time, end time, any snacks or drinks purchased, and any additional charges. By clicking 'start' or 'end' on the time inputs, the current time is logged. When the form is submitted, the color of the room in the app turns to red, marking it as 'unavailable', and a summary of the order so far is rendered. If an unavailable room is clicked on, it will render an 'update order' form with persisted data. When the user updates the form, they will see the updated order summary and an input for cash handled during the transaction. Additionally, they have the option to enter in an amount of people to asynchronously split the total cost between. When the user clicks 'Check Out', the order will become a sale and will be available for review at '/sales'.

## Setup