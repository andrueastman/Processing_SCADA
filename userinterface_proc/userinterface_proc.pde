import controlP5.*;
import java.lang.reflect.*;

int width =150;
int height = 300;
int start=0;

int recty = 120;
int rec1 = 50;
int rec2 = 250;
int rec3 = 450;
int rec4 = 650;
float h1,h2,h3; 
float rat1,rat2,rat3;
float h4=height;
float factor=0.01;
PFont cambria;

int butX = rec1;
int butY = recty+height+60;
int butW = 80;
int butH = 40;
int screenStatus=0;
PFont font = createFont("arial",20);
ControlP5 cp5;

void setup(){
  size(900, 600, P3D);
  cambria = loadFont("Cambria-48.vlw");
  textFont(cambria);
  frameRate(10);
  smooth();
   cp5= new ControlP5(this);
  textSize(18);
  
  
  cp5.addTextlabel("label1").setText("Ratio 1").setPosition(rec1,recty).setColor(color(0)).setFont(createFont("Georgia",20)).hide();
  cp5.addTextlabel("label2").setText("Ratio 2").setPosition(rec2,recty).setColor(color(0)).setFont(createFont("Georgia",20)).hide();
  cp5.addTextlabel("label3").setText("Ratio 3").setPosition(rec3,recty).setColor(color(0)).setFont(createFont("Georgia",20)).hide();
  cp5.addTextlabel("label4").setText("Volume Delivered(ml)").setPosition(rec4,recty).setColor(color(0)).setFont(createFont("Georgia",20)).hide();
  
  cp5.addButton("Mix").setPosition(rec4,recty+90).setSize(100,40).setValue(0).hide();
  cp5.getController("Mix").getCaptionLabel().setFont(font).toUpperCase(false).setSize(24).hide();
  
  cp5.addButton("Another Mixture").setPosition(rec4,recty+90).setSize(100,40).setValue(0).hide();
  cp5.getController("Another Mixture").getCaptionLabel().setFont(font).toUpperCase(false).setSize(24).hide();
  
  cp5.addTextfield("input1").setPosition(rec1,recty+40).setSize(width,40).setFont(font).setColor(color(255,255,255)).setAutoClear(false).hide();
  cp5.addTextfield("input2").setPosition(rec2,recty+40).setSize(width,40).setFont(font).setColor(color(255,255,255)).setAutoClear(false).hide();
  cp5.addTextfield("input3").setPosition(rec3,recty+40).setSize(width,40).setFont(font).setColor(color(255,255,255)).setAutoClear(false).hide();
  cp5.addTextfield("input4").setPosition(rec4,recty+40).setSize(width,40).setFont(font).setColor(color(255,255,255)).setAutoClear(false).hide();
}

void draw(){
   
  if(screenStatus==1){///draw mixer screen
    drawStatus();
  }
  else if(screenStatus==0){/// draw input mixer sccreeen
    drawRatios();
  }
  fill(0);
   textSize(36);
   text("The SCADA System",rec1, 60);
   textSize(18);
   text("Mixing Volumes", rec1, 90);
  
}

void drawRatios(){
  background(255);    // Setting the background to white
  stroke(0);   // Setting the outline (stroke) to black
  cp5.get(Textfield.class,"input1").show();
  cp5.get(Textfield.class,"input2").show();
  cp5.get(Textfield.class,"input3").show();
  cp5.get(Textfield.class,"input4").show();
  
  cp5.get(Button.class,"Mix").show();
  cp5.getController("Mix").getCaptionLabel().setFont(font).toUpperCase(false).setSize(24).show();
  cp5.get(Textlabel.class,"label1").show();
  cp5.get(Textlabel.class,"label2").show();
  cp5.get(Textlabel.class,"label3").show();
  cp5.get(Textlabel.class,"label4").show();
}

