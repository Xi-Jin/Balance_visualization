import processing.serial.*;
Serial port;
float potVal = 0;
PImage img;


void setup()
{
  size(1440,900);
  port = new Serial (this,"/dev/cu.usbmodem14201",9600);
  port.bufferUntil('\n');
  img = loadImage("loadImage_1.png");

}
void draw ()
{
  if (potVal <= 500){
    background (21,113,69);
    text("max alkaline", 300,400);
    textSize(100);
    fill(209,250,255);
    image(img,0,0);
  }
  else if(485 < potVal && potVal < 537 ){
    background (87,167,115);
    text("alkaline", 300,400);
    textSize(100);
    fill(209,250,255);
  }
  else if (537 <= potVal&& potVal <= 553){
    background (155,209,229);
    text("balance", 300,400);
    textSize(100);
    fill(255,255,255);
  }
  else if (553< potVal && potVal < 608){
    background (255 ,216,190);
    text("acidic", 300,400);
    textSize(100);
    fill(255,255,255);
  }
  else{
    background (147,129,255);
    text("max acidic", 300,400);
    textSize(100);
    fill(255,255,255);
  }
}

void serialEvent(Serial port)
{
  potVal = float(port.readStringUntil('\n'));
}
