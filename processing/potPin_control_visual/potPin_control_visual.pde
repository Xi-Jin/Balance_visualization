import processing.serial.*;
Serial port;
float potVal = 0;

void setup()
{
  size(1440,900);
  port = new Serial (this,"/dev/cu.usbmodem14201",9600);
  port.bufferUntil('\n');
}
void draw ()
{
  if (potVal <= 431){
    background (21,113,69);
    text("max alkaline", 300,400);
    textSize(100);
    fill(209,250,255);
  }
  else if(431 < potVal && potVal < 498 ){
    background (87,167,115);
    text("alkaline", 300,400);
    textSize(100);
    fill(209,250,255);
  }
  else if (498 <= potVal&& potVal <= 502){
    background (155,209,229);
    text("balance", 300,400);
    textSize(100);
    fill(255,255,255);
  }
  else if (502< potVal && potVal < 532){
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
