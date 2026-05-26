/**
 * util.cpp
 * Ce fichier contient des fonctions qui vous seront utiles pour gérer l'entrée sortie 
 * de vos programmes en assembleur.
 * Auteur : Ricardo Uribe L. 
 */

#include <stdio.h>
#include <iostream>
#include <string>

extern "C" int afficherFloat(float val)
{
  std::cout << val << std::endl;   
  return 0;
}

extern "C" int afficherDouble(double val)
{
  std::cout << val << std::endl;  
  return 0;
}

extern "C" int afficherEntier(int val)
{
  std::cout << val << std::endl;  
  return 0;
}

extern "C" int afficherLong(long val)
{
  std::cout << val << std::endl;  
  return 0;
}

extern "C" int afficherString(char *chaine)
{
  std::cout << chaine;  
  return 0;
}

extern "C" int afficherStringPlusValue(char *chaine, int value)
{
  std::cout << chaine << value << std::endl;  
  return 0;
}

extern "C" int afficherStringPlusInt(char *chaine, int value)
{
  std::cout << chaine << value << std::endl;  
  return 0;
}

extern "C" int afficherStringPluslong(char *chaine, long long value)
{
  std::cout << chaine << value << std::endl;  
  return 0;
}

extern "C" int afficherStringPlusShort(char *chaine, short value)
{
  std::cout << chaine << value << std::endl;  
  return 0;
}

extern "C" int afficherEntierAvecMessage(int val, char* message)
{
  std::cout << message << val << std::endl;  
  return 0;
}

extern "C" int afficherEntierNonSigneAvecMessage(unsigned int val, char* message)
{
  std::cout << message << val << std::endl;  
  return 0;
}

extern "C" int lireEntier()
{
  int n = 0;
  std::cin >> n;
  return n;
}

extern "C" double lireDouble()
{
  double n = 0.0;
  std::cin >> n;
  return n;
}

