#Watson, a puzzle game

Watson is a clone of “Sherlock”, an old game by Evertt Kaser which is itself based on the a classic puzzle known as ["Zebra puzzle"](https://en.wikipedia.org/wiki/Zebra_Puzzle) or “Einstein's riddle”.

Watson is programmed in plain C with the Allegro 5 library. Big thanks to the friendly folks from #allegro in Freenode for all the tips and advice.
   
The tile set is rendered from TTF fonts obtained from public repositories (fontlibrary.org). There is also an option to load custom tiles, which should be stored in APPDIR/icons into 8 separate folders, each with 8 square tiles in .png format. These won't look as nice as the fonts due to the anti-aliasing. The sounds were taken from freesound.org.
  
##How to play

The board is partitioned into an n x h grid of blocks of same-type items (letters, symbols, greek letters, etc). The goal is to figure out which item goes in each block. Each item should appear exactly once. The game provides clues in two panes (right pane has horizontal clues, bottom pane has vertical clues. Each clue tells you something about the relative position of items in the solution. Depending on the configuration of the main panel, a clue may help you discard some item from a given block. For instance, if a vertical clue tells you that the column of the 'F' letter is between the columns of the symbol '?' and the number '3', this tells you that 'F' can't be in the first or in the last column. If another (vertical) clue tells you that the letter 'F' is in the same column as the greek letter alpha, then you can rule out alpha from the same columns where you ruled out 'F'.

For an explanation of the meaning of each clue, left-click the clue. To get used to the game, it may help to ask for a few hints, which will show you this kind of reasoning. This is done by clicking on the '?' button on the bottom-right corner. 
This will also tell you if you made a mistake (for instance ruling out an item that could not be ruled out).

The default board size is 6 x 6, but you can change it in the settings to any size from 4x4 to 8x8 (different width/height is also possible). The clues provided are guaranteed to lead to a unique solution. There is an 'advanced' option that generates much more difficult puzzles. These assume more indirect reasoning (like assuming that an item is in a given block and seeing what happens, then ruling it out if it leads to a contradiction). In my experience, advanced games tend to be almost impossible for a 6x6 or higher size board (I hope to tune this later). Also, advanced games won't always provide hints. I recommend against using this setting until it is improved.

##Build instructions:

You need Allegro 5 (>= 5.1.9) and cmake.

For Mac OS X (tested with Xcode 5):

	cd watson
	mkdir build
	cd build
	cmake -G Xcode ..
	xcodebuild -config Release

The app bundle will be in the "Release" folder.

For windows (tested in Visual Studio 2015)

	cd watson
	mkdir build
	cd build
	cmake -G "Visual Studio 14 2015" -DAlleg_ROOT="\path\to\allegro\libs" 
	path\to\msbuild.exe watson.vcxproj /p:Configuration=Release

or open the project in Visual Studio and compile for release. After that we need to copy the resources found in the "watson" folder (fonts, icons and sounds) to the application folder, together with all the required dll's (that is, allegro dll's + runtime). 

For Linux: 

	It should work similarly, just remember to copy the /fonts and /sounds folders to the app dir.

## TODO

- Tune the difficulty of 'advanced' mode. 
- Add extra settings to configure the number of revealed blocks and tune other aspects of puzzle generation.
- Add 'undo' button.
- Fix button dimenisons.
