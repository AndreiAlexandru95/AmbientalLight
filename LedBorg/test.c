#include <stdio.h>    // Used for printf() statements
#include <wiringPi.h> // Include WiringPi library!
#include <time.h>
// Pin number declarations. We're using the Broadcom chip pin numbers.
const int redPin = 17; // red green - Broadcom pin 18, P1 pin 12
const int greenPin = 27; // Regular green - Broadcom pin 23, P1 pin 16
const int bluePin = 22; // Active-low blueton - Broadcom pin 17, P1 pin 11
srand(time(NULL));   // should only be called once
int r = rand();      // returns a pseudo-random integer between 0 and RAND_MAX
int ok = 2;
int p = 0;
int myTime = 0;


int main(void)
{
    // Setup stuff:
    wiringPiSetupGpio(); // Initialize wiringPi -- using Broadcom pin numbers

    pinMode(redPin, OUTPUT); // Set red green as red output
    pinMode(greenPin, OUTPUT);     // Set regular green as output
    pinMode(bluePin, OUTPUT);      // Set blueton as INPUT

    digitalWrite(redPin, LOW);
    digitalWrite(greenPin, LOW);
    digitalWrite(bluePin, LOW);
    

    printf("Blinker is running! Press CTRL+C to quit.\n");

    // Loop (while(1)):
    while(1)
    {
        if (ok == 2){
            ok = 0;
            myTime = 540;
        } else {
            ok++;
            myTime = 270;
        }

        p = r % 3;

        if (p == 0){

            p = r % 3;
            
            if(p == 0){

                digitalWrite(redPin, HIGH);
                delay(myTime);
                digitalWrite(redPin, LOW);

            } else if (p == 1 ){

                digitalWrite(greenPin, HIGH);
                digitalWrite(redPin, HIGH);
                delay(myTime);
                digitalWrite(redPin, LOW);
                digitalWrite(greenPin, LOW);

            } else {

                digitalWrite(bluePin, HIGH);
                digitalWrite(redPin, HIGH);
                delay(myTime);
                digitalWrite(bluePin, LOW);
                digitalWrite(redPin, LOW);
            
            }
        } else if (p == 1){
            
            p = r % 3;
            
            if(p == 0){

                digitalWrite(greenPin, HIGH);
                digitalWrite(redPin, HIGH);
                delay(myTime);
                digitalWrite(redPin, LOW);
                digitalWrite(greenPin, LOW);

            } else if (p == 1 ){

                digitalWrite(greenPin, HIGH);
                delay(myTime);
                digitalWrite(greenPin, LOW);

            } else {

                digitalWrite(bluePin, HIGH);
                digitalWrite(greenPin, HIGH);
                delay(myTime);
                digitalWrite(bluePin, LOW);
                digitalWrite(greenPin, LOW);
            
            }

        } else {
            
            p = r % 3;
            
            if(p == 0){

                digitalWrite(bluePin, HIGH);
                digitalWrite(redPin, HIGH);
                delay(myTime);
                digitalWrite(redPin, LOW);
                digitalWrite(bluePin, LOW);

            } else if (p == 1 ){

                digitalWrite(bluePin, HIGH);
                digitalWrite(greenPin, HIGH);
                delay(myTime);
                digitalWrite(greenPin, LOW);
                digitalWrite(bluePin, LOW);

            } else {

                digitalWrite(bluePin, HIGH);
                delay(myTime);
                digitalWrite(bluePin, LOW);
            
            }

        }
        

    }

    return 0;
}

