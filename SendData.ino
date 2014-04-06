const int xPin = 4;
const int yPin = 5;

void setup()
{
    Serial.begin(9600);
}

void loop()
{
    int xValue;
    int yValue;
    xValue = analogRead(xPin);
    yValue = analogRead(yPin);
    
    //Serial.println(yValue);
    
    Serial.print(xValue);
    Serial.print(",");
    Serial.print(yValue);
    Serial.println("");
    
        
    delay(100);
}
