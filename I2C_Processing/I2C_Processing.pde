import processing.serial.*;

Serial puerto;
int contador = 0;

void setup() {
  size(600, 400);
  
  String portName = "COM2";
  puerto = new Serial(this, portName, 9600);
  puerto.bufferUntil('\n');
  
  textSize(24);
}

void draw() {
  background(30, 50, 80);
  
  fill(255, 200, 0);
  textSize(32);
  textAlign(CENTER);
  text("Protocolo I2C", width/2, 50);
  
  fill(255);
  textSize(20);
  text("Display LCD 16x2", width/2, 100);
  
  // Simular display LCD
  fill(100, 200, 255);
  rect(150, 150, 300, 100, 10);
  
  fill(0);
  textSize(18);
  textAlign(LEFT);
  text("I2C Protocol", 180, 185);
  text("Counter: " + contador, 180, 220);
  
  fill(200);
  textSize(14);
  textAlign(CENTER);
  text("Comunicación I2C: 2 cables (SDA, SCL)", width/2, 320);
  text("Dirección: 0x27", width/2, 340);
}

void serialEvent(Serial puerto) {
  String datos = puerto.readStringUntil('\n');
  if (datos != null) {
    datos = trim(datos);
    if (datos.startsWith("I2C:COUNTER:")) {
      String valor = datos.substring(12);
      contador = int(valor);
      println("Contador I2C: " + contador);
    }
  }
}
