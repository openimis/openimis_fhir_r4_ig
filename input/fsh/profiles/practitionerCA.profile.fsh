// This is the profile for openIMIS Practitioner 
// Mapping is done throught Claim Administrator and Enrolment Officer openIMIS entities
Profile: OpenIMISClaimAdministratorPractitioner
Parent: Practitioner
Id: openimis-claim-administrator-practitioner
Title: "openIMIS Claim Administrator Practitioner"
Description: "Defines a Practitioner for openIMIS which maps to a Claim Administrator."

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

* name 1..1 // The names by which the Claim Administrator is known
  * ^short = "Claim Administrator official name"
  * ^definition = "Claim Administrator official family and given names."
  * family 1..1 MS
  * given 1..1 MS
  * use = FHIRNameUseCS#official

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

* address 0..0 
* gender 0..0 

* birthDate 1..1 MS // The date on which the person was born
* photo 0..0 // Is not available in openIMIS
* qualification 1..1
  * code = PractitionerQualificationTypeCS#CA "Claim Administrator"
* communication	0..0
