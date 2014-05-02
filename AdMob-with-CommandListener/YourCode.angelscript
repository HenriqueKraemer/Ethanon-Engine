/* YourCode.angelscript */
const bool GAME_FREE = true;
 
void adMob(bool admob){
        if(GAME_FREE){
                if(admob) ForwardCommand("admob show");
                else ForwardCommand("admob hide");
        }
        else ForwardCommand("admob hide");
}
