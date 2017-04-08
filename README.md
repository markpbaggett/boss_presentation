# BOSS Presentation

## About Presentation

The following materials are for use in the [Pico-8](http://www.lexaloffle.com/pico-8.php) workshop at [Big Orange Stem Saturday](https://www.lib.utk.edu/outreach/soil/b-o-s-s/) on April 8, 2017.

## About Pico-8

[PICO-8](http://www.lexaloffle.com/pico-8.php) is a fantasy console for making, sharing and playing tiny games and other computer programs. When you turn it on, the machine greets you with a shell for typing in Lua commands and provides simple built-in tools for creating your own cartridges.

Some technical specifications:

* The display is 128 x 128 pixels
* The display supports 16 colors
	* ![16 Colors of Support](http://www.lexaloffle.com/gfx/pico8_pal_017.png)
* Can support 128 8x8 sprites ber game
* Controller support for 2 players:
	* A D-Pad (Up + Down + Left + Right)
	* 2 buttons (A + B)
	* A Pause Button
	* ![Key Config](images/keyconfig.png)

## Other Helpful Links

* [Pico-8 Zines](http://pico8fanzine.bigcartel.com/): Pico-8 zines are awesome 48-page fanzines made by and for PICO-8 users.
* [Pico Awesome List](https://github.com/felipebueno/awesome-PICO-8): A curated list of awesome PICO-8 resources, carts, tools, and more.
* [A Pico-8 Space Shooter in 16 Gifs](https://ztiromoritz.github.io/pico-8-shooter/): Learn how to write a spaceshooter in Pico-8 in 16 gifs.
* [Pico-8 Cheat Sheet](https://ztiromoritz.github.io/pico-8-spick/index_en.html): Awesome Cheat sheet for Pico-8.

## What Are We Making?

Today, we're going to be building a game called "[American Eating Champion](http://www.lexaloffle.com/bbs/?tid=29115)".  It's a very basic game with very few programming concepts.  Let's check it out before we get started.

## Starting Up Pico-8

From the Apple Dock, click the Pico-8 icon. Once Pico-8 has booted, type **SPLORE**. Scroll to right and find Search. Type **"American"** and press return. Click **"American Eating Champion."**  This is our tutorial game.  We'll use it for the Sprites.

Press escape to enter our editor.

## The Sprite Editor

![Image of a Sprite Editor in Action](images/spriteeditor.png)

The sprite editor is where you create your graphics.

Sprites are computer graphics that may be moved on-screen and otherwise manipulated as a single entity.

Once your pico editor is running, you can click the second icon in from the left on the upper-right-hand side of the screen.

If you click the sprite, you can see its number.  In the example, Finn is number **13**.

**To do**:
* **Pick a character on line 1**, and write down its corresponding number.  Note:  each character has 2 sprites.  You want to write down the number of the sprite on the left.
* **Pick a food on line 2**, and write down its corresponding number.


## The Code Editor

This is where we will write all the code that defines our game.

While it can be hard to read due to the 128 x 128 screen size, the code editor is nice because it helps you spot errors in your code by supporting syntax highlighting.

![Example Code Editor](images/codeeditor.png)

Let's delete all the code here before we start (don't cheat).

## [One:  Variables](https://gist.github.com/markpbaggett/9307d3ee9f83132fd3cd0204c0848341)

Let's get started.

The first thing we want to do is write down variables and values that we'll use in our game.

**Variables** are the first programming concept we will discuss.  Variables have a name and associated value.  While the name stays the same, the value can change.

To get started, let's write some code to represent the hero of our game.  In your code editor, write a variable called start_hero and set it equal to the number you wrote down.  We will also write down a variable called hero, and set it equal to our variable start_hero.  In our game, the hero variable will be used to represent which of the 2 sprites to display. Finally, write a variable called food and set it equal to the other number you wrote down.

We also need variables for where we will display our sprites on the screen.  Remember, the display is 128 x 128 pixels. Let's write variables to put our food in the upper-left corner of the screen, and our hero lower and to the right.

##### Our New Code Should Look Like:

```
hero = 12
food = 16
food_x = 20
food_y = 20
hero_x = 80
hero_y = 80
move = 1
```

## [Two: Functions and Special Function _init()](https://gist.github.com/markpbaggett/71bc91182ce5c75a228ae23bd6f57e04)

In programming, a **function** is a block of code that performs a specific task when its called. Functions are important because they all you to repeat the same tasks without having to write all the instructions over again.

We will write and call several functions throughout the course of our game.

In Pico8, there are 3 special functions that are called **automatically** if defined by the user.  The first is _init().  _init() is called once on program start up.

Let's write an _init() function.  Inside of the function, we will **call** a function that is already defined by Pico8 called cls().  cls() is useful because it clears the screen every time it's called.  Once we've written this code, our game will clear the screen each time the game starts.

##### Our New Code Should Look Like:
```
function _init()
  cls()
end
```

## [Three: Functions and Special Function _draw()](https://gist.github.com/markpbaggett/c91f16fabb11042a93d901ad72dd5e47)

Another special function in Pico-8 is called **_draw()**. Like _init(), _draw() is called automatically during program execution, however it is called 30 times per second (by default).  _draw() is used to draw our sprite graphics and any other messages to the screen.

Let's define our new function _draw(). Inside of the body, let's call the sprite function twice to draw our food and our hero.  The sprite function takes 3 arguments. The first one is the number of the sprite we want to call.  The second is the x coordinate, and the third is the y coordinate. Since we have variables assigned for each of these, let's use those.  Let's call a second sprite function for our hero.

##### Our New Code Should Look Like:
```
function _draw()
  spr(food, food_x, food_y)
  spr(hero, hero_x, hero_y)
end
```

## [Four: Special Function _update() and Conditionals](https://gist.github.com/markpbaggett/cb6b00b2c563aa45bc2f1cf35e9d29cb)

Our final special function is** _update()**. Like _draw(), update is call 30 times per second (by default) automatically during program execution. The intended purpose of _update() is to test for user inputs (button presses), perform all of the calculations to advance the state of the game, and update the game's data structures with the results. Typically, this function does not update the display, though it may initiate sound effects (sfx()) and music (music()).

In programming, conditional statements test whether a statment is true or false.  In this section, we will use conditionals to test if a user presses a button.  It they do press a button, we will write code to move our character in a direction. In Pico-8, a conditional block can have an if block (required), multiple elseif blocks (optional), and an else block (optional). For now, we will just use ifs.  The block must end with the keyword end.

##### Our New Code Should Look Like:
```
function _update()
  if (btn(0)) then
    hero_x = hero_x - move
  end
  if (btn(1)) then
    hero_x = hero_x + move
  end
  if (btn(2)) then
    hero_y = hero_y - move
  end
  if (btn(3)) then
    hero_y = hero_y + move
  end
end
```

## [Five: Update _draw()](https://gist.github.com/markpbaggett/49c6ba67b9b8c1e52d7f8e06e115cea0)

Now, let's execute our program.  Press Escape and type "run". This looks weird. Why? 

That's because the screen isn't getting cleared.

Let's add a cls() call at the beginning of our _draw() function.

##### Add this New Code to the Beginning of our _draw():

```
cls()

```

## [Six:  Collision Detection](https://gist.github.com/markpbaggett/02aa49bd43741ae7871644b3b2f2db7a)

We need to figure out a way to determine when our hero eats the food. How can we do that?

Basically, if our character gets near the upper left hand corner of the sprite, we want it to disappear.

So, we need to test where our character is in conjunction to our food, and when he gets within 5 pixels or so, change our food sprite to blank.

##### Add this New Code to the Beginning of our _update():

```
if (hero_x >= food_x - 5 and hero_x <= food_x + 5) and (hero_y >= food_y - 5 and hero_y <= food_y + 5) then
food = 33
end

```

## [Seven: Wrap Around](https://gist.github.com/markpbaggett/c136dc31953bebb377503acf07175cd3)

Our code now makes our food disappear when our hero collides with it. But we have a problem: when our hero goes too far in one direction, he disappears.  What we want to do is have our hero **wrap around** when he ventures too far in one direction.

To handle this, we need to add code to set our hero's x to the left side of the screen when he gets too far rights and vice versa. The same needs to be done to our y coordinate.

##### Add this New Code to Our _update():

```
if (hero_x >= 120) then
hero_x = 8
elseif (hero_x <= 8) then
hero_x = 120
elseif (hero_y >= 120) then
hero_y = 8
elseif (hero_y <= 8) then
hero_y = 120
end
```

## [Eight: Randomizing Food](https://gist.github.com/markpbaggett/4c31d0e9e447ee2849c5f525aa5391b7)

Let's make it so when we eat a food, a new food appears randomly on our screen. To start, let's define a new function.  Inside the function, let's call the rnd() function. rnd(), or random, takes a numerical argument (maximum) and randomly selects a number between 0 and it. You can get rnd() to start at a number besides 0 by adding the minimum number in the range.

Finally, rnd() returns a fractional part -- not an integer.  Since we're using rnd() to generate a sprite, we need to use flr() (floor) on our new sprite.  flr() rounds a number down to an integer


##### Define this New Function
```
function new_food()
 food = rnd(17) + 16
 food = flr(food)
 food_x = rnd(100) + 10
 food_y = rnd(100) + 10
end
```

Once the new_food() function is defined, let's call it when our other food is eaten to generate a new food.

##### Update the _update Function

```
if (hero_x >= food_x - 5 and hero_x <= food_x + 5) and (hero_y >= food_y - 5 and hero_y <= food_y + 5) then
new_food()
end
```
