/*
*
*	Sample: Save File
* 		by Henrique Kraemer (www.henriquekraemer.com)
*
*
*/

#include "src/classSaveFile.angelscript"

//Define variables
const string dir        = GetGlobalExternalStorageDirectory();
const string gameFile   = dir + "file.txt";
 
GameSave @gamesave = GameSave();

ETHInput@ input = GetInputHandle();
int score = 0;

void main(){
	LoadScene("empty", "createScene", "loopScene");
}

void createScene(){
	gamesave.saveOpen(); //load file
}

void loopScene(){
	if(input.GetKeyState(K_LMOUSE) == KS_HIT)
	{
		score = rand(1,100);
		
		if(score > gamesave.high_score) // Only saves if score is greater than the storaged score ("high_score").
		{
			gamesave.high_score = score;
    		gamesave.saveWrite();
    	}
	}
}