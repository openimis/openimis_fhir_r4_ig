// This is the profile for openIMIS Medication 
// Mapping is done throught Medical Item openIMIS entity
Profile: OpenIMISMedication
Parent: Medication
Id: openimis-medication
Title: "openIMIS Medication"
Description: "Defines a Medication for openIMIS which maps to a Medical Item."

* id
  * ^short = "Medication UUID"
  * ^definition = "Medication UUID generated by openIMIS."

* identifier 1..* MS // Must contain at least the Medication Code
* identifier.type 1..1  
* identifier.type.coding.code from OpenIMISIdentifierVS (required)
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.rules = #closed
* identifier contains
    Code 1..1 MS and
    UUID 0..1 and
    DBID 0..1
* identifier[Code].type.coding.code = OpenIMISIdentifierCS#Code // it is mapped to CHFID
  * ^short = "Medication openIMIS Code"
  * ^definition = "Medication Code managed by openIMIS."
* identifier[UUID].type.coding.code = OpenIMISIdentifierCS#UUID
  * ^short = "Medication openIMIS UUID"
  * ^definition = "Medication UUID generated by openIMIS."
* identifier[DBID].type.coding.code = OpenIMISIdentifierCS#DBID
  * ^short = "Medication openIMIS Database ID"
  * ^definition = "Medication Database ID generated by openIMIS."

* code 1..1 //from SNOMEDCTMedicationCodes (example)
  * text 1..1 
    * ^short = "Medication name"
    * ^definition = "Medication name."

* status 0..1 
  * ^short = "Active Status"
  * ^definition = "The Medication is always active."
* status = MedicationStatusCS#active "Active"

* manufacturer 0..0
* form 0..1 //from SNOMEDCTFormCodes (example) 
  * ^short = "Medication Form"
  * ^definition = "The Medication form configured in openIMIS."

* amount 0..1
  * numerator 1..1 
    * value 1..1 
  * denominator 0..0

* ingredient 0..0
* batch 0..0

* extension contains MedicationUsageContextExtension named useContext 0..4
* extension[useContext]
  * ^short = "Usage Context"
  * ^definition = "Specifies the Medical Item use context."

* extension contains UnitPriceExtension named unitPrice 1..1 
* extension[unitPrice]
  * ^short = "Unit Price"
  * ^definition = "Specifies the Medical Item unit price."

* extension contains MedicationFrequencyExtension named timing 0..1 
* extension[timing]
  * ^short = "Frequency"
  * ^definition = "The frequency a Medical Item can be prescribed."

* extension contains MedicationTypeExtension named type 1..1 
* extension[type]
  * ^short = "Medication Type"
  * ^definition = "The type of the Medical Item."
