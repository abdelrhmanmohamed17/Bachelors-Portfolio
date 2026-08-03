

#define trigPin 2
#define echoPin 3
int Buzzer = 8; // Connect buzzer pin to 8
int ledPin= 6;  //Connect LEd pin to 6
float duration, distance; //to measure the distance and time taken 

void setup() {
        Serial.begin (9600); 
        //Define the output and input objects(devices)
        pinMode(trigPin, OUTPUT); 
        pinMode(echoPin, INPUT);
        pinMode(Buzzer, OUTPUT);
        pinMode(ledPin, OUTPUT);
}

void loop() {

    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);
    duration = pulseIn(echoPin, HIGH);
    distance = (duration/2) * 0.034;
    
  if (distance >= 30 || distance <= 0) 
        {
        Serial.println("no object detected");
        digitalWrite(ledPin,LOW);
        noTone(Buzzer);              


       
        }
  else if(distance<=20) {
        Serial.println("object detected \n");
        Serial.print("distance= ");              
        Serial.print(distance);        
        tone(Buzzer,200);              
        digitalWrite(ledPin,HIGH);
  }
}