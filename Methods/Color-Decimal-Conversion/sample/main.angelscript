﻿/*
*
* Sample: Loading Scene
* by Henrique Kraemer 	(www.henriquekraemer.com)
* 						(www.github.com/henriquekraemer)
*
*
*/

#include "ColorDecimalConversion.angelscript"

void main()
{
	LoadScene("", "onCreate", "");

}

void onCreate(){
	float R = 255;
	print("R (int): " + R);

	R = ColorDecimalConversion(R);
	print("R (float): " + R);
}