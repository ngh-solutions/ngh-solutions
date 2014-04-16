#include <Ethernet.h>
#include <SPI.h>
boolean reading = false;

//Konfiguration

  IPAddress ip(192,168,0,10);;   //Manual setup only
  //byte gateway[] = { 192, 168, 0, 1 }; //Manual setup only
  //byte subnet[] = { 255, 255, 255, 0 }; //Manual setup only

  // if need to change the MAC address (Very Rare)
byte mac[] = { 0x90, 0xA2, 0xDA, 0x00, 0x46, 0x7D };

EthernetServer server = EthernetServer(80); //port 80

void setup(){
  
//Pins 10,11,12 & 13 werden vom ethernet shield verwendet, 1 zur Programmübertragung

  pinMode(26, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(8, OUTPUT);
  pinMode(9, OUTPUT);

  Ethernet.begin(mac,ip); //Ethernet.begin(mac, ip, gateway, subnet); //for manual setup
  server.begin();
 
}

void loop(){

  // warten auf Anfragen von Clients
  checkForClient();

}

void checkForClient(){

  EthernetClient client = server.available();

  if (client) {

    
    boolean currentLineIsBlank = true;
    boolean sentHeader = false;

    while (client.connected()) {
      if (client.available()) {

        if(!sentHeader){
          // HTML senden 
          client.println("HTTP/1.1 200 OK");
          client.println("Content-Type: text/html");
          client.println();
   
          client.println("<HTML>");
          client.println("<HEAD>");
          client.println("<TITLE>Arduino</TITLE>");
          client.println("</HEAD>");
          client.println("<BODY>");
          client.println("Arduino IO control <br>");
          client.println("<br>");
          client.println("</a>");
          
          client.println("LED");
          client.println("<a href=\"/?a\" target=\"inlineframe\">ON</a>"); 
          client.println("<a href=\"/?b\" target=\"inlineframe\">OFF</a><br>"); 
          
          
          client.println("");

          client.println("</BODY>");
          client.println("</HTML>");
          sentHeader = true;
        }
//auslesen der Eingabe

        char c = client.read();

        if(reading && c == ' ') reading = false;
        if(c == '?') reading = true; //found the ?, begin reading the info

        if(reading){
          
//schalten der Ausgänge

           switch (c) {
           case 'a':
           digitalWrite(26, HIGH);
           break;
           
           case 'b':
           digitalWrite(26, LOW);
           break;
          }

        }

        if (c == '\n' && currentLineIsBlank)  break;

        if (c == '\n') {
          currentLineIsBlank = true;
        }else if (c != '\r') {
          currentLineIsBlank = false;
        }

      }
    }

    delay(1); // pause für den Browser
    client.stop(); // Verbindung trennen

  }

}

//void triggerPin(int pin, EthernetClient client){
//blink a pin – Client needed just for HTML output purposes.  
/*  client.print("Turning on pin ");
  client.println(pin);
  client.print("<br>");

  digitalWrite(pin, HIGH);
  delay(25);
  digitalWrite(pin, LOW);
  delay(25);
*/
//}
