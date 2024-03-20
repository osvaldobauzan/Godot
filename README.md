# Overview

Puzzler Godot is a 2D puzzle-solving game with mechanics based on movement programming.
In each level, the character starts at a starting point and must reach an end point (objective) through a predefined scenario, and with the particularity that our character, once he starts his movement, will not stop until he collides with an obstacle. To beat the level, the player must study the maze and anticipate what moves the character must make to get there. Sometimes there is more than one sequence of moves to solve the puzzle, but the challenge is to find the best path (usually the fastest).

To preprogram movements, the player has a virtual console of direction buttons. After pressing the chosen sequence and registering it in the interface, you just have to press _Play_ and the character will begin his journey, one step after another.
It is possible that the player will not be able to solve the puzzle the first time (or that their character will die trying). It will have retries until it succeeds.
As the player progresses, the difficulty will increase. Enemies will come into play that will get in your way and objects that can help or hinder the resolution.
The game will have a home screen, options menu, level selection and saved progress. For this functionality, you will have access to a database in the cloud.

[Software Demo Video](https://www.youtube.com/watch?v=yH7hR3IXhLA&ab_channel=OsvaldoBauzan)

# Development Environment

- Godot==4.2
- GDScript==2.0
- Git==2.43.0.windows.1
- Google Firestore

# Useful Websites

* [Godot Tutorials](https://godottutorials.com/)
* [Godot Docs](https://godotengine.org/)

# Future Work

* Create more levels
* Let levels autogenerate themselves 
