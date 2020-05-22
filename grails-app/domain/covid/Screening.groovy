package covid

class Screening {

    String employee
    String phoneNumber
    Home home

    //Start of shift
    Boolean feverIn = false
    String temperatureIn
    Boolean newOnsetIn = false
    Boolean travelOutsideCanada = false
    String travelOutsideCanadaWhere
    Boolean contactPositive = false
    Boolean requiredPPEWorn = false
    Boolean contactIllnessTravelled = false
    Boolean anotherFacility = false
    String anotherFacilityWhere
    Boolean facilityPositive = false
    String facilityPositiveDate
    String screenedByIn

    //End of shift
    Boolean feverOut = false
    String temperatureOut
    Boolean newOnsetOut = false
    String screenedByOut

    String notes

    Date dateCreated
    Date lastUpdated

    static constraints = {
        temperatureIn nullable:true
        travelOutsideCanadaWhere nullable:true
        anotherFacilityWhere nullable:true
        facilityPositiveDate nullable:true
        temperatureOut nullable:true
        screenedByOut nullable:true
        notes nullable:true, type:'text'
    }
}
