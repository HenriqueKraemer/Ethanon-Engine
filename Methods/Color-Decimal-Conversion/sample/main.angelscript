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
	LoadScene("empty", "onCreate", "");

}

void onCreate(){
	float R = 255;

	print("R (int): " + R);
	R = ColorDecimalConversion(R);
	print("R (float): " + R);


	print("");
	vector3 v3_valores(255, 0, 255);

	print("Integer");
	print("R: " + v3_valores.x);
	print("G: " + v3_valores.y);
	print("B: " + v3_valores.z);
	v3_valores = ColorDecimalConversion(vector3(v3_valores));
	print("Float");
	print("R: " + v3_valores.x);
	print("G: " + v3_valores.y);
	print("B: " + v3_valores.z);
}
