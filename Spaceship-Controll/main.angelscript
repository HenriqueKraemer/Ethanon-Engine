/*
*
*	Sample: ETH - Spaceship Controll
* 		by Henrique Kraemer (www.henriquekraemer.com)
*
*
*/

ETHInput@ input = GetInputHandle();
ETHEntity@ spaceship;

void main()
{
	LoadScene("", "createScene", "loopScene");
}

void createScene(){
	AddEntity("nave.ent", vector3(0,0,0), spaceship);
	spaceship.SetPositionXY(vector2(GetScreenSize().x / 2 - spaceship.GetSize().x / 2, GetScreenSize().y - spaceship.GetSize().y));
}

void loopScene(){
	//print(GetFPSRate());
}

void ETHCallback_nave(ETHEntity@ thisEntity){
	float speed = UnitsPerSecond(300.0f);

	/* Keyboard Controll */
	if(input.KeyDown(K_LEFT)) thisEntity.AddToPositionX(-1.0f * speed);	
	if(input.KeyDown(K_RIGHT)) thisEntity.AddToPositionX(1.0f * speed);

	if(input.GetTouchState(0) == KS_HIT || input.GetKeyState(K_SPACE) == KS_HIT)
	{
		/* 			Shoot some bullets ;) 		*/
	}

	/* Accelerometer Controll */
	thisEntity.AddToPositionX(input.GetAccelerometerData().x * 3);


	/* Screen Limit */
	if(thisEntity.GetPositionX() <= Scale(30)) thisEntity.SetPositionX(30);
	else if(thisEntity.GetPositionX() >= GetScreenSize().x - Scale(30)) thisEntity.SetPositionX(GetScreenSize().x - Scale(30));
}