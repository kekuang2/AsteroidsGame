Asteroids (Part 1)
==================
In this assignment we will start to replicate the old video game Asteroids. You will write a program that has a space ship that can be controlled with the keyboard. You will need to write a `SpaceShip` class. Your `SpaceShip` class will extend the `Floater` class, an `abstract` class that represents all things that float in space. 

An `abstract` class is an "incomplete" class. It has `abstract` methods--incomplete methods that have no body. When your class extends an `abstract` class, you typically write the methods that are needed to "complete" the class. _Note: To complete this assignment you will be writing two classes `SpaceShip` and `Star`. Do not modify the `Floater` class._

Suggested steps to complete this assignment
-------------------------------------------
Part 1
1. Fork [this repository](https://github.com/APCSLowell/AsteroidsGame).
2. Uncomment the `extends floater` on Line 10
3. Complete the 10 abstract `set` and `get` functions
4. Write the `Spaceship` constructor. Make sure you initialize all 9 of the inherited `protected` member variables. You may find slides #1 - 58 on the [Asteroids PowerPoint](https://drive.google.com/file/d/0Bz2ZkT6qWPYTYjU0NDE5ZDYtYzEwOS00MGNlLTk0OGMtODBhODI3N2JiYzRi/view?usp=sharing) and the [SpaceShip design worksheet](https://drive.google.com/file/d/0Bz2ZkT6qWPYTRDJvNUJRdXFjNGs/view?usp=sharing) helpful. You may also find [this sample SpaceShip program](https://56d4b6566b56a59e1f634ea30f548666c459899d.googledrive.com/host/0Bz2ZkT6qWPYTallTVFJBOWdNcDQ/) helpful in understanding how the `protected Floater` variables affect the SpaceShip's movement.
5. At the top of your program, declare a variable of type `SpaceShip`
6. Initialize the `SpaceShip` as a new instance of the class
7. In `draw()` call the SpaceShip's `show()` function
8. When you are happy with appearance of the SpaceShip, add a `public void keyPressed()` function to your program
9. Write code in `keyPressed` that allows you to control the space ship with the keyboard. You must include the ability to rotate left, rotate right, accelerate, and enter "hyperspace." (There is no requirement for any fancy visual effects, hyperspace just needs to stop the ship, and give it a new random position and direction.)
10. Add code to `draw()` to `move()` the Spaceship
11. Finally, add a `Star` class that creates a random number of stars in random positions
12. Note that for full credit, **you MUST include instructions on how to operate your SpaceShip in the `index.html` file**
12. If you have extra time and are looking for a challenge, you might try to add an animation of "rockets" that appear from the back of the ship when you accelerate

These steps are only a suggestion. Your Asteroids game doesn't have to work or act like any other. Have fun and be creative.

Part 2
1. Write an Asteroid class that extends Floater. Make sure it's not inside the curly braces of any other class. You will need to write a constructor and the code to "finish" the abstract methods in the Floater class
2. Add a int member variable of the Asteroid class. It will hold the speed of rotation for each asteroid. Make sure that this is initialized to have an equal probablility of being positive or negative. Also make sure to declare it appropriately (should it be public or private?)
3. "Override" the move() method of the Floater class by writing a new move() method in the Asteroid class that also rotates each Asteroid at its own speed
4. Now add just a single asteroid to your applet. Start by just calling the Asteroid's show() function. Make sure you can see it and are happy with its shape before going to the next step.
5. Now add the code that moves and rotates the Asteroid
6. Modify your code so that you have an array of Asteroids.
7. Submit the URL of your working program to the school loop locker

Part 3
1. Modify your asteroids game to use an ArrayList instead of an array of asteroids. You may find the Asteroids powerpoint from slides #124 helpful. There is more on ArrayLists on the ArrayList worksheet.
2. Now we'll modify the program so that when our space ship strikes an asteroid, the asteroid is removed from the ArrayList. Everytime an asteroid moves find the distance between that asteroid and the ship. Use processing's dist() function to find the distance between that asteroid and the ship. If the distance is less than 20 remove the asteroid from the ArrayList. Otherwise, move and rotate the asteroid normally
3. Submit the same URL for your AsteroidsGame that you submitted for the two previous assignments to the school loop drop box.

Part 4
1. Create a new Bullet.pde file in your AsteroidsGame folder. One way to do this is in Sublime is to choose New | New File and then choose File | Save as and name your file Bullet.pde.
2. On line 14 of index.html add Bullet.pde to the list of files in the data-processing-sources and choose File | Save.
3. Write a Bullet class that extends Floater in Bullet.pde.
4. Write a constructor that takes one ship argument: Bullet(SpaceShip theShip) This constructor will use the public "getter" (accessor) functions of the Spaceship class to:
i.Intialize myCenterX and myCenterY of the bullet to be the same as the ship.
ii. Initialize myPointDirection of the bullet to be the same as the direction the ship is pointing.
iii. convert myPointDirection to radians with the following code: double dRadians =myPointDirection*(Math.PI/180);
iv. Initialize myDirectionX as 5 * Math.cos(dRadians) + the directionX of the ship
v. Initialize myDirectionY as 5 * Math.sin(dRadians) + the directionY of the ship
5. Override the show() method of the Floater class so that you can use circular bullets
6. Now, add just one bullet to your program. First, just draw it to the screen. Make sure you can see it before continuing to the next step.
7. Now, move the bullet.
8. Now create an ArrayList of Bullets. The list should be empty to start with. Everytime you press the key to "shoot", add a new Bullet to the ArrayList. Modify the program with loops that draw and move all the bullets in the ArrayList
9.One way to check for collisions between the bullets and the Asteroids is to write a loop within a loop (see below for another way). Everytime you move one asteroid you will need:
i. a loop that goes through all the bullets to see if there is a collision between that bullet and the asteroid
ii. if there is a collision remove both the asteroid and the bullet from their ArrayLists the use break; to stop the loop to prevent any index out of bounds execptions.
10. Alternatively, you might be able to use processing's get() to check for collisions.
11. Submit the same URL for your AsteroidsGame that you submitted for the three previous assignments to the school loop drop box.

If you have extra time, you might add some extra features to your Asteroids game. Have fun and be creative!

-Randomly shaped Asteroids
-Different types of weapons besides bullets
-Have two Asteroids classes, one large and one small. When a large Asteroid is removed from the ArrayList add two small ones with the same x and y
-Add a second ship (UFO) that appears after a while and shoots at the space ship
-Keep track of the score and/or the health of the ship

Samples of Student Work
-----------------------
[Elston](http://458elma.github.io/AsteroidsGame/)  
[Melody](http://itsmelodious.github.io/AsteroidsGame/)  
[Victor](http://anonymousm3xican.github.io/AsteroidsGame/)  
[Thomas](http://leechak.github.io/AsteroidsGame/)  
[Francisco](http://frbui.github.io/AsteroidsGame/)  
[Simon](http://omgitssimon.github.io/AsteroidsGame/)  
[Lin](http://lin00.github.io/AsteroidsGame/)  
[Skylar](http://sky121.github.io/AsteroidsGame/)  
[Hannah](http://kaliburr.github.io/AsteroidsGame/)  
[Linda](http://wanglindal.github.io/AsteroidsGame/)  
[Thomas](http://whatarethose.github.io/AsteroidsGame/)  
[Kiara](http://kiaragil.github.io/AsteroidsGame/)  
[Justin](http://theotherjustin.github.io/AsteroidsGame/)  
[Alex](http://alexlo1.github.io/AsteroidsGame/)  
[Sida](http://sidaqin.github.io/AsteroidsGame/)  
[Nicole](http://nicolethai.github.io/AsteroidsGame/)  
[Tiger](http://tigerrlao.github.io/AsteroidsGame/)  
[Dmitry](http://dkuliaev.github.io/AsteroidsGame/)  
[Raymond](http://raymondshew.github.io/AsteroidsGame/)  
[Steven](http://crzysteven.github.io/AsteroidsGame/)  
[Shaye](http://shayehong.github.io/AsteroidsGame/)  
[Megan](http://meegee98.github.io/AsteroidsGame/)  
[Thien](+)  
[Terrance](http://auxoworks.github.io/AsteroidsGame/)  
[Melanie](http://melaniepeng.github.io/AsteroidsGame/)  
[Brian](http://brianlam37.github.io/AsteroidsGame/)  
[Theo](https://awesomestickman.github.io/AsteroidsGame/)  
[Brian](http://btx123.github.io/AsteroidsGame/)  
[Steven](http://crzysteven.github.io/AsteroidsGame/)  
[Lawrence](http://shakaking.github.io/AsteroidsGame/)  
[Anya](https://anyacakes.github.io/AsteroidsGame/)  
[Aliya](http://aliyachambless.github.io/AsteroidsGame/)  
[Simon](http://omgitssimon.github.io/AsteroidsGame/)  
[Chris](http://cjlim2007apcs.github.io/AsteroidsGame/)  
[Howard](http://apcshoward.github.io/AsteroidsGame/)  
[Helen](http://hezhang2.github.io/AsteroidsGame/)  
[Daniel](http://donutdaniel.github.io/AsteroidsGame/)  
[Rebecca](http://rebeckur.github.io/AsteroidsGame/)  
[Marvin](http://mluong888.github.io/AsteroidsGame/)  
[Esther](http://elam2016.github.io/AsteroidsGame/)  
[Reesa](http://aljini.github.io/AsteroidsGame/)  
[Matthew](http://yeahmatts.github.io/AsteroidsGame/)  
[Kaki](http://kaki123.github.io/AsteroidsGame/)  
[Brian](http://articlegend.github.io/AsteroidsGame/)  
[Leif](http://leifmorgan.github.io/AsteroidsGame/)  
[Edmond](http://edmondsitu.github.io/AsteroidsGame/)  
[Brandon](http://brfong1.github.io/AsteroidsGame/)  
[Emily](http://emyee19.github.io/AsteroidsGame/)  
[Tian Lun](http://tianlunlee.github.io/AsteroidsGame/)  
[Jamila](http://jamillas.github.io/AsteroidsGame/)  
[Jimmy](http://furiouspenguins.github.io/AsteroidsGame/)  
[Noah](http://noahzpepper.github.io/AsteroidsGame/)  
[Martin](http://marrtinj.github.io/AsteroidsGame/)  
[Amy](http://amhe3.github.io/AsteroidsGame/)  
[Evan](http://evhuang.github.io/AsteroidsGame/)  
[Kevin](http://oohklim.github.io/AsteroidsGame/)  
[Jeremy](http://gitrektapcs.github.io/AsteroidsGame/)  
[Jacky](http://jackyrobot.github.io/AsteroidsGame/)  
[Eric](http://eryup.github.io/AsteroidsGame/)  
[Brandi](http://brw1221.github.io/AsteroidsGame/)  
[Alexander](http://alzhu1.github.io/AsteroidsGame/)  
[Justin](http://justinleong360.github.io/AsteroidsGame/)  


*This assignment was selected as a "Nifty CS Assignment" in 2008 by Nick Parlante @ Stanford*
