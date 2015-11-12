/* 
Drawing Machine Firmware v0.0.1

@author : Adi Azulay

*/

bool endStop = false;
bool manualMoveForward  = false;
bool manualMoveBackward = false;

#include <Wire.h>
#include <Adafruit_MotorShield.h>
#include "utility/Adafruit_PWMServoDriver.h"

#define ARM_END_STOP_PIN    3  // arm end limit  
#define ARM_HOME_STOP_PIN   4  // arm home limit (0 mm)

//Create shield object
Adafruit_MotorShield motorShield = Adafruit_MotorShield ();


//connect stepper
Adafruit_StepperMotor *armMotor = motorShield.getStepper (200, 1);



void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Serial.println("Drawing Machine bootting up.");
  
  motorShield.begin();
  
  armMotor ->setSpeed(50);
  
}

void loop() {
  listenSerial();
  if (manualMoveForward == true) {
    armMotor->step(1, FORWARD, DOUBLE);
  }
  else if (manualMoveBackward == true) {
    armMotor->step(1, BACKWARD, DOUBLE); 
  }
  else {
    armMotor->step(0, FORWARD, DOUBLE);
  }
}
