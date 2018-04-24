


/* 
 This code is to receive the data over a software serial port and then echo it to arduino on-board serial
 We use it to receive the data that is being sent from a slave device connected to the arm sensing color 
 and sending it to the master device (this device). This device is again connected to the computer runing 
 matlab
*/

#include <SoftwareSerial.h>

SoftwareSerial bt_master_serial(10, 11); // initializing the software serial to digital pins 10(rx) and 11(tx)
void setup() 
{
  Serial.begin(9600); // setting the on board serial to 9600 baud 
  
  bt_master_serial.begin(38400);  // the communication speed of the bluetooth modules is 38400
}

void loop()
{

  // Keep reading the data from HC-05 bt-module and send to Arduino Serial Monitor
  if (bt_master_serial.available())
    Serial.write(bt_master_serial.read());

  // Keep reading from Arduino Serial Monitor and send to HC-05 module
  if (Serial.available())
    bt_master_serial.write(Serial.read());
}


