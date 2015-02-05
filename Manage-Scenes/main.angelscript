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

#include "src/isPointInRect.angelscript"

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
	scene_current = SCENE_HOME;
	returnScene();
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
	/* Android interpretate K_BACK (Backspace) as the physical back button */

	if (input.GetKeyState(K_BACK) == KS_HIT || input.GetKeyState(K_ESC) == KS_HIT)
	{
		if(scene_current != SCENE_HOME){
			scene_current = scene_previous;
			returnScene();
		}
		else Exit();
	}
}

void ETHCallback_b_play(ETHEntity@ thisEntity) { callbackButtons(thisEntity); }
void ETHCallback_b_exit(ETHEntity@ thisEntity) { callbackButtons(thisEntity); }
void ETHCallback_b_credits(ETHEntity@ thisEntity) { callbackButtons(thisEntity); }
void ETHCallback_b_back(ETHEntity@ thisEntity) { callbackButtons(thisEntity); }

void callbackButtons(ETHEntity@ thisEntity)
{
	vector2 size = thisEntity.GetSize();

	if(input.GetTouchState(0) == KS_HIT){
		if(isPointInRect(input.GetTouchPos(0), thisEntity.GetPositionXY(), size, vector2(0.5f, 0.5f))){ 
			if(thisEntity.GetEntityName() == "b_play.ent"){
				scene_current = SCENE_GAME;
				returnScene();
			}
			else if(thisEntity.GetEntityName() == "b_credits.ent"){
				scene_current = SCENE_INFO;
				returnScene();
			}
			else if(thisEntity.GetEntityName() == "b_exit.ent"){
				Exit();
			}
			else if(thisEntity.GetEntityName() == "b_back.ent"){
				scene_current = scene_previous;
				returnScene();
			}
		}
	}
}