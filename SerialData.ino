#include <Wire.h>
#include <LSM303.h>

LSM303 compass;

char report[80];

void setup()
{
  Serial.begin(9600);
  Wire.begin();
  compass.init();
  compass.enableDefault();
}

void loop()
{
  compass.read();

  snprintf(report, sizeof(report), "%6d",
    compass.a.x);
  Serial.println(report);

  delay(100);
}
