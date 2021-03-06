class Highscore{
  public String[][] highscores;
  
  Highscore(){
    highscores = new String[10][2];
  }
  
  public void readHighscore(){
     String[] lines = loadStrings("Highscores.txt");
     for(int i=0; i<lines.length && i<10; i++){
       String[] tmp = lines[i].split(" ");
       highscores[i][0] = tmp[0];
       highscores[i][1] = tmp[1];
     }
  }
  
  public void addScore(String name, int score){
    for(int i =0; i<10; i++){
      if(score>Integer.parseInt(highscores[i][1])){
        insertScore(i, name, score);
        return;
      }
    }
  }
  
  private void insertScore(int pos, String name, int score){
    String[] tmp = new String[2];
    String[] tmp1 = new String[2];
    tmp[0] = name; tmp[1] = ""+score;
    for(int i = pos; i<10; i++){
      tmp1 = highscores[i].clone();
      highscores[i] = tmp.clone();
      tmp = tmp1.clone();
    }
    currentLevel = 1;
    println("score submitted");
  }
  
  public void writeHighscore(){
    PrintWriter writer = createWriter("Highscores.txt");
    for(int i=0; i<highscores.length; i++){
      writer.println(highscores[i][0] + " " + highscores[i][1]);
    }
    writer.close();
  }
  
  public void printHighscore(){
    for(int i=0; i<highscores.length; i++){
      println(highscores[i][0] + " " + highscores[i][1]);
    }
  }
}