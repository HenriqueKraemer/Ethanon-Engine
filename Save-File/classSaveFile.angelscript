final class GameSave 
{
  enmlFile save;
  int high_score = -1;
 
  void saveOpen() {
    string str = GetStringFromFile(gameFile);
    str = encrypt(str);
 
    if(str == "") print("File Not Found!");
    
    else if (save.parseString(str) != 0) print("Error save.saveOpen: " + save.getErrorString());
 
    if(gamesave.save.getInt("file" , "high_score" , high_score) == false)
    {
      gamesave.save.addValue("file" , "high_score", "" + 0) ;
      high_score = 0;
    }
 
    print("High Score(loaded) = " + high_score);
  }
 
  void saveWrite() const {
    print("Saving Data...");
 
    gamesave.save.addValue("file" , "high_score", "" + high_score) ;
 
    string str = save.generateString();
    str = encrypt(str);
    SaveStringToFile(gameFile, str);
  }
 
  string encrypt(string str) {
    // Create your own algorithm ;)
    return str;
  }
}
