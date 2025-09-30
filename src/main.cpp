#include <Arduino.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>

// Display I2C en dirección 0x27, 16 columnas, 2 filas
LiquidCrystal_I2C lcd(0x27, 16, 2);

int contador = 0;

void setup() {
  Serial.begin(9600);
  
  // Inicializar I2C
  lcd.init();
  lcd.backlight();
  
  lcd.setCursor(0, 0);
  lcd.print("I2C Protocol");
  lcd.setCursor(0, 1);
  lcd.print("Counter: 0");
  
  Serial.println("Sistema I2C iniciado");
}

void loop() {
  contador++;
  
  // Actualizar display
  lcd.setCursor(9, 1);
  lcd.print("      "); // Limpiar
  lcd.setCursor(9, 1);
  lcd.print(contador);
  
  // Enviar por serial para Processing
  Serial.print("I2C:COUNTER:");
  Serial.println(contador);
  
  delay(1000);
}