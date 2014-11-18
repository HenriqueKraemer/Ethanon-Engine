/*
*
*	Sample: ETH Cursor (hide/change the cursor image)
* 		by Henrique Kraemer (www.henriquekraemer.com)
*
*
*/

ETHEntity@ mouse;
ETHInput@ input = GetInputHandle();

void main()
{
	HideCursor(true);
	LoadScene("empty", "createScene", "loopScene");
}

void createScene(){
	AddEntity("mouse.ent", vector3(0,0,0), mouse);
}

void loopScene(){
	mouse.SetPositionXY(GetWorldSpaceCursorPos2());
}
