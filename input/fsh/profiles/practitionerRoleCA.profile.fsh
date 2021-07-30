// This is the profile for openIMIS Practitioner 
// Mapping is done throught Claim Administrator openIMIS entities
Profile: OpenIMISClaimAdministratorPractitionerRole
Parent: PractitionerRole
Id: openimis-claim-administrator-practitioner-role
Title: "openIMIS Claim Administrator Practitioner Role"
Description: "Defines a Claim Administrator Practitioner Role for openIMIS."

* id
  * ^short = "Practitioner UUID"
  * ^definition = "Claim Administrator UUID generated by openIMIS."

* identifier 1..* MS // Must contain at least the Claim Administrator/Enrolment Officer Code
* identifier.type 1..1  
* identifier.type.coding.code from OpenIMISIdentifierVS (required)
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.rules = #closed
* identifier contains
    Code 1..1 MS and
    UUID 0..1 
* identifier[Code].type.coding.code = OpenIMISIdentifierCS#Code // it is mapped to CHFID
  * ^short = "openIMIS Code"
  * ^definition = "Claim Administrator Code managed by openIMIS."
* identifier[UUID].type.coding.code = OpenIMISIdentifierCS#UUID
  * ^short = "openIMIS UUID"
  * ^definition = "Claim Administrator UUID generated by openIMIS."

* active 0..0 
* period 0..0

* practitioner 1..1
* practitioner only Reference(OpenIMISClaimAdministratorPractitioner)
* organization 1..1
* organization only Reference(OpenIMISHealthFacilityOrganization)
* code = PractitionerQualificationTypeCS#CA "Claim Administrator"

* specialty 0..0
* location 0..0
* healthcareService 0..0

* telecom 0..2 
  * value 1..1 
* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #closed
* telecom contains
    email 0..1 and
    phone 0..1
* telecom[email]
  * system = FHIRContactPointSystemCS#email 
  * ^short = "Claim Administrator email"
  * ^definition = "Claim Administrator email contact."
* telecom[phone]
  * system = FHIRContactPointSystemCS#phone
  * ^short = "Claim Administrator phone"
  * ^definition = "Claim Administrator phone contact."

* availableTime 0..0
* notAvailable 0..0
* availabilityExceptions 0..0
* endpoint 0..0