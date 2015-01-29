/*
*
*	Sample: Save File
* 		by Henrique Kraemer (www.henriquekraemer.com)
*
*
*/

#include "src/classSaveFile.angelscript"

ETHInput@ input = GetInputHandle();
int score = 0;

void main()
{
	LoadScene("empty", "createScene", "loopScene");
}

void createScene(){
	gamesave.saveOpen(); //load file
}

void loopScene(){
	if(input.GetKeyState(K_LMOUSE) == KS_HIT){
	{
		score = rand(1,100);
		
		if(score > game.high_score) // Only saves the "score" if is greater than the score ("high_score") file.
		{
			game.high_score = score;
    			game.saveWrite();
    		}
	}
}
