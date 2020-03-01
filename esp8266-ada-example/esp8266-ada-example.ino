#include <esp8266_ada_example.h>

void setup() {
  Serial.begin(115200);
  adainit();
}

void loop() {
  main();
}
