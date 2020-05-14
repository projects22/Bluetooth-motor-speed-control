/*
 * Bluetooth motor speed
 * by moty22.co.uk
 * 13/5/20
 *  
*/

byte inB, inA;         //

// the setup function runs once when you press reset or power the board
void setup() {
    // initialize serial communication
  Serial.begin(9600);

}

// the loop function runs over and over again forever
void loop() {

        if (Serial.available() > 1) {
         inA=Serial.read();
         inB=Serial.read();
 //        Serial.write(inA);
 //        Serial.write(inB);
         analogWrite(10, inA*2);
         analogWrite(11, inB*2);
         delay(50);      
       }
 
}



