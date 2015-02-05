void createHome(){
	/* On the SCENE_HOME is not necessary to enter a scene_previous, since when 
	is pressed the backbutton, the game will end. */

	AddEntity("b_play.ent", vector3(GetScreenSize().x / 2, GetScreenSize().y / 2 - Scale(50), 1));
	AddEntity("b_credits.ent", vector3(GetScreenSize().x / 2, GetScreenSize().y / 2, 1));
	AddEntity("b_exit.ent", vector3(GetScreenSize().x / 2, GetScreenSize().y / 2 + Scale(50), 1));
}

void loopHome(){
	backButton();
}