/*
*
*	Sample: Manage Scenes
* 		by Henrique Kraemer (www.henriquekraemer.com)
*							(www.github.com/henriquekraemer)
*
*
*	NOTES:
*	In this sample i show how to navigate between scenes in an organized way 
*	and easy to understand. Obviously, this code should be adapted and increased 
*	when working with a real project.
*
*/

#include "src/scene-home.angelscript"
#include "src/scene-info.angelscript"
#include "src/scene-game.angelscript"

const uint 	SCENE_HOME = 1, 
			SCENE_INFO = 2, 
			SCENE_GAME = 3;

int scene_current = SCENE_HOME;
int scene_previous = SCENE_HOME;

ETHInput@ input = GetInputHandle();

void main()
{
	LoadScene("", "createLoading", "loopLoading");
}

void createLoading(){
	/* Verify my loading scene sample
		https://github.com/HenriqueKraemer/Ethanon-Engine/blob/master/Loading-Scene/ */
}

void loopLoading(){
	/* Verify my loading scene sample
		https://github.com/HenriqueKraemer/Ethanon-Engine/blob/master/Loading-Scene/ */


	// if all resources are loaded...
		scene_current = SCENE_HOME;
		returnScene();
	//

}

void returnScene(){
	switch (scene_current)
	{
		case SCENE_HOME:
			LoadScene("", "createHome" , "loopHome" , "onResume");
			print("Scene: SCENE_HOME");
			break;

		case SCENE_INFO:
			LoadScene("", "createInfo" , "loopInfo" , "onResume");
			print("Scene: SCENE_INFO");
			break;

		case SCENE_GAME:
			LoadScene("", "createGame" , "loopGame" , "onResume");
			print("Scene: SCENE_GAME");
			break;
	}
}

void backButton(){
	/* The BACKSPACE key on your keyboard will be interpreted as the back button on android */

	if (input.GetKeyState(K_BACK) == KS_HIT || input.GetKeyState(K_ESC) == KS_HIT)
	{
		if(scene_current != SCENE_HOME){
			scene_current = scene_previous;
			returnScene();
		}
		else Exit();
	}
}
