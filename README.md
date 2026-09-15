# Queens

Second Course Project for the Device-Agnostic Design Course.

## Description

The project is logic puzzle game, similar to a Star Battle / LinkedIn Queens game.

**Queens** is a puzzle game where the goal is to place queens on a grid under certain conditions. More info in the *Instuctions* section.

The game features 10 playable levels with increasing difficulty, with progress saved.

More detailed explanations of all features are in the *Project requirements* section below.

## Instructions

The app starts on the home page, which shows buttons to the main pages of the game.

"**Play**" takes the player to the Levels screen, where the user is shown the list of playable levels. Levels are unlocked in order, completing previous level unlocks the next. Above the levels the user is shown which level is next and how many levels have been completed. Clicking on a Level begins the game. Detailed instructions are below (section *How to play*).

"**Instructions**" shows a page with "how to play" type instructions.

"**Statistics**" takes the player to a page that shows different statistics based on game progress and time played and used in the levels.

"**Settings**" takes the user to a page where they can reset the saved progress.

### How to play

In Queens, there is a `n x n` grid consisting of `n` color regions. The goal of the game is to place `n` Queens on the grid, following these conditions:

- Each row must have exactly one Queen
- Each column must have exactly one Queen
- Each color regions must have exactly one Queen
- No two Queens can touch each other (i.e. there can be no other Queen on the surrounding 8 squares of a Queen)

Following these rules the player must place the Queens on the grid. First tap of a square places a cross on the square. These can be used to mark out squares that cannot have a Queen. A second tap places a Queen on the square. A third tap removes the Queen and the square is in the neutral state. If two or more queens are placed such that they have a conflict, they are surrounded by red circles.

In the game UI there are two buttons, Reset and Quit. Reset resets the level, i.e. removes the placed queens and crosses, but keeps the timer running. Quit takes the player back to the Levels screen.

In each level of Queens, there is only one valid solution. Additionally, all levels can be solved without guessing.

After completing a level, the player is shown a result screen that shows the time used to complete the level, and buttons to continue to the next level or to go back to the Level selection screen.

## Project requirements

Requirements for the project and explanations on how the requirements have been fulfilled.

- The game idea is clear and there is a purpose in the game.

    Done.

    As explained above, the game is based on a popular logic puzzle game, with a clear goal and purpose. The game has been implemented with the Flame engine.

- The game has a start screen, a level selection screen, a game screen, and a result screen. The navigation between the screens is intuitive.

    Done.

    The game has a start screen with buttons to the other screens. There is a level selection screen, which shows a list of levels, that can be used to move the game screen. The game screen shows the actual game and allows the user to play it. Completing the level shows the result screen, that shows the time and buttons to continue or to return to the level selection screen. All screens have buttons that can be easily used to navigate.

    In addition to the mandatory screen, the game also features a statistics screen that shows different statistics based on completed levels. There is also a settings screen that has a button for resetting the player progression.

- The screens are responsive and there is at least one breakpoints that influences the layout. In addition to the breakpoint, the application features a maximum width that is used to limit the width of the shown content on devices with a high resolution. For the game itself, it is sufficient to create the game in a way so that the size of the components is adjusted based on the screen size (e.g. using CameraComponent’s withFixedResolution constructor).

    Done.

    The screen are responsive and multiple pages feature breakpoints that influence the shown content. On the statistics screen, the number of grid items changes based on the size, with either 1, 2 or 3 cards on a single row, with also change in font sizes. On the level selection screen, the progression is either shows next to levels on a larger screen, or above the levels on mobile, with also different font sizes.

    The app also features a maximum widh that limits the content on very large screen.

    For the game, it has been created using CameraComponents's withFixedResolution constructor so that the size of the components is adjusted based on the screen.

- The game has at least three levels that the player can complete. The levels are different from each other in some sensible way.

    Done.

    The game has a total of 10 levels. Each level has a unique puzzle to solve, and the size of the grid and difficulty increases throught the game.

- The player’s progression is saved, i.e. the levels that the player has completed are saved between application restarts.

    Done.

    The game saves the player progression and completed levels, with times.

- Playing the game does not require a keyboard or a mouse (i.e., it could be played with a touchscreen device).

    Done.

    The game does not require a keyboard or a mouse and can be played with a touchscreen.

- The game has been deployed to an online location, and the online location is shared in the project documentation. When accessing the online location with a modern web browser, the game can be played.

    Done.

    URL can be found above. The application can be used there.
