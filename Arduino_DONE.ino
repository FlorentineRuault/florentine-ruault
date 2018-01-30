/*
   PIR sensor tester
*/
const int NUM_PIR = 6;
int pirPin[NUM_PIR];
int pirPin2 = 2; // choose the input pin (for PIR sensor)
int pirPin3 = 3;
int pirPin4 = 4;
int pirPin5 = 5;
int pirPin6 = 6;
int pirPin7 = 7;
const int ledPin =  13;         // the number of the LED pin
int reading[NUM_PIR];
int lastReading[NUM_PIR];
 
int calibrationTime = 10;//30;
boolean sensorActive[NUM_PIR];
boolean previousSensorState[NUM_PIR];
 
boolean pirReset[NUM_PIR];
 
unsigned char dataToSend = 0;
 
boolean test = false;
 
void setup()
{
  // start serial port at 9600 bps:
  Serial.begin(9600);
  for(int i = 0; i < NUM_PIR; i++)
  {
    pirPin[i] = 2 + i;
    //Serial.print("Pir PIN: ");
    //Serial.println(pirPin[i]);
    reading[i] = 0;
    lastReading[i] = reading[i];
    sensorActive[i] = false;
    previousSensorState[i] = false;
    pirReset[i] = false;
 
    // initialize the pushbutton pin as an input:
    pinMode(pirPin[i], INPUT);
   
  }
 
for (int i = 0; i < calibrationTime; i++)
  {
    digitalWrite(ledPin, HIGH);
    delay(250);
    digitalWrite(ledPin, LOW);
    delay(250);
    digitalWrite(ledPin, HIGH);
    delay(250);
    digitalWrite(ledPin, LOW);
    delay(250);
  }
  delay(50);
}
 
void loop()
{
  for(int i = 0; i < NUM_PIR; i++)
  {
    reading[i] = digitalRead(pirPin[i]);  // read input value
 
      //Serial.print("Checking pin: ");
      //Serial.println(i);
   
  if (reading[i]  == HIGH && pirReset[i])
  {           
    dataToSend =  i + 1;
    //Serial.write(dataToSend);
    //Serial.println("motion");
    pirReset[i] = false;
    //Serial.print("Getting reading: ");
    //Serial.println(dataToSend);
    Serial.write(dataToSend);
  }
  else
  {
    //dataToSend = 0;
  }
 
  lastReading[i] = reading[i];
 
if(reading[i] == LOW && lastReading[i] == LOW)
  {
    pirReset[i] = true;
    //delay(10);
  }
  
      //Serial.write(reading[i]);
      //Serial.print(" ");
      //Serial.println(lastReading);
 
  //delay(1000);
  //Serial.write(a);
  delay(10);
  }
}

