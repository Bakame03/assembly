/**
 * util.cpp
 * Ce fichier contient des fonctions qui vous seront utiles pour gérer l'entrée sortie
 * de vos programmes en assembleur.
 * Auteur : Ricardo Uribe L.
 */

#include <stdio.h>
#include <iostream>
#include <string>

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

extern "C" int afficherFloat(float val)
{
  std::cout << val << std::endl;
  return 0;
}

extern "C" int afficherDouble(double val)
{
//  printf("%lf\n", val);
  std::cout << val << std::endl;
  return 0;
}

extern "C" int afficherEntier(int val)
{
	// printf("%d\n", val);
  std::cout << val << std::endl;
  return 0;
}

extern "C" int afficherLong(long val)
{
//  printf("%ld\n", val);
  std::cout << val << std::endl;
  return 0;
}

/**
* Cette méthode doit être accompagnée d'une demande d'information.
* Attention, sinon, ce message risque de ne pas s'afficher.
*
*/
extern "C" int afficherString(char *chaine)
{
  //printf("%s", chaine);
  std::string strChaine(chaine);
  std::cout << strChaine << std::endl;
  return 0;
}

/**
* Cette fonction n'a pas besoin d'être accompagnée d'une demande
* d'information.
* IMPORTANT : A utiliser pour les messages d'erreur ou d'information.
*/
extern "C" int afficherStringMessage(char *chaine)
{
  //printf("%s", chaine);
  std::string strChaine(chaine);
  std::cout << strChaine << std::endl;
  return 0;
}
extern "C" int afficherCaractere(char caractere)
{
  std::cout << caractere << std::endl;
  return 0;
}


extern "C" int lireEntier()
{
  int n = 0;
  //scanf("%d", &n);
  std::cin >> n;
  return n;
}

extern "C" double lireDouble()
{
  double n = 0.0;
  //scanf("%lf", &n);
  std::cin >> n;
  return n;
}

extern "C" char lireCaractere()
{
  char c;
  std::cin >> c;
  return c;
}

extern "C" char* lireString(char* chaine)
{
  std::string str;
  std::cin.getline(chaine, 100);
  return chaine;
}

/*
 * Cette méthode est utile pour afficher les résultats du exo6 du TP2.
 */
extern "C" int afficher2Doubles(double valA, double valB)
{
  std::cout << "(" << valA << ", " << valB << ")" << std::endl;
  return 0;
}


