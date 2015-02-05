void createInfo(){
	scene_previous = SCENE_HOME; // Setting the previous scene
	AddEntity("b_back.ent", vector3(Scale(50), Scale(30), 1));
}

void loopInfo(){
	backButton();
}