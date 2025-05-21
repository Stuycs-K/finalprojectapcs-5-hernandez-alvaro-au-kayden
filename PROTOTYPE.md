
# Technical Details:

Period 5 : Kayden Au & Alvaro Hernandez Jenaro

Group Name : Pooligans

Brief Project Description :
    A repilicate of the hit game 8-Ball/Billiards. This will include the use of the cue stick to hit balls, motion and collision of balls within the bounds of the board, and also the solid/stripes rule based system. Additionally, there will also include a turn based system between two players, and a tracker for the number of balls. 

Expanded Description :
    Critical Features - visible board, cue stick, balls ; basic 2D collision and projectile motion ; established rule set between stripes and solids, which player is which 
    Nice to have Features - spin on the cue ball ; motion and collision using 3D sphere physics
     
# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.

### UML Diagram ###
![UML Diagram](uml_diagram.png)

# Intended pacing:

> Note: You have to add an x in between brackets to check off an item

### Ball Class and Basic Collision Physics -- To be done by Friday, May 30th
- [ ] Add color and number to each ball
- [ ] Implement vector functionality
- [ ] Add basic collision, will be done by finding the vector in between two balls when they are close enough and transfering velocity. (Assuming perfectly elastic collisions and no spin for now)
- [ ] Add friction


### Stick Class -- To be done by Wednesday, June 4th 
- [ ] Establish an incremental way to hit a ball with differing levels of force
- [ ] Display the current force level as a vertical bar
- [ ] Find angle from tip of stick to cue ball
- [ ] Apply Vector with correct force
- [ ] Show the stick as you move it around the cue ball--will always have a direct line to the center of the cue ball

### Implement pockets with the Table Class


How you are breaking down the project and who is responsible for which parts.

A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)

