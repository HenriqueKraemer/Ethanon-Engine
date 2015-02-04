/*
*
*	Sample: Touch Entity
* 		by Henrique Kraemer (www.henriquekraemer.com)
*							(www.github.com/henriquekraemer)
*
*
*	NOTES:
*	Sometimes you may want to make the entity clickable, such as (like this sample) using 
*	entities as menu buttons, or take some action through the click in an entity to destroy it or...
*
*/

#include "src/isPointInRect.angelscript"

ETHInput@ input = GetInputHandle();

void main()
{
	LoadScene("", "createMenu");
}

void createMenu(){
	AddEntity("b_play.ent", vector3(GetScreenSize().x / 2, GetScreenSize().y / 2 - Scale(50), 1));
	AddEntity("b_credits.ent", vector3(GetScreenSize().x / 2, GetScreenSize().y / 2, 1));
	AddEntity("b_exit.ent", vector3(GetScreenSize().x / 2, GetScreenSize().y / 2 + Scale(50), 1));
}

void ETHCallback_b_play(ETHEntity@ thisEntity) { callbackButtons(thisEntity); }
void ETHCallback_b_exit(ETHEntity@ thisEntity) { callbackButtons(thisEntity); }
void ETHCallback_b_credits(ETHEntity@ thisEntity) { callbackButtons(thisEntity); }
void ETHCallback_b_back(ETHEntity@ thisEntity) { callbackButtons(thisEntity); }

void callbackButtons(ETHEntity@ thisEntity)
{
	vector2 size = thisEntity.GetSize();

	if(input.GetTouchState(0) == KS_HIT){
		// Check if the entity (button) was clicked with the isPointInRect (available on src/isPointInRect.angelscript)
		if(isPointInRect(input.GetTouchPos(0), thisEntity.GetPositionXY(), size, vector2(0.5f, 0.5f))){ 
			if(thisEntity.GetEntityName() == "b_play.ent"){
				LoadScene("", "genericScene"); // call your game scene
			}
			else if(thisEntity.GetEntityName() == "b_credits.ent"){
				LoadScene("", "genericScene"); // call your credits scene
			}
			else if(thisEntity.GetEntityName() == "b_exit.ent"){
				Exit(); // Exit the game.
			}
			else if(thisEntity.GetEntityName() == "b_back.ent"){
				LoadScene("", "createMenu"); // calling the menu scene when back button is clicked.
			}
		}
	}
}

void genericScene(){
	AddEntity("b_back.ent", vector3(GetScreenSize().x / 2, GetScreenSize().y / 2, 1));
}