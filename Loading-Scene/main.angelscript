/*
*
*	Sample: Loading Scene
* 		by Henrique Kraemer (www.henriquekraemer.com)
*							(www.github.com/henriquekraemer)
*
*
*
*
*	NOTES:
*	For a smaller loading time is expressly recommended to use bitmaps with 
*	pow2 resolution (16x16, 32x32, 64x64, 128x256, ...) and not greater than 1024. 
*	
*	In desktop environment can not make much difference, however, in a mobile 
*	environment the difference will be huge.
*
*	We must help OpenGL help us :P
*
*
*/

#include "src/drawAlignedLine.angelscript"

uint resourceIterator; // Iterator
const string[] resourcesToLoad = // List all your bitmaps to load
{
	/* Entities */
	"entities/0.png",
	"entities/1.png",
	"entities/2.png",
	"entities/3.png",
	"entities/4.png",
	"entities/5.png",
	"entities/6.png",
	"entities/7.png",
	"entities/8.png",
	"entities/9.png"

	/* Sprites */

	/* Buttons */

	/* Particles */
};

void main(){
	LoadScene("", "createLoadScene", "loopLoadScene"); // call the loading scenes (pre and loop callbacks)
}

void createLoadScene(){
	AddEntity("loading.ent", vector3(GetScreenSize().x / 2, GetScreenSize().y / 2, 0));
}

void loopLoadScene(){
	int percentCalc = ((resourceIterator * 100) / resourcesToLoad.length());

	// This function will draw a string always centered on the screen
	drawAlignedLine(vector2(GetScreenSize().x * 0.5f, GetScreenSize().y * 0.5f), percentCalc + "%", "Verdana24_shadow.fnt", ARGB(255, 255,255,255), vector2(0.5f), Scale(1));

	if (rand(0 , 100) % 20 != 0) return;
	/* Remove the line above to the loading happens naturally. I use to be able to see 
		what is happening on screen. It is very useful to test the loading screen animation. */

	LoadSprite(resourcesToLoad[resourceIterator++]);
    if (resourceIterator == resourcesToLoad.length()){
    	// When all bitmaps are loaded, call your game scene or menu scene.
        LoadScene("", "createGameScene", "loopGameScene");
    }
}

void ETHCallback_loading(ETHEntity@ thisEntity){

	/* Creating some behavior for the loading circle */
	thisEntity.SetScale(1.1);
	thisEntity.AddToAngle(-1);
}

void createGameScene(){

}

void loopGameScene(){
	drawAlignedLine(vector2(GetScreenSize().x * 0.5f, GetScreenSize().y * 0.5f), "All Sprites Loaded ", "Verdana24_shadow.fnt", ARGB(255, 255,255,255), vector2(0.5f), Scale(1));
}