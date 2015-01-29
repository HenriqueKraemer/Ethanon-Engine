/*
*
*	Sample: Save File
* 		by Henrique Kraemer (www.henriquekraemer.com)
*
*
*/

#include "src/classSaveFile.angelscript"

void main()
{
	LoadScene("empty", "createScene", "loopScene");
}

void createScene(){
	gamesave.saveOpen(); //load file
}

void loopScene(){
	if( /* something */ )
	{
		game.high_score = score;
    		game.saveWrite();
	}
}
