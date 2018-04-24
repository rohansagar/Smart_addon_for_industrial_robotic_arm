/*
This device is used as an attachment to the gencobot robotic arm to allow
it to recognize colors and send it to a computer for use in additional applicaions

It uses an adafruit color sensor to read the colors. It also uses an arduino which 
reads the data from the sensor and sends it to the computer upon request from the 
computer program. It essentially acts as the communication link between the computer
and the sensor
*/

#include <Wire.h>
#include "Adafruit_TCS34725.h"
#include <SoftwareSerial.h>

SoftwareSerial btserial(10, 11); // RX, TX

   
/* Initialise with default values (int time = 2.4ms, gain = 1x) */
// Adafruit_TCS34725 tcs = Adafruit_TCS34725();

/* Initialise with specific int time and gain values */
Adafruit_TCS34725 tcs = Adafruit_TCS34725(TCS34725_INTEGRATIONTIME_700MS, TCS34725_GAIN_1X);

void setup(void) {
  Serial.begin(38400);
  btserial.begin(38400);
 }

 void loop(void) {
  uint16_t r, g, b, c, colorTemp, lux;
 if( (btserial.available() != 0 && btserial.read()==49)|| (Serial.available() != 0 && Serial.read()==49) )
 // if data is requested(by sending a 1 which signifies a request)
 {
  tcs.getRawData(&r, &g, &b, &c);
 
  // read the color

  if(c>35000){
    btserial.println("0"); // 0 is for white
    Serial.println("0");
    }

  else 
  {
     if(r>g+1000 && r>b+1000)
     {
      btserial.println("1"); // 1 is for red
      Serial.println("1");

      }

     else if(g>r+1000 && g>b+1000)
     {
      btserial.println("2"); // 2 is for green
      Serial.println("2");

      }

     else if(b>r+1000 && b>g+1000)
     {
      btserial.println("3"); // 3 is for blue
      Serial.println("3");

      }

     else 
     {
       btserial.println("4"); // for all other colors 
       Serial.println("4");

      }
  }

}

}


