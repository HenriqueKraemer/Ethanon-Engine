﻿/*
*
*	Sample: ETH - Brusher
* 		by Henrique Kraemer (www.henriquekraemer.com)
*
*
*/

ETHEntity@ mouse;
ETHInput@ input = GetInputHandle();

vector2 mousePos;

void main()
{
	HideCursor(true);
	LoadScene("", "createScene", "loopScene");
}

void createScene(){
	AddEntity("brush.ent", vector3(0,0,0.01), mouse);
}

void loopScene(){
	mousePos = GetWorldSpaceCursorPos2();
	mouse.SetPositionXY(mousePos);

	if(input.GetKeyState(K_LMOUSE) == KS_DOWN){
		AddEntity("brush.ent", vector3(mousePos.x, mousePos.y, 0));
	}

	if(input.GetKeyState(K_BACK) == KS_DOWN){
		LoadScene("", "createScene", "loopScene");
	}
}