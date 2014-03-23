public class EthanonActivity extends GS2DActivity {
    private RelativeLayout rl;
     
    AdRequest adRequest = new AdRequest.Builder()
    .addTestDevice("AC98C820A50B4AD8A2106EDE96FB87D4") // ID do seu aparelho
    .build();
 
    @Override
    public void onCreate(Bundle savedInstanceState) {
        AdView adView = new AdView(this, AdSize.BANNER, "your_admob_key"); //Sua chave do AdMob
        adView.loadAd(new AdRequest());
 
        rl = new RelativeLayout(this);
        rl.addView(adView);
        rl.setGravity(Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
        rl.bringToFront();
        rl.setVisibility(RelativeLayout.VISIBLE);
         
        super.onCreate(savedInstanceState);
        setSensorOrientation();
    }
     
    @Override
    public void onStart() {
        super.onStart();
        this.addContentView(rl, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
    }
 
    private void setSensorOrientation() {
        try {
            int screenOrientation = getPackageManager().getPackageInfo(getPackageName(), PackageManager.GET_ACTIVITIES).activities[0].screenOrientation;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.GINGERBREAD) {
                if (screenOrientation == ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE)
                    setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
                else if (screenOrientation == ActivityInfo.SCREEN_ORIENTATION_PORTRAIT)
                    setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR_PORTRAIT);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}