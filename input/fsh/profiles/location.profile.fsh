// This is the profile for openIMIS Location 
// Mapping is done throught Location openIMIS entities
Profile: OpenIMISLocation
Parent: Location
Id: openimis-location
Title: "openIMIS Location"
Description: "Defines a Location for openIMIS which maps to a Location"

* id
  * ^short = "Location UUID"
  * ^definition = "Location UUID generated by openIMIS."

* identifier 1..* MS // Must contain at least the Location Code
* identifier.type 1..1  
* identifier.type.coding.code from OpenIMISIdentifierVS (required)
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.rules = #closed
* identifier contains
    LocationCode 1..1 MS and
    LocationUUID 0..1 and
    LocationID 0..1
* identifier[LocationCode].type.coding.code = OpenIMISIdentifierCS#Code // it is mapped to CHFID
  * ^short = "Location openIMIS Code"
  * ^definition = "Location Code managed by openIMIS."
* identifier[LocationUUID].type.coding.code = OpenIMISIdentifierCS#UUID
  * ^short = "Location openIMIS UUID"
  * ^definition = "Location UUID generated by openIMIS."
* identifier[LocationID].type.coding.code = OpenIMISIdentifierCS#DBID
  * ^short = "Location openIMIS Database ID"
  * ^definition = "Location Database ID generated by openIMIS."

* status 0..1 
  * ^short = "Active Status"
  * ^definition = "The location is always active."
* status = LocationStatusCS#active "Active"

* operationalStatus 0..0

* name 1..1 MS // The name by which the Location is known
  * ^short = "Location official name"
  * ^definition = "Location official family and given names."

* alias 0..0
* description 0..0
* mode = LocationModeCS#instance "Instance"
* type 0..0
* telecom 0..0 
* address 0..0 

* physicalType 1..1 MS 
  * ^short = "Location type"
  * ^definition = "Location type specifying the level of location."
* physicalType from LocationTypeVS (required)

* position 0..0
* managingOrganization 0..0

* partOf 0..1 MS
* partOf only Reference(OpenIMISLocation)

* hoursOfOperation 0..0
* availabilityExceptions 0..0
* endpoint 0..0