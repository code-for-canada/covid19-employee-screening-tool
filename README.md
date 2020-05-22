# COVID-19 Screening Tool

A tool for screening employees when entering and leaving a location.  Some of the features include:

* A single record includes both the arrival and departure information for an employee or visitor
* Management of an employee list which can help speed up the screening process 
* Employee list can be imported from an Excel file
* Administrators can add notes to a screening entry (e.g. to indicate there was follow-up on flagged entries)
* Screening entries can be exported to Excel for review

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

You need a Java Development Kit (JDK) installed at version 8 or higher, but it is not necessary to install Groovy because it's bundled with the Grails distribution.

Authentication and Authorization

This application was designed to use a connection to an LDAP server for authentication and authorization.  This is currently disabled but can enabled and configured in /grails-app/conf/application.yml.

When the application is run in development mode, 2 pre-defined user accounts are automatically created.  

| Username | Password | Role | Description |
| -------- | -------- | ---- | ----------- |
| admin | admin | ROLE_COVID_ADMINISTRATORS | Employee management, screening reports |
| screener | screener | ROLE_COVID_SCREENERS | Can perform screening only |

### Installing

The run the application for development and testing after cloning the git repository:

```
./gradlew bootRun
```  

When startup has completed, you will see a message containing a link to the running application.

```
Grails application running at http://localhost:8080 in environment: development
```

## Deployment

To package the application for deployment, use the assemble task:

```
./gradlew assemble
```

Copy the assembled jar (/build/libs/covid-1.0.jar) to the desired location and execute it either directly (as shown below) or by creating a service with something like systemd:

```
java -jar covid-1-0.jar
```

Configuration 

Application properties can most easily be configured by placing and application.yml file in the same location as the .jar.  These settings will override what is found in /grails-app/conf/application.yml.

By default, this project has a runtime dependency included for connecting to a PostgreSQL database.  This can be replaced with the database library of your choosing.  Remember to set production database properties in the application.yml.

build.gradle
```
runtime "org.postgresql:postgresql:42.1.4"
```

## Built With

* [Grails](https:/grails.org) - Web application framework
* [Gradle](https://gradle.org) - Build Tool
* [Bootstrap](https://getbootstrap.com/) - CSS framework