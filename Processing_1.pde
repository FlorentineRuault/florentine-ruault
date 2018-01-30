import processing.serial.*;
import processing.video.*;
 
Serial myPort;
 
/* Movie Variables */
int currentlyPlaying = -1;
int numberOfMovies = 30;
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
char arduinoValue = 0;
int firstSensorValue = 1;
int secondSensorValue = 0;
 
void setup()
{
   String portName = Serial.list()[7];
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
            /* this identifies the sensor which was triggered */
            secondSensorValue = arduinoValue;
                 
            firstSensorTriggered = false;           
            /* finally play the movie, according to the data that has been received */
            runMovie(firstSensorValue, secondSensorValue);
           }
    }
    /* if timer has run out, go back to listening for first sensor */
    else
    {
      firstSensorTriggered = false;
      timer = 0;
    }
   
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
 
void runMovie (int sensor1, int sensor2)
{
  /* Combinations go here */
 if(sensor1 == 1 && sensor2 == 2)
    {
   currentlyPlaying = 0;
    } 
 else if (sensor1 == 1 && sensor2 == 3) 
    {
   currentlyPlaying = 1;
    }
    
    if(sensor1 == 1 && sensor2 == 4)
    {
   currentlyPlaying = 2;
    } 
 else if (sensor1 == 1 && sensor2 == 5) 
    {
   currentlyPlaying = 3;
    }
    
    if(sensor1 == 1 && sensor2 == 6)
    {
   currentlyPlaying = 4;
    } 
 else if (sensor1 == 2 && sensor2 == 1) 
    {
   currentlyPlaying = 5;
    }
    
    if(sensor1 == 2 && sensor2 == 3)
    {
   currentlyPlaying = 6;
    } 
 else if (sensor1 == 2 && sensor2 == 4) 
    {
   currentlyPlaying = 7;
    }
    
    if(sensor1 == 2 && sensor2 == 5)
    {
   currentlyPlaying = 8;
    } 
 else if (sensor1 == 2 && sensor2 == 6) 
    {
   currentlyPlaying = 9;
    }
    
    if(sensor1 == 3 && sensor2 == 1)
    {
   currentlyPlaying = 10;
    } 
 else if (sensor1 == 3 && sensor2 == 2) 
    {
   currentlyPlaying = 11;
    }
    
    if(sensor1 == 3 && sensor2 == 4)
    {
   currentlyPlaying = 12;
    } 
 else if (sensor1 == 3 && sensor2 == 5) 
    {
   currentlyPlaying = 13;
    }
    
    if(sensor1 == 3 && sensor2 == 6)
    {
   currentlyPlaying = 14;
    } 
 else if (sensor1 == 4 && sensor2 == 1) 
    {
   currentlyPlaying = 15;
    }
    
    if(sensor1 == 4 && sensor2 == 2)
    {
   currentlyPlaying = 16;
    } 
 else if (sensor1 == 4 && sensor2 == 3) 
    {
   currentlyPlaying = 17;
    }
    
    if(sensor1 == 4 && sensor2 == 5)
    {
   currentlyPlaying = 18;
    } 
 else if (sensor1 == 4 && sensor2 == 6) 
    {
   currentlyPlaying = 19;
    }
    
    if(sensor1 == 5 && sensor2 == 1)
    {
   currentlyPlaying = 20;
    } 
 else if (sensor1 == 5 && sensor2 == 2) 
    {
   currentlyPlaying = 21;
    }
    
    if(sensor1 == 5 && sensor2 == 3)
    {
   currentlyPlaying = 22;
    } 
 else if (sensor1 == 5 && sensor2 == 4) 
    {
   currentlyPlaying = 23;
    }
    
    if(sensor1 == 5 && sensor2 == 6)
    {
   currentlyPlaying = 24;
    } 
 else if (sensor1 == 6 && sensor2 == 1) 
    {
   currentlyPlaying = 25;
    }
    
    if(sensor1 == 6 && sensor2 == 2)
    {
   currentlyPlaying = 26;
    } 
 else if (sensor1 == 6 && sensor2 == 3) 
    {
   currentlyPlaying = 27;
    }
    
    if(sensor1 == 6 && sensor2 == 4)
    {
   currentlyPlaying = 29;
    } 
 else if (sensor1 == 6 && sensor2 == 5) 
    {
   currentlyPlaying = 28;
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