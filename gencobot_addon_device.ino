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

/* Example code for the Adafruit TCS34725 breakout library */

/* Connect SCL    to analog 5
   Connect SDA    to analog 4
   Connect VDD    to 3.3V DC
   Connect GROUND to common ground */
   
/* Initialise with default values (int time = 2.4ms, gain = 1x) */
// Adafruit_TCS34725 tcs = Adafruit_TCS34725();

/* Initialise with specific int time and gain values */
Adafruit_TCS34725 tcs = Adafruit_TCS34725(TCS34725_INTEGRATIONTIME_700MS, TCS34725_GAIN_1X);

void setup(void) {
  Serial.begin(9600);
  
  if (tcs.begin()) {
    Serial.println("Found sensor");
  } else {
    Serial.println("check connections");
    while (1);
  }
  
  // Now we're ready to get readings!
}

void loop(void) {
  uint16_t r, g, b, c, colorTemp, lux;
  
  tcs.getRawData(&r, &g, &b, &c);
 // colorTemp = tcs.calculateColorTemperature(r, g, b);
 // lux = tcs.calculateLux(r, g, b);
  
  
  
  
  Serial.print("R: "); Serial.print(r); Serial.print(" ");
  Serial.print("G: "); Serial.print(g); Serial.print(" ");
  Serial.print("B: "); Serial.print(b); Serial.print(" ");
  Serial.print("C: "); Serial.print(c); Serial.print(" ");
  Serial.println(" ");



  if(c>35000){
    Serial.println("white");
    }

  else 
  {
     if(r>g+1000 && r>b+1000){
     
      Serial.print("red");
     }

     else if(g>r+1000 && g>b+1000)
     {
        Serial.print("green");
      }

     else if(b>r+1000 && b>g+1000){
    Serial.print("blue");
    }

}



}


