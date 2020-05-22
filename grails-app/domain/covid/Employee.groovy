package covid

class Employee {

    String firstName
    String lastName
    String employeeNumber

    //Screening
    String contactNumber

    String dateCreated
    String lastUpdated

    static constraints = {
        employeeNumber nullable:true
        contactNumber nullable:true
    }

    String toString() { "${lastName}, ${firstName}" }
}
