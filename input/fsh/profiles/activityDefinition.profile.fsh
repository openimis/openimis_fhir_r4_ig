// This is the profile for openIMIS ActivityDefinition 
// Mapping is done throught Medical Service openIMIS entity
Profile: OpenIMISActivityDefinition
Parent: ActivityDefinition
Id: openimis-activitiy-definition
Title: "openIMIS ActivityDefinition"
Description: "Defines a ActivityDefinition for openIMIS which maps to a Medical Service."

* id
  * ^short = "ActivityDefinition UUID"
  * ^definition = "ActivityDefinition UUID generated by openIMIS."

* identifier 1..* MS // Must contain at least the ActivityDefinition Code
* identifier.type 1..1  
* identifier.type.coding.code from OpenIMISIdentifierVS (required)
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.rules = #closed
* identifier contains
    Code 1..1 MS and
    UUID 0..1 
* identifier[Code].type.coding.code = OpenIMISIdentifierCS#Code // it is mapped to CHFID
  * ^short = "ActivityDefinition openIMIS Code"
  * ^definition = "ActivityDefinition Code managed by openIMIS."
* identifier[UUID].type.coding.code = OpenIMISIdentifierCS#UUID
  * ^short = "ActivityDefinition openIMIS UUID"
  * ^definition = "ActivityDefinition UUID generated by openIMIS."

* version 0..0
* name 1..1
  * ^short = "Code of the Medical Service (computer friendly)"
  * ^definition = "Medical Service code."
* title 1..1
  * ^short = "Name of the Medical Service (human friendly)"
  * ^definition = "Medical Service name."

* subtitle 0..0
* status = FHIRPublicationStatusCS#active "Active"
* experimental 0..0
* subject[x] 0..0
* date 1..1
* publisher 0..0
* contact 0..0
* description 0..0

// Note: the definition of valueCodeableConcept doesn't prohibit to use same code twice.
// To improve we might define slicing based on coding value. 
* useContext 0..4
* useContext.code from  ActivityDefinitionUsageContextTypeVS (required)
* useContext ^slicing.discriminator.type = #value
* useContext ^slicing.discriminator.path = "code"
* useContext ^slicing.rules = #closed
* useContext contains
    Gender 0..1 and
    Age 0..1 and
    Category 0..1 and
    CareType 1..1
* useContext[Gender]
  * code = UsageContextTypeCS#gender "Gender"
  * value[x] only CodeableConcept
  * valueCodeableConcept
    * coding 1..2 
    * coding from UsageContextGenderTypeVS (required)
  * ^short = "Usage Context per Gender"
  * ^definition = "Usage Context per Gender male and female."
* useContext[Age]
  * code = UsageContextTypeCS#age "Age"
  * value[x] only CodeableConcept
  * valueCodeableConcept
    * coding 1..2 
    * coding from UsageContextAgeTypeVS (required)
  * ^short = "Usage Context per Age"
  * ^definition = "Usage Context per Age adult and child."
* useContext[Category]
  * code = UsageContextTypeCS#workflow "Workflow Setting"
  * value[x] only CodeableConcept
  * valueCodeableConcept
    * coding 1..1 
    * coding from ActivityDefinitionUsageContextWorkflowTypeVS (required)
  * ^short = "Usage Context per Workflow"
  * ^definition = "Usage Context per Worflow."
* useContext[CareType] 
  * code = UsageContextTypeCS#venue "Clinical Venue"
  * value[x] only CodeableConcept
  * valueCodeableConcept
    * coding 1..2 
    * coding from ActivityDefinitionUsageContextVenueTypeVS (required)
  * ^short = "Usage Context per Care Type"
  * ^definition = """Usage Context per Care Type. openIMIS `both` value will have both `AMB` and `IMP` codes listed."""

* jurisdiction 0..0
* purpose 0..0
* usage 0..0
* copyright 0..0
* approvalDate 0..0
* lastReviewDate 0..0
* effectivePeriod 0..0

* topic from ActivityDefinitionServiceTypeVS (required)

* author 0..0
* editor 0..0
* reviewer 0..0
* endorser 0..0
* relatedArtifact 0..0
* library 0..0

* kind 0..1
* kind = FHIRRequestResourceTypeCS#ServiceRequest "ServiceRequest"

* profile 0..0
* code 0..0 
* intent 0..0
* priority 0..0
* doNotPerform 0..0

* timing[x] 0..1
* timing[x] only Timing
* timingTiming
  * repeat
    * frequency 1..1
    * frequency = 1
    * period 1..1 
      * ^short = "Frequency (days)"
      * ^definition = """The minimum number of days the service can be administered again."""
    * periodUnit 1..1
    * periodUnit = UnitsOfTimeCS#d "day"

* location 0..0
* participant 0..0
* product[x] 0..0 
* quantity 0..0
* dosage 0..0
* bodySite 0..0
* specimenRequirement 0..0
* observationRequirement 0..0
* observationResultRequirement	0..0
* transform 0..0
* dynamicValue 0..0

* extension contains UnitPriceExtension named unitPrice 1..1 
* extension[unitPrice]
  * ^short = "Unit Price"
  * ^definition = "Specifies the Medical Service unit price."
