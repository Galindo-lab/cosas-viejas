LOVE2D-Example
==============

Example workflow project for LD collab.

Hi woof! I have absolutely no idea how much you know about programming etc, so I decided to hedge my bets and explain everything like you're 5 years old or something. Please understand.

Click "Clone to Desktop" to check out a copy of the project.

#### Running the Game

It's really simple to package up love2d games for distribution when the time comes, but for running a game during development you just drag and drop the game folder onto a love2d shortcut. The game folder is the one that contains main.lua, so in this case it'll be LOVE2D-Example...

You might find it simpler to make a .bat file to do this automatically. Just ask if you don't know how to do this. There's no build/compile step required.

#### Where to put stuff

Generally I use the following structure :

* data/ - assets. Fonts, music, graphics, etc. Also might hold map files if we end up using Tiled or something.
* game/ - game logic. If you want to make balance tweaks or add new stuff, it's in here.
* lib/ - libraries. Most love2d libraries have really awful names. Please understand.
* framework/ - generic code i use in all projects.
* conf.lua - config file. not intended to be edited by end-users, but you might be interested in tweaking a few of these things.
* main.lua - main game loop. fundamental stuff. duhhruhurh.

#### Committing, syncing, etc

I dunno if you've used version control stuff before. The windows application makes it simple enough. I've made you a collaborator, so you can directly commit and modify stuff. Try changing data/img/thing.png and syncing the change out.
