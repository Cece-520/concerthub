# Concerthub
This project is designed to manage and track the logistics of concerts, including tours, artists, venues, tickets, and users.

## Database setup
Create a new database named "ConcertHub" to store the information.

## Features
### Tour 
Organize and manage concert tours, each identified by a unique title.

### Artist
Maintain details of artists, including their names, to track performers for concerts.

### Venue 
Store information about concert venues, including location, indoor/outdoor status, and address details.

### Concert 
Schedule concerts with details like title, start time, associated tour, and venue. Ensure no double booking at venues.

### Section
Define sections within venues for better seat organization and allocation.

### Seat 
Manage individual seats within venue sections, including maximum ticket capacity and seat titles.

### Seat Description 
Provide detailed labels for seats, enabling more granular identification and categorization.

### Performer
Track artists performing at concerts, including their order of appearance.

### User 
Maintain a record of users, including usernames and birthdays, to personalize ticketing experiences.
### Ticket 
Manage tickets for concerts, including pricing, barcodes, and seat assignments.

### Seat Label 
Store unique labels for seats, enhancing the clarity of seating arrangements.

## Queries and Analysis
+ Select the names of all Concerts that have sold at least one Ticket. 

+ Select the names of all Concerts that have not sold at least one Ticket.

+ For each User, find the total dollar value of all Tickets ever purchased by that User.

+ Determine which User has attended the most concerts at which Taylor Swift played. 

+ In a single query, count the number of "warm clothing" and "cool clothing" concerts. A "warm clothing" concert is at an outdoor venue and starts before 5:00 pm; otherwise the concert is a "cool clothing" concert. Your query should produce two rows of output, with clothing and count columns.

