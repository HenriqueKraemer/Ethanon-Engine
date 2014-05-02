/* MyGameCommandListener.java */
public class MyGameCommandListener implements NativeCommandListener {
       
        private RelativeLayout rl;
 
        public MyGameCommandListener(RelativeLayout rl) {
                this.rl = rl;
        }
 
        public void parseAndExecuteCommands(String commands) {
                if (!commands.equals("")) {
                        String[] commandArray = commands.split("\n");
                        for (int t = 0; t < commandArray.length; t++) {
                                executeCommand(commandArray[t]);
                        }
                }
        }
 
        private void executeCommand(String cmd) {
                String[] words = cmd.split(" ");
                if (words[0].equals("admob")) {
                        if (words[1].equals("show")) {
                                rl.setVisibility(RelativeLayout.VISIBLE);
                        }
                        else if (words[1].equals("hide")) {
                                rl.setVisibility(RelativeLayout.INVISIBLE);
                        }
                        else System.out.println("FowardCommand: invalido");
                }
        }
 
}
