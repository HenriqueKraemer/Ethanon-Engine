/*
*
*	Sample: Centralized Camera (following the character)
* 		by Henrique Kraemer (www.henriquekraemer.com)
*
*
*/

ETHEntity @character;

void main()
{
	LoadScene("scenes/01.esc", "onCreateScene", "onSceneCreated");
}

void onSceneCreated(){
	SetBackgroundColor(ARGB(255,100,38,255));
	cameraPos();
}

void onCreateScene(){
	AddEntity("character.ent", vector3(200,265,1), character);
}

void ETHCallback_character(ETHEntity @thisEntity){
	ETHInput@ input = GetInputHandle();

	if(input.KeyDown(K_LEFT)) thisEntity.AddToPositionX(-5);
	else if(input.KeyDown(K_RIGHT)) thisEntity.AddToPositionX(5);
	
	if(input.KeyDown(K_UP)) thisEntity.AddToPositionY(-5);
	else if(input.KeyDown(K_DOWN)) thisEntity.AddToPositionY(5);
}

void cameraPos(){
	SetCameraPos(vector2(character.GetPositionX() - GetScreenSize().x / 2.0f, 
		character.GetPositionY() - GetScreenSize().y / 2.0f));
}