// This is the profile for openIMIS Claim 
// Mapping is done throught Claim openIMIS entities
Profile: OpenIMISClaim
Parent: Claim
Id: openimis-claim
Title: "openIMIS Claim"
Description: "Defines a Claim for openIMIS which maps to a Claim"

* id
  * ^short = "Claim UUID"
  * ^definition = "Claim UUID generated by openIMIS."

* identifier 1..* MS // Must contain at least the Claim Code
  * type 1..1  
  * value 1..1
* identifier.type.coding.code from OpenIMISIdentifierVS (required)
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.rules = #closed
* identifier contains
    Code 1..1 MS and
    UUID 0..1 
* identifier[Code].type.coding.code = OpenIMISIdentifierCS#Code // it is mapped to CHFID
  * ^short = "Claim openIMIS Code"
  * ^definition = "Claim Code managed by openIMIS."
* identifier[UUID].type.coding.code = OpenIMISIdentifierCS#UUID
  * ^short = "Claim openIMIS UUID"
  * ^definition = "Claim UUID generated by openIMIS."

* diagnosis
  * diagnosis[x] only CodeableConcept
  * diagnosisCodeableConcept.coding from DiagnosisICD10Level1VS (example)