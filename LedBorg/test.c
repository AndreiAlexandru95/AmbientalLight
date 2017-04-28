#include <stdio.h>    // Used for printf() statements
#include <wiringPi.h> // Include WiringPi library!
#include <unistd.h>
// Pin number declarations. We're using the Broadcom chip pin numbers.
const int redPin = 17; // red green - Broadcom pin 18, P1 pin 12
const int greenPin = 27; // Regular green - Broadcom pin 23, P1 pin 16
const int bluePin = 22; // Active-low blueton - Broadcom pin 17, P1 pin 11

void getColor(void);

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

    sleep(10);
    getColor();

    // Loop (while(1)):
    while(1)
    {
        sleep(30);
        getColor();    

    }

    return 0;
}

// ColorID: 0   ColorName: Red
// ColorID: 1   ColorName: Green
// ColorID: 2   ColorName: Purple
// ColorID: 3   ColorName: Cyan
// ColorID: 4   ColorName: Yellow
// ColorID: 5   ColorName: White
// ColorID: 6   ColorName: Black
// ColorID: 7   ColorName: Blue

void getColor(void){

    int color;
    FILE *colorFile;
    colorFile = fopen("colorFile.txt", "r");
    printf("ok");
    if (colorFile){
        while((color = getc(colorFile)) != EOF){
            printf("The color read from the file is: %d", color);
            switch(color){
                case 0:{
                    digitalWrite(redPin, HIGH);
                    digitalWrite(bluePin, LOW);
                    digitalWrite(greenPin, LOW);
                }
                case 1:{
                    digitalWrite(redPin, LOW);
                    digitalWrite(bluePin, LOW);
                    digitalWrite(greenPin, HIGH);
                }
                case 2:{
                    digitalWrite(redPin, HIGH);
                    digitalWrite(bluePin, HIGH);
                    digitalWrite(greenPin, LOW);
                }
                case 3:{
                    digitalWrite(redPin, LOW);
                    digitalWrite(bluePin, HIGH);
                    digitalWrite(greenPin, HIGH);
                }
                case 4:{
                    digitalWrite(redPin, HIGH);
                    digitalWrite(bluePin, LOW);
                    digitalWrite(greenPin, HIGH);
                }
                case 5:{
                    digitalWrite(redPin, HIGH);
                    digitalWrite(bluePin, HIGH);
                    digitalWrite(greenPin, HIGH);
                }
                case 6:{
                    digitalWrite(redPin, LOW);
                    digitalWrite(bluePin, LOW);
                    digitalWrite(greenPin, LOW);
                }
                default:{
                    digitalWrite(redPin, LOW);
                    digitalWrite(bluePin, HIGH);
                    digitalWrite(greenPin, LOW);
                }
            }
        }
        fclose(colorFile);
    }
}

