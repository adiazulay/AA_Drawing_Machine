
boolean endStop = false;
boolean homeStop = false;


int homePosition;
int endPosition;

int armSpeed;


#define ARM_END_STOP_PIN    3  // arm end limit  
#define ARM_HOME_STOP_PIN   4  // arm home limit (0 mm)

//Create shield object
//Adafruit_MotorShield motorShield = Adafruit_MotorShield ();
Adafruit_MotorShield motorShield(0x60);

//connect stepper
Adafruit_StepperMotor *armMotor = motorShield.getStepper (200, 1);
Adafruit_StepperMotor *baseMotor = motorShield.getStepper (200,2);

void forwardArm(){
  armMotor->onestep(FORWARD, SINGLE);
}

void backwardArm(){
  armMotor->onestep(BACKWARD, SINGLE);
}

AccelStepper accelArmMotor(forwardArm, backwardArm);

void drawSetup (){
  motorShield.begin();
  armMotor ->setSpeed(50);
  baseMotor ->setSpeed(50);
}

void moveArm(){
 armSpeed = map (temp, -150, 150, 0, 300);
}



void motorVars(){
  accelArmMotor.setSpeed(armSpeed);
}

void draw(){
accelArmMotor.runSpeed();
}

void checkStop(){
  endStopState = digitalRead(ARM_END_STOP_PIN);
  homeStopState = digitalRead(ARM_HOME_STOP_PIN);
  
  if(ARM_END_STOP_PIN == LOW){
    endStop = true;
    homeStop = false;
    accelArmMotor.moveTo (200);
  }
  if (ARM_HOME_STOP_PIN == LOW){
    homeStop = true;
    endStop = false;
    accelArmMotor.moveTo(-200);
  }
}


void spinBase(){
}
void dripWater(){
}

void calibrate(){
  accelArmMotor.runSpeed();
  if(ARM_END_STOP_PIN == LOW){
    endStop = true;
    homeStop = false;
    endPosition = accelArmMotor.currentPosition();
  }
  if (ARM_HOME_STOP_PIN == LOW){
    homeStop = true;
    endStop = false;
    homePosition = accelArmMotor.currentPosition();
  }
}


