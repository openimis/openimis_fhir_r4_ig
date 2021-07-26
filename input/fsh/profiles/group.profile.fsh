// This is the profile for openIMIS Group 
// Mapping is done throught Insuree and Family openIMIS entities
Profile: OpenIMISGroup
Parent: Group
Id: openimis-group
Title: "openIMIS Group"
Description: "Defines a Group for openIMIS which maps to an Family"

* id
  * ^short = "Group UUID"
  * ^definition = "Group/Family UUID generated by openIMIS."

* identifier 0..* MS 
* identifier.type 1..1  
* identifier.type.coding.code from OpenIMISIdentifierVS (required)
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.rules = #closed
* identifier contains
    UUID 0..1 and
    DBID 0..1
* identifier[UUID].type.coding.code = OpenIMISIdentifierCS#UUID
  * ^short = "Group openIMIS UUID"
  * ^definition = "Group/Family UUID generated by openIMIS."
* identifier[DBID].type.coding.code = OpenIMISIdentifierCS#DBID
  * ^short = "Group openIMIS Database ID"
  * ^definition = "Group/Family Database ID generated by openIMIS."

* active 0..1 
  * ^short = "Active Policy"
  * ^definition = "Mentions if the Group/Family has an Active Policy."

* type = GroupTypeCS#person // always person
* actual = true // always true
* code 0..0 // not used

* name 0..1 // The name by which the Group/Family is known. Only for GET Group
  * ^short = "Group/Family official name"
  * ^definition = "Group/Family name based on Patient/Insuree official family and given names."

* quantity 1..1
* managingEntity 0..0
* characteristic 0..0

* member 1..*
  * entity only Reference(OpenIMISPatient)
  * period 0..0
  * inactive 0..0

* extension contains GroupAddressExtension named address 1..1 MS // Family address => state->district->extension[municipality]->city
* extension[address]
  * ^short = "Group Address"
  * ^definition = "Specifies the Group's address. Must contain at least the Location reference."

* extension contains GroupPovertyStatusExtension named poverty 0..1 
* extension[poverty]
  * ^short = "Group Poverty Status"
  * ^definition = "Specifies the Group's poverty status."

* extension contains GroupTypeExtension named groupType 0..1 
* extension[groupType]
  * ^short = "Group Type"
  * ^definition = "Specifies the Group's type."

// ToDo: Check if ethnicity is still used

* extension contains GroupConfirmationExtension named confirmation 0..1 
* extension[confirmation]
  * ^short = "Group Confirmation"
  * ^definition = "Specifies the Group's confirmation number and type."

