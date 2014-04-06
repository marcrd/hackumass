import processing.serial.*;
 
Serial myPort;        // The serial port
int xPos = 1;         // horizontal position of the graph
float lastValue = 0;

void setup () {
   size(800, 600);        
   myPort = new Serial(this, Serial.list()[1], 9600);
   myPort.bufferUntil('\n');
   background(0);
}
 
void draw () {}
 
void serialEvent (Serial myPort) {
   String inString = myPort.readStringUntil('\n');
   
   if (inString != null) {
       inString = trim(inString);
       // convert to an int and map to the screen height:
       float inByte = float(inString); 
       inByte = map(inByte, 0, 1023, 0, height);
       
       // draw the line:
       stroke(127,34,255);
       line(xPos, height, xPos, height - inByte);
       
       // at the edge of the screen, go back to the beginning:
       if (xPos >= width) {
           xPos = 0;
           background(0); 
       } 
       else {
           xPos++;
       }
   }
}
