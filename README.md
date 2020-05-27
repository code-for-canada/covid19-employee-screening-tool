# COVID-19 Screening Tool

A tool for screening employees when entering and leaving a location.  Some of the features include:

* A single record includes both the arrival and departure information for an employee or visitor
* Management of an employee list which can help speed up the screening process 
* Employee list can be imported from an Excel file
* Administrators can add notes to a screening entry (e.g. to indicate there was follow-up on flagged entries)
* Screening entries can be exported to Excel for review

![Screenshot 1][screen1]

![Screenshot 2][screen2]

![Screenshot 3][screen3]

## Setting up

Follow these instructions to get the project setup on your local machine for development and testing purposes. See deployment for notes below when you're ready to deploy the project on a live system.

### Java

You will need a Java Development Kit (JDK) installed at version 8 or higher. Download the appropriate JDK for your operating system, run the installer, and then set up an environment variable called JAVA_HOME pointing to the location of this installation.

### Grails 

To automate the installation of Grails we recommend [SDKMAN](http://sdkman.io/) which greatly simplifies installing and managing multiple Grails versions.

```
curl -s "https://get.sdkman.io" | bash
source ~/.sdkman/bin/sdkman-init.sh
sdk install grails
```

### Installing and Running

The run the application for development and testing after cloning the git repository:

```
./gradlew bootRun
```  

When startup has completed, you will see a message containing a link to the running application.

```
Grails application running at http://localhost:8080 in environment: development
```

## Authentication and Authorization 

This application was designed to use a connection to an LDAP server for authentication and authorization.  This is currently disabled but can enabled and configured in `/grails-app/conf/application.yml`.

When the application is run without LDAP, two user accounts are automatically created.  

| Username | Password | Role | Description |
| -------- | -------- | ---- | ----------- |
| admin | admin | ROLE_COVID_ADMINISTRATORS | Employee management, screening reports |
| screener | screener | ROLE_COVID_SCREENERS | Can perform screening only |

You can modify the default users in `/grails-app/init/convid/Bootstrap.groovy`.


## Deployment

To package the application for deployment, use the assemble task:

```
./gradlew assemble
```

Copy the assembled jar (`/build/libs/covid-1.0.jar`) to the desired location and execute it either directly (as shown below) or by creating a service with something like systemd.

```
java -jar covid-1-0.jar
```

## Configuration 

Application properties can most easily be configured by placing an `application.yml` file in the same location as the `.jar`.  These settings will override what is found in `/grails-app/conf/application.yml`.

By default, this project has a runtime dependency included for connecting to a PostgreSQL database.  This can be replaced with the database library of your choosing.  Set production database properties in the `application.yml`.

build.gradle
```
runtime "org.postgresql:postgresql:42.1.4"
```

## Built With

* [Grails](https:/grails.org) - Web application framework
* [Gradle](https://gradle.org) - Build Tool
* [Bootstrap](https://getbootstrap.com/) - CSS framework

## Getting Help or Reporting an Issue

To report bugs/issues/features requests, please file an [issue](https://github.com/bcgov/nr-get-token/issues).

## How to Contribute

If you would like to contribute, please see our [contributing](CONTRIBUTING.md) guidelines.

Please note that this project is released with a [Contributor Code of Conduct](CODE-OF-CONDUCT.md). By participating in this project you agree to abide by its terms.

## License

    Copyright 2020 Code for Canada

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


[screen1]: screenshot1.png "Screenshot 1"
[screen2]: screenshot2.png "Screenshot 2"
[screen3]: screenshot3.png "Screenshot 3"
