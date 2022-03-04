/*
  Arduino LSM9DS1 - Simple Gyroscope

  This example reads the gyroscope values from the LSM9DS1
  sensor and continuously prints them to the Serial Monitor
  or Serial Plotter.

  The circuit:
  - Arduino Nano 33 BLE Sense

  created 10 Jul 2019
  by Riccardo Rizzo

  This example code is in the public domain.
*/

#include <Arduino_LSM9DS1.h>

void setup() {
  Serial.begin(9600);
  while (!Serial);
  Serial.println("Started");

  if (!IMU.begin()) {
    Serial.println("Failed to initialize IMU!");
    while (1);
  }
  Serial.print("Gyroscope sample rate = ");
  Serial.print(IMU.gyroscopeSampleRate());
  Serial.println(" Hz");
  Serial.println();
  Serial.println("Gyroscope in degrees/second");
  Serial.println("X\tY\tZ");
}

void loop() {
  float x, y, z;

  if (IMU.gyroscopeAvailable()) {
    IMU.readGyroscope(x, y, z);

    Serial.print(x);
    Serial.print('\t');
    Serial.print(y);
    Serial.print('\t');
    Serial.println(z);
  }
}
double x;
double y;
double z;
String id="83";
void loop() {
HTTPClient http;
WiFiClient client;
String postData;
String Link;
String param;
param=+"&x"+String (x)+"&y"+String (y)+"&z"+String (z);
Link += String ("http://192.168.0.12/tesis/datos2.php?")+id + param;
if(http.begin(client, Link)){
int httpCode = http.GET();
if(httpCode > 0){
  Serial.println(Link);
  }else{
Serial.printf("error");
  }
  }
  http.end();
   delay(5000);
  }

