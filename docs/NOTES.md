# Notes

## Definition

A Docker-based installer and runtime for website applications.

## IST Situation

* Der Initialaufwand für Docker Web Projekte ist für alle Entwickler ähnlich groß. Dabei ist die Arbeit im Vorfeld
  nahezu immer identisch.

## SOLL Situation

* Schaffen einer Vorlage für Web-Applikationen, mit der Entwickler ohne großen Aufwand Projekte initialisieren können.
* Akzeptanz für die Nutzung von Docker basierenden Applikationen erhöhen.

## Gegenüberstellung

| Pro                                                                                                                               | Contra                                     |
|-----------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------|
| - Initialaufwand für Projekte sind geringer                                                                                       | - Initial Aufwand für die Vorlage ist groß |
| - Akzeptanz für Docker basierende Nutzung wird erhöht im Team                                                                     | - Erheblicher Abstimmungsaufwand im Team   |
| - Einheitliche Vorlage, welche von jedem im Team administriert werden kann                                                        |                                            |
| - Laufende Projekte können jederzeit von anderen Kollegen übernommen werden, <br/>ohne dass es lange Einarbeitungszeiten benötigt |                                            |

## Anforderungen

### Must Have

* Minimalprinzip, nur 2 Services
* Auch für bestehende Projekte nutzbar.
* Erweiterte Konfiguration von Netzwerk und Containern.
* Mindestens 3 Stages (Development, Preview und Production)
* CI/CD ready

### Should Have

* Einfache und nachvollziehbare Konfiguration.
* Umfangreich dokumentiert.
* Zentrales Logging der Container.
* Überwachung der einzelnen Container. (Healthcheck)
* Einfach erweiterbar um zusätzliche Services wie Datenbank, Cache usw.
* Webserver SSL als Standard
* Erweiterungen für PHP können einfach installiert werden. (APCU, OPCache, usw.)

### Nice to Have

* Nutzung von Best Practices.
* Zusätzliche Tools wie Xdebug, PHPStan, CS-Fixer usw.

## Links

* [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
* [Docker development best practices](https://docs.docker.com/develop/dev-best-practices/)
