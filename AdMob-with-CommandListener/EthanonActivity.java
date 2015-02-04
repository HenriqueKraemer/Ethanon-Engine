/* EthanonActivity.java */
public class EthanonActivity extends GS2DActivity {
        private RelativeLayout rl;
       
        @Override
        public void onCreate(Bundle savedInstanceState) {
               
                AdRequest adRequest = new AdRequest();
                adRequest.addTestDevice("Android Device ID"); // Available on logcat
                
                /* Its very important set your device as test device */
               
                AdView adView = new AdView(this, AdSize.BANNER, "adMob key");
                adView.loadAd(new AdRequest());
 
                rl = new RelativeLayout(this);
                rl.addView(adView, 0);
                rl.setGravity(Gravity.CENTER_HORIZONTAL);
               
                rl.bringToFront();
                rl.setVisibility(RelativeLayout.VISIBLE);
               
                super.onCreate(savedInstanceState);
                setSensorOrientation();
        }
       
        @Override
        public void onStart(){
                super.onStart();
               
                /* Ignore the error below, it disappears after the build */
                this.addContentView(rl, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
 
                insertCommandListener(new MyGameCommandListener(rl));
        }
 
        .
        .
        .
}
