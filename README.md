TinyGrammar Jolie wrapper
=========================

TinyGrammar is a minimalistic implementation of Chomsky's [generative grammar](https://en.wikipedia.org/wiki/Generative_grammar) wrote by [Massimo Barbieri](http://www.massimobarbieri.it)
This is a Jolie (http://www.jolie-lang.org/) wrapper with translation support.

## Key features

* Supports both .NET Framework and .NET Core version of TinyGrammar

* Automatic translation through Google Translator APIs (default from italian to english)

## Examples
All examples use "tecnichese grammar":
[Tecnichese generator](http://massimobarbieri.it/it/Tecnichese) is a funny nonsense-technical Italian sentence generator

> jolie tinygrammar.ol

per non bloccare l'operatività del Cliente, sarà necessario mettere in cluster sistemi Active Directory; il software quindi permetterà di generare ex novo un campo automatico

in order not to block the Client's operation, it will be necessary to cluster Active Directory systems;
the software will then allow you to generate an automatic field from scratch

> jolie tinygrammar.ol fr

per fornire l'accesso a uno stream Xml:<br/> 1. fare l'upgrade di flussi di informazione<br/> 2. convertire in Unicode un applicativo Silverlight<br/> 3. verificare la compatibilità di un controller Mvc

pour donner accès à un flux XML: <br/> 1. mettre à jour les flux d'information <br/> 2. convertir une application Silverlight en Unicode <br/> 3. vérifier la compatibilité d'un contrôleur
Mvc

## Environment

* Jolie

## License

GNU GENERAL PUBLIC LICENSE V 3

Copyright (C) [Marco Montesi](http://mmontesi.blogspot.it/)
