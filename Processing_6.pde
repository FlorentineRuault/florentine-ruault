import processing.serial.*;
import processing.video.*;
 
Serial myPort;
 
/* Movie Variables */
int currentlyPlaying = -1;
int numberOfMovies = 31;
Movie myMovie[];
String val;
 
/* Timer Variables */
long currentTime = millis();
long prevTime = currentTime;
long timeSinceLastFrame = 0;
int timer = 0;
int maxTime= 3000;
/* Sensor Variables */
boolean firstSensorTriggered = false;
char arduinoValue = 6;
int firstSensorValue = 5;
int secondSensorValue = 4;
int thirdSensorValue = 3;
int fourthSensorValue = 2;
int fifthSensorValue = 1;
int sixthSensorValue = 0;
 

void setup()
{
   String portName = Serial.list()[3];
   size(1920, 1080);
   frameRate (30);
  
   myMovie = new Movie[numberOfMovies];
 
  for(int i = 0 ; i < numberOfMovies; i++)
  {
    String fileName = "m";
    fileName += i;
    fileName += ".mp4";
    myMovie[i] = new Movie (this, fileName);
  }
   printArray(Serial.list());
   myPort = new Serial(this, portName , 9600);
}
 
void draw()
{
  /* Timing variables */
  currentTime = millis();
  timeSinceLastFrame = currentTime - prevTime;
  prevTime = currentTime;
  /* --------------- */
  
 /* Has the first sensor been triggered */
  if(firstSensorTriggered)
  {
    /* When listening for a second sensor we have a time limit */
    if(timer < maxTime)
    {
          /* If data is available */
          if(myPort.available() > 0)
           {
            //val = myPort.readStringUntil('\n'); // read it and store it in value
            //println("second sensor data available");
            
            /* read a single byte */
            arduinoValue = myPort.readChar();
            /* print out the data */
            print("Second arduino val: ");
            println(int(arduinoValue));
                  
            arduinoValue = myPort.readChar();
            print("Third arduino val: ");
            println(int(arduinoValue));

            
            arduinoValue = myPort.readChar();
            print("Fourth arduino val: ");
            println(int(arduinoValue));


            arduinoValue = myPort.readChar();
            print("Fifth arduino val: ");
            println(int(arduinoValue));

            
            arduinoValue = myPort.readChar();
            print("Sixth arduino val: ");
            println(int(arduinoValue));
            
            /* this identifies the sensor which was triggered */
            secondSensorValue = arduinoValue;
            thirdSensorValue = arduinoValue;
            fourthSensorValue = arduinoValue;
            fifthSensorValue = arduinoValue;
            sixthSensorValue = arduinoValue;
                 
            firstSensorTriggered = false;           
            /* finally play the movie, according to the data that has been received */
            runMovie(firstSensorValue);
            runMovie(firstSensorValue, secondSensorValue);
            runMovie(firstSensorValue, secondSensorValue, thirdSensorValue);
            runMovie(firstSensorValue, secondSensorValue, thirdSensorValue, fourthSensorValue);
            runMovie(firstSensorValue, secondSensorValue, thirdSensorValue, fourthSensorValue, fifthSensorValue);
            runMovie(firstSensorValue, secondSensorValue, thirdSensorValue, fourthSensorValue, fifthSensorValue, sixthSensorValue);
           }
    }
    /* if timer has run out, go back to listening for first sensor */
    //else
    //{
      //firstSensorTriggered = false;
      //timer = 0;
    //}
   
    /* increase timer */
    timer += timeSinceLastFrame;
  }
  /* If the first sensor has not been triggered */
  else
  {
    /* has the arduino sent data? */
    if(myPort.available() > 0)
    {
      /* Read the data (just a single byte) */
      arduinoValue = myPort.readChar();
      /*print out the value */
      print("First arduino val: ");
      print(int(arduinoValue));
     
      /* the value of the first sensor (this identifies the sensor) */
      firstSensorValue = arduinoValue;
      /* We tell the program that the first sensor has been triggered */
      firstSensorTriggered = true;
    }
  }
    if(currentlyPlaying != -1)
   {
      image(myMovie[currentlyPlaying], 0, 0);
   }
   
  delay(10);
}
 
void movieEvent(Movie m)
    {
  m.read();
    }
 
void runMovie (int sensor1)
  {
          /* Combinations go here */
        if(sensor1 == 1)
            {
           currentlyPlaying = 0;
            }
  }

void runMovie (int sensor1, int sensor2)
  {
          /* Combinations go here */
        if(sensor1 == 1 && sensor2 == 2)
            {
           currentlyPlaying = 1;
            }
         else if (sensor1 == 1 && sensor2 == 3)
            {
           currentlyPlaying = 2;
            }
           
            if(sensor1 == 1 && sensor2 == 4)
            {
           currentlyPlaying = 3;
            }
         else if (sensor1 == 1 && sensor2 == 5)
            {
           currentlyPlaying = 4;
            }
           
            if(sensor1 == 1 && sensor2 == 6)
            {
           currentlyPlaying = 5;
            }
}


