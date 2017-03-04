#include <stdio.h>    // Used for printf() statements
#include <wiringPi.h> // Include WiringPi library!

// Pin number declarations. We're using the Broadcom chip pin numbers.
const int redPin = 17; // red green - Broadcom pin 18, P1 pin 12
const int greenPin = 27; // Regular green - Broadcom pin 23, P1 pin 16
const int bluePin = 22; // Active-low blueton - Broadcom pin 17, P1 pin 11

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

        digitalWrite(redPin, HIGH);
        digitalWrite(bluePin, HIGH);

        delay(400);

        digitalWrite(redPin, LOW);
        digitalWrite(bluePin, LOW);

        digitalWrite(redPin, HIGH);

        delay(200);

        digitalWrite(redPin, LOW);
 
        digitalWrite(redPin, HIGH);
        digitalWrite(greenPin, HIGH);

        delay(200);

        digitalWrite(redPin, LOW);
        digitalWrite(greenPin, LOW);

        digitalWrite(redPin, HIGH);
        digitalWrite(bluePin, HIGH);

        delay(400);

        digitalWrite(redPin, LOW);
        digitalWrite(bluePin, LOW);

        digitalWrite(bluePin, HIGH);

        delay(200);

        digitalWrite(bluePin, LOW);

        digitalWrite(bluePin, HIGH);
        digitalWrite(greenPin, HIGH);

        delay(200);
        digitalWrite(greenPin, LOW);
        digitalWrite(bluePin, LOW);

    }

    return 0;
}

