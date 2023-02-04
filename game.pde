float goal_x;
float goal_y;
float ball_x = 500;
float ball_y = 500;
float compare_x;
float compare_y;
float a = 0;
float a_a = 1;
float move_x = 0;
float move_y = 0;
int score = 0;
boolean over = false;
boolean goal_signal = true;
boolean signal = false;
boolean check = true;
String my_text;
color c = #000000;


void setup(){
  textSize(30);
  textAlign(CENTER);
  size(1000,1000);
  stroke(0);
  strokeWeight(1);
  fill(5);
  smooth();
  rectMode(CENTER);
}


void draw(){ 
  background(255);
  fill(c);
  ellipse(ball_x,ball_y,30,30);
  ball_x+=move_x;
  ball_y+=move_y;
  score_();
  goal();
  over_();
  fever();
}



void fever(){
  if(score == 10 && check == true){
    a *= 1.2;
    a_a *= 1.2;
    c = #FF0000;
    check = false;
  }
  if(score == 20 && check == false){
    a *= 1.2;
    a_a *= 1.2;
    c = #0000CD;
    check = true;
  }
  if(score == 30 && check == true){
    a *= 1.2;
    a_a *= 1.2;
    c = #66EC66;
    check = false;
  }
  if(score == 40 && check == false){
    a *= 1.2;
    a_a *= 0;
    c = #9932CC;
    check = true;
  }
  if(score == 50 && check == true){
    a *= 1.4;
    c = #000000;
    check = false;
  }
}
 
//goal
void goal(){
  if(goal_signal == true){
    goal_x = random(40,width-40);
    goal_y = random(40,height-40);
    goal_signal = false;
  }
  if(sqrt(pow((ball_x-goal_x),2)+pow((ball_y-goal_y),2)) <= 20){
    goal_signal = true;
    score ++;
    a += 0.15*a_a;
  }
  fill(255,255,0);
  ellipse(goal_x,goal_y,10,10);
  fill(0);
}
 
void score_(){
  my_text = "score : " + score;
  text(my_text,500,100);
}
 
 
// game_over
void over_(){
  if((ball_x > width-15 || ball_x < 15)||(ball_y > height-15 || ball_y < 15)) {
background(30);
    over = true;
    fill(255);
    ball_x = 2000;  
    ball_x = 2000;
    goal_x = 2000;
    goal_y = 2000;
    move_x = 0;
    move_y = 0;
    stroke(255);
    text("Game Over",width/2,height/2);
    textSize(22);
    text("Continue?",width/2,height/2+20);
    textSize(30);
    fill(255);
    rect(width/2-15,height/2+35,20,20);
    stroke(50);
    ellipse(width/2-15,height/2+35,17,17);
    stroke(255);
    rect(width/2+15,height/2+35,20,20);
    stroke(50);
    line(width/2+8,height/2+42,width/2+22,height/2+28);
    line(width/2+22,height/2+42,width/2+8,height/2+28);
    if((mouseX <= 495 && mouseX >= 475) && (mouseY >= 525 && mouseY <= 545)){
      fill(0,255,0);
      rect(width/2-15,height/2+35,20,20);
      ellipse(width/2-15,height/2+35,17,17);
      fill(255);
      if(mousePressed){
        fill(0);
        goal_x = random(30,width-30);
        goal_y = random(30,height-30);
        ball_x = 500;
        ball_y = 500;
        over = false;
        score = 0;
        a = 0;
        c = #000000;
        
      }
  } 
    if((mouseX <= 525 && mouseX >= 505) && (mouseY >= 525 && mouseY <= 545)){
      fill(255,0,0);
      rect(width/2+15,height/2+35,20,20);
      line(width/2+8,height/2+42,width/2+22,height/2+28);
      line(width/2+22,height/2+42,width/2+8,height/2+28);
      if(mousePressed){
        exit();
      }
    }
}
}



void keyPressed(){
  if(over == false){
    if(key == 'w' || key =='W'){
      move_x = 0;
      move_y = - 4-a;
    }
    if(key == 'a' || key =='A'){
      move_x = -4-a;
      move_y = 0;
    }
    if(key == 's' || key =='S'){
      move_x = 0;
      move_y = 4+a;
    }
    if(key == 'd' || key =='D'){
      move_x = 4+a;
      move_y = 0;
  }
}
}

void mousePressed(){
  if(over == false){
    compare_x = abs(mouseX-ball_x);
    compare_y = abs(mouseY-ball_y);
    if(compare_x >= compare_y){
     if(mouseX-ball_x < 0){
       move_x = -4-a;
       move_y = 0;
     }
     if(mouseX-ball_x >= 0){
       move_x = 4+a;
       move_y = 0;
     }
    } else {
     if(mouseY-ball_y < 0){
       move_x = 0;
       move_y = -4-a;
     }
     if(mouseY-ball_y >= 0){
       move_x = 0;
       move_y = 4+a;
     }
    }
}
}