void runMovie (int sensor1, int sensor2, int sensor3)
  {
      /* Combinations go here */
           if (sensor1 == 1 && sensor2 == 2 && sensor3 == 1)
              {
             currentlyPlaying = 6;
              }
             
              if(sensor1 == 1 && sensor2 == 3 && sensor3 == 1)
              {
             currentlyPlaying = 7;
              }
           else if (sensor1 == 1 && sensor2 == 4 && sensor3 == 1)
              {
             currentlyPlaying = 8;
              }
             
              if(sensor1 == 1 && sensor2 == 5 && sensor3 == 1)
              {
             currentlyPlaying = 9;
              }
           else if (sensor1 == 1 && sensor2 == 6 && sensor3 == 1)
              {
             currentlyPlaying = 10;
              }
             
              if(sensor1 == 1 && sensor2 == 2 && sensor3 == 3)
              {
             currentlyPlaying = 11;
              }
           else if (sensor1 == 1 && sensor2 == 3 && sensor3 == 2)
              {
             currentlyPlaying = 12;
              }
             
              if(sensor1 == 1 && sensor2 == 4 && sensor3 == 3)
              {
             currentlyPlaying = 13;
              }
           else if (sensor1 == 1 && sensor2 == 5 && sensor3 == 2)
              {
             currentlyPlaying = 14;
              }
             
              if(sensor1 == 1 && sensor2 == 6 && sensor3 == 2)
              {
             currentlyPlaying = 15;
              }
  }      
              
void runMovie (int sensor1, int sensor2,int sensor3, int sensor4)
  {
          /* Combinations go here */
              if (sensor1 == 1 && sensor2 == 2 && sensor3 == 1 && sensor4 == 2)
              {
             currentlyPlaying = 16;
              }
             
              if(sensor1 == 1 && sensor2 == 2 && sensor3 == 3 && sensor4 == 1)
              {
             currentlyPlaying = 17;
              }
           else if (sensor1 == 1 && sensor2 == 2 && sensor3 == 4 && sensor4 == 1)
              {
             currentlyPlaying = 18;
              }
             
              if(sensor1 == 1 && sensor2 == 2 && sensor3 == 5 && sensor4 == 1)
              {
             currentlyPlaying = 19;
              }
           else if (sensor1 == 1 && sensor2 == 2 && sensor3 == 6 && sensor4 == 1)
              {
             currentlyPlaying = 20;
              }
             
              if(sensor1 == 1 && sensor2 == 2 && sensor3 == 3 && sensor4 == 4)
              {
             currentlyPlaying = 21;
              }
  }

void runMovie (int sensor1, int sensor2, int sensor3, int sensor4, int sensor5)
  {
          /* Combinations go here */
           if(sensor1 == 1 && sensor2 == 2 && sensor3 == 1 && sensor4 == 2 && sensor5 == 1)
            {
           currentlyPlaying = 22;
            }
         else if (sensor1 == 1 && sensor2 == 2 && sensor3 == 1 && sensor4 == 3 && sensor5 == 1)
            {
           currentlyPlaying = 23;
            }
            
            if(sensor1 == 1 && sensor2 == 2 && sensor3 == 1 && sensor4 == 4 && sensor5 == 1)
            {
           currentlyPlaying = 24;
            }
         else if (sensor1 == 1 && sensor2 == 2 && sensor3 == 1 && sensor4 == 5 && sensor5 == 1)
            {
           currentlyPlaying = 25;
            }
           
           if(sensor1 == 1 && sensor2 == 2 && sensor3 == 1 && sensor4 == 6 && sensor5 == 1)
            {
           currentlyPlaying = 26;
            }
         else if (sensor1 == 1 && sensor2 == 2 && sensor3 == 3 && sensor4 == 4 && sensor5 == 5)
            {
           currentlyPlaying = 27;
            }
  }

void runMovie (int sensor1, int sensor2, int sensor3, int sensor4, int sensor5, int sensor6)
  {
          /* Combinations go here */
          if(sensor1 == 1 && sensor2 == 2 && sensor3 == 3 && sensor4 == 4 && sensor5 == 5 && sensor6 == 1)
          {
         currentlyPlaying = 28;
          }
       else if (sensor1 == 1 && sensor2 == 2 && sensor3 == 3 && sensor4 == 4 && sensor5 == 5 && sensor6 == 2)
          {
         currentlyPlaying = 29;
          }
          
            if(sensor1 == 1 && sensor2 == 2 && sensor3 == 3 && sensor4 == 4 && sensor5 == 5 && sensor6 == 3)
          {
         currentlyPlaying = 30;
          }
       else if (sensor1 == 1 && sensor2 == 2 && sensor3 == 3 && sensor4 == 4 && sensor5 == 5 && sensor6 == 4)
          {
         currentlyPlaying = 31;
          }
          
          if(sensor1 == 1 && sensor2 == 2 && sensor3 == 3 && sensor4 == 4 && sensor5 == 5 && sensor6 == 6)
          {
         currentlyPlaying = 32;
          }
    
 for(int i = 0; i < numberOfMovies; i ++)
{
   if(i == currentlyPlaying)
    {
     myMovie[i].play();
    }
   else
    {
   myMovie[i].stop();
    }
}
}