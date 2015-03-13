/*
*
*	Sample: Enable Dither
* 		by Henrique Kraemer (www.henriquekraemer.com)
*							(www.github.com/henriquekraemer)
*
*
*	NOTES:
*	By default, the dither is disabled in Ethanon (android). Which may cause 
*	the color banding (http://en.wikipedia.org/wiki/Colour_banding).
*	
*
*/


/* Add the line below in the onCreate method of EthanonActivity */
GS2DJNI.setSharedData("ethanon.system.gles2dither", "enable");
