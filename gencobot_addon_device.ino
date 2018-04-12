/*
This device is used as an attachment to the gencobot robotic arm to allow
it to recognize colors and send it to a computer for use in additional applicaions

It uses an adafruit color sensor to read the colors. It also uses an arduino which 
reads the data from the sensor and sends it to the computer upon polling by the 
master program. It essentially acts as the communication link between the computer
and the sensor
*/

#define color_detection_treshold 100
#define polling_symbol 1
#include "Adafruit_TCS34725.h" // adafruit color sensor library

Adafruit_TCS34725 tcs = Adafruit_TCS34725(TCS34725_INTEGRATIONTIME_50MS, TCS34725_GAIN_4X);


void setup() {
  Serial.begin(9600);

  if (tcs.begin()) {
    Serial.println("Found sensor");
  } else {
    Serial.println("No TCS34725 found ... check your connections");
    while (1); // halt!
  }



}

void loop(){

  uint16_t clear, red, green, blue;

  tcs.setInterrupt(false);      // turn on LED

  delay(60);  // takes 50ms to read 
  
  tcs.getRawData(&red, &green, &blue, &clear);

  tcs.setInterrupt(true);  // turn off LED
  if(Serial.available() && Serial.read()==polling_symbol/*there is a poll from the computer*/)
  {
  /*
  these few lines of code are for debugging the color caliberation
  Serial.print("C:\t"); Serial.print(clear);
  Serial.print("\tR:\t"); Serial.print(red);
  Serial.print("\tG:\t"); Serial.print(green);
  Serial.print("\tB:\t"); Serial.print(blue);
	*/
  	if(red>color_detection_treshold)
  		Serial.println("0"); // 0 indicates red

  	else if(green > color_detection_treshold)
  		Serial.println("1"); // 1 indicates green
  	
  	else if (blue > color_detection_treshold)
  		Serial.println("2"); // 2 indicates blue

  	else 
  	 	Serial.println("3") ; // 3 indicates undefined

	}
}