void drawStatus(){
  cp5.get(Textfield.class,"input1").hide();
  cp5.get(Textfield.class,"input2").hide();
  cp5.get(Textfield.class,"input3").hide();
  cp5.get(Textfield.class,"input4").hide();
  
  cp5.get(Button.class,"Mix").hide();
  cp5.getController("Mix").getCaptionLabel().setFont(font).toUpperCase(false).setSize(24).hide();
  cp5.get(Textlabel.class,"label1").hide();
  cp5.get(Textlabel.class,"label2").hide();
  cp5.get(Textlabel.class,"label3").hide();
  cp5.get(Textlabel.class,"label4").hide();
  background(255);    // Setting the background to white
  stroke(0);          // Setting the outline (stroke) to black
  fill(255, 0, 0);    // Setting the interior of a shape (fill) to red
  rect(rec1, recty, width, height);
  fill(0, 255, 0);    // Setting the interior of a shape (fill) to red
  rect(rec2, recty, width , height);
  fill(0, 0, 255);    // Setting the interior of a shape (fill) to red
  rect(rec3, recty, width , height);
  fill(255, 255, 255);    // Setting the interior of a shape (fill) to red
  rect(rec4, recty, width , height);
  if(start==1){
    mix(rat1,rat2,rat3);
  }
  fill(9);
  rect(rec1, recty, width, h1);
  rect(rec2, recty, width , h2);
  rect(rec3, recty, width , h3);
  rect(rec4, recty, width , h4);
  
  
  
  
 
 text("Tank 1", rec1, recty+height+30);
 text("Tank 2", rec2, recty+height+30);
 text("Tank 3", rec3, recty+height+30);
 text("Tank 4", rec4, recty+height+30);
 
 
 //if ((mouseX > butX) && (mouseX < butX+butW) && (mouseY > butY) && (mouseY < butY+butH) && mousePressed && start==0) {
   //start=1;
 //}
 //else if ((mouseX > butX) && (mouseX < butX+butW) && (mouseY > butY) && (mouseY < butY+butH) && mousePressed && start==1) {
   //start=0;
 //}
 
// if(start==1){
//   fill(255,0,0);
//   rect(butX, butY, butW, butH);
//   fill(0);
//   text("Stop", butX+butW/4, butY+butH/2);
// }
// else if(start==0){
//   fill(0,0,255);
//   rect(butX, butY, butW, butH);
//   fill(0);
//   text("Start", butX+butW/4, butY+butH/2);
// }
// 
  //button
  
}

float getLevel(float h,float rate){
  h=h+rate;
  if(h<=0){
    return 0;
  }
  else if(h>=height){
    return height;
  }
  else{
    return h;
  }
}

void init_mix(float tank1,float tank2,float tank3,float capacity){
  float sum=tank1+tank2+tank3;
  float rateFactor=(height/capacity)*(1/sum);
  rat1=tank1*rateFactor;
  rat2=tank2*rateFactor;
  rat3=tank3*rateFactor;
}
void mix(float tank1,float tank2,float tank3){
  if(h4<=0){
    start=0;
  }
  h1=getLevel(h1,tank1);
  h2=getLevel(h2,tank2);
  h3=getLevel(h3,tank3);
  float sum=tank1+tank2+tank3;
  h4=getLevel(h4,-sum);//negative rises while positive falls
  //println(sum);
}

public void controlEvent(ControlEvent theEvent) {
  //println(theEvent.getController().getName());
  if(theEvent.getController().getName().equals("Mix")){
    try{
      if(cp5.get(Textfield.class,"input1").getText().equals("") || cp5.get(Textfield.class,"input2").getText().equals("") || cp5.get(Textfield.class,"input3").getText().equals("") || cp5.get(Textfield.class,"input4").getText().equals("")){
         return; 
      }else{    
        String data1=cp5.get(Textfield.class,"input1").getText();
        String data2=cp5.get(Textfield.class,"input2").getText();
        String data3=cp5.get(Textfield.class,"input3").getText();
        String data4=cp5.get(Textfield.class,"input4").getText();
        int ratio1=Integer.parseInt(data1);
        int ratio2=Integer.parseInt(data2);
        int ratio3=Integer.parseInt(data3);
        int amount=Integer.parseInt(data4);
        
        init_mix(ratio1,ratio2,ratio3,amount);
        screenStatus=1;
        start=1;
        
        
      }
    }catch(NumberFormatException nfe){
      nfe.getCause();
    }
    catch(Exception ee){
      ee.getCause();
    }
  }
  else if(theEvent.getController().getName().equals("Another Mixture")){
    h4=height;
    screenStatus=0;
    start=0;
  }
  else
    println(theEvent.getController().getName());
}
