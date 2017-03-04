#include <stdio.h>    // Used for printf() statements
#include <wiringPi.h> // Include WiringPi library!

// Pin number declarations. We're using the Broadcom chip pin numbers.
const int pwmPin = 17; // PWM LED - Broadcom pin 18, P1 pin 12
const int ledPin = 21; // Regular LED - Broadcom pin 23, P1 pin 16
const int butPin = 22; // Active-low button - Broadcom pin 17, P1 pin 11

int main(void)
{
    // Setup stuff:
    wiringPiSetupGpio(); // Initialize wiringPi -- using Broadcom pin numbers

    pinMode(pwmPin, OUTPUT); // Set PWM LED as PWM output
    pinMode(ledPin, OUTPUT);     // Set regular LED as output
    pinMode(butPin, OUTPUT);      // Set button as INPUT

    digitalWrite(pwmPin, LOW);
    digitalWrite(ledPin, LOW);
    digitalWrite(butPin, LOW);
    

    printf("Blinker is running! Press CTRL+C to quit.\n");

    // Loop (while(1)):
    while(1)
    {
 
        digitalWrite(pwmPin, HIGH);
        digitalWrite(ledPin, HIGH);
        digitalWrite(butPin, HIGH);

        delay(400);

        digitalWrite(pwmPin, LOW);
        digitalWrite(ledPin, LOW);
        digitalWrite(butPin, LOW);

        digitalWrite(pwmPin, HIGH);

        delay(200);

        digitalWrite(pwmPin, LOW);

        digitalWrite(ledPin, HIGH);

        delay(150);

        digitalWrite(ledPin, LOW);

        digitalWrite(butPin, HIGH);

        delay(100);

        digitalWrite(butPin, LOW);

    }

    return 0;
}

