class MaConsole{

  String message;
  PVector location;
  color couleur;
  PFont font;
  
  MaConsole(float _x, float _y){
    
    location = new PVector (_x, _y);
    message = "";
    couleur = color(0, 103, 153);
    
  }
  
  void testCombinaison(){
    
    if(message.equals("123")){
    
      println("123");
      
    } else if (message.equals("121")){
      
      println("121");
    
    } else if (message.equals("321")){
      
      println("321");
      
    }
      
  }
  
  void updateMessage(String _str){
    
    String lastCharacter = "";
    
    if(message.length() > 0){
      
      lastCharacter = message.substring(message.length()-1);
    }
    
    if(lastCharacter.equals(_str)){
      println("dernière zone activée");
    } else {
      message = message + _str;
    }
  }
  
  
  void display(){ 
    fill(couleur);
    text(message, location.x, location.y);
  }
  
  
}
