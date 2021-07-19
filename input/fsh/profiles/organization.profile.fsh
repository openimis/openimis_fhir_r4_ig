// This is the profile for openIMIS Organization 
// Mapping is done throught Health Facility openIMIS entity
Profile: OpenIMISHealthFacilityOrganization
Parent: Organization
Id: openimis-health-facility-organization
Title: "openIMIS Health Facility Organization"
Description: "Defines an Organization for openIMIS which maps to a Health Facility"

* id
  * ^short = "Organization UUID"
  * ^definition = "Organization UUID generated by openIMIS."

* identifier 1..* MS // Must contain at least the HF Code
* identifier.type 1..1  
* identifier.type.coding.code from OpenIMISIdentifierVS (required)
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.rules = #closed
* identifier contains
    HFCode 0..1 MS and
    HFUUID 0..1 and
    HFID 0..1
* identifier[HFCode].type.coding.code = OpenIMISIdentifierCS#Code // it is mapped to HFCode
  * ^short = "Organization openIMIS Code"
  * ^definition = "Health Facility Code managed by openIMIS."
* identifier[HFUUID].type.coding.code = OpenIMISIdentifierCS#UUID
  * ^short = "Organization openIMIS UUID"
  * ^definition = "Health Facility UUID generated by openIMIS."
* identifier[HFID].type.coding.code = OpenIMISIdentifierCS#DBID
  * ^short = "Organization openIMIS Database ID"
  * ^definition = "Health Facility Database ID generated by openIMIS."

* active 0..0 // not used
* type 1..1
* type.coding.code = OrganizationTypeCS#prov
* name 1..1 
* alias 0..0 // not used

* telecom 0..3
  * value 1..1 
* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #closed
* telecom contains
    email 0..1 and
    phone 0..1 and 
    fax 0..1 
* telecom[email].system = ContactPointSystemCS#email // it is mapped to CHFID
  * ^short = "Health Facility email"
  * ^definition = "Health Facility email contact."
* telecom[phone].system = ContactPointSystemCS#phone
  * ^short = "Health Facility phone"
  * ^definition = "Health Facility phone contact."
* telecom[fax].system = ContactPointSystemCS#fax
  * ^short = "Health Facility fax"
  * ^definition = "Health Facility fax contact."

* address 1..1 MS // Family address or Current address of the Insuree => state->district->extension[municipality]->city
  * type = AddressType#physical
  * country 0..0 // Not used 
  // Location.LocationName from Family's Region (Family.LocationId.ParentLocationId.ParentLocationId.ParentLocationId)
  // Location.LocationName from Insuree's Region (Insuree.CurrentVillage.ParentLocationId.ParentLocationId.ParentLocationId)
  * state 1..1 MS // mapped to Region (see previous two comments) !!!
    * ^short = "State/Region"
    * ^definition = "Insuree's State/Region name as it is configured in openIMIS."
  // Location.LocationName from Family's District (Family.LocationId.ParentLocationId.ParentLocationId)
  // Location.LocationName from Insuree's District (Insuree.CurrentVillage.ParentLocationId.ParentLocationId)
  * district 1..1 MS // mapped to District (see previous two comments) !!!
    * ^short = "District"
    * ^definition = "Insuree's District name as it is configured in openIMIS."
  * city 0..0 // not used
  * postalCode 0..0 // not used
  * line 0..1 // HFAddress
  * extension contains AddressLocationReference named locationDistrict 1..1 MS 

* partOf 0..0 // not used

* contact 0..*
  * purpose 1..1
  * purpose = ContactEntityTypeCS#PAYOR
  * name 1..1
  * telecom 0..*
  * address 0..1
  * ^short = "Claim Administrator contact"
  * ^definition = "Claim Administrator contact details. Contains the list of all CA attached to the Health Facility. Only available in GET Organization."


Instance: RaptaDistrictHospital
InstanceOf: OpenIMISHealthFacilityOrganization
Description: "Example of openIMIS Health Facility"
* identifier[HFCode].value = "RAHOS001"
* identifier[HFCode].type = OpenIMISIdentifierCS#Code
* identifier[HFUUID].value = "D8A25F21-F36A-4D4D-9E58-1DB8FFBE7036"
* identifier[HFUUID].type = OpenIMISIdentifierCS#UUID
* type = OrganizationTypeCS#prov
* name = "Rapta District Hospital"
* address[0]
  * type = AddressType#physical
  * state = "Ultha"
  * district = "Rapta"
  * extension[locationDistrict].valueReference = Reference(Rapta-district)
