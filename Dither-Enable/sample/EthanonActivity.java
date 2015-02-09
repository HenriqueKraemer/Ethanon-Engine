/* FILE: Ethanon\src\net\asantee\ethanon\EthanonActivity.java */

public class EthanonActivity extends GS2DActivity {
	/*...*/

	@Override
	public void onCreate(Bundle savedInstanceState) {

		/*...*/

		GS2DJNI.setSharedData("ethanon.system.gles2dither", "enable");
	}

	/*...*/
}