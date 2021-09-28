// This is the profile for openIMIS Coverage
// Mapping is done throught Policy openIMIS entity
Profile: OpenIMISCoverage
Parent: Coverage
Id: openimis-coverage
Title: "openIMIS Coverage"
Description: "Defines a Coverage for openIMIS which maps to a Policy."

* id
  * ^short = "Coverage UUID"
  * ^definition = "Coverage UUID generated by openIMIS."

* identifier 1..1 MS // Must contain at least the Claim Code
  * type 1..1  
  * value 1..1
* identifier.type.coding.code from OpenIMISIdentifierVS (required)
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.rules = #closed
* identifier contains
    UUID 1..1 
* identifier[UUID].type.coding.code = OpenIMISIdentifierCS#UUID
  * ^short = "Coverage openIMIS UUID"
  * ^definition = "Coverage UUID generated by openIMIS."

* status from CoverageStatusVS (required)
  * ^short = "Coverage Status"
  * ^definition = """Coverage Status:
  * active: policy active or expired
  * cancelled: policy suspended
  * draft: policy idle"""

* type 0..0 // could be used later if different kinds of benefit packages are covered by openIMIS

* policyHolder only Reference(OpenIMISPatient)
* subscriber 0..0 
* subscriberId 0..0

// there is an 
* beneficiary only Reference(OpenIMISPatient)
* dependent 0..0
* relationship 0..0
* period 1..1 
  * start 1..1
    * ^short = "Start date"
    * ^definition = """Date when the enrolment/renewal starts. Mapped to `Policy.StartDate`."""
  * end 1..1
    * ^short = "Expiry date"
    * ^definition = """Date when the enrolment/renewal will actual end. Mapped to `Policy.ExpiryDate`."""

* payor 1..1
* payor only Reference(OpenIMISPatient or OpenIMISPolicyHolderOrganization)

* class 1..1
  * type = FHIRCoverageClassCodes#plan "Plan"
  * value 1..1
    * ^short = "Product Code"
    * ^definition = """Code of the Product/InsurancePlan."""
  * name 1..1
    * ^short = "Product Name"
    * ^definition = """Name of the Product/InsurancePlan."""
    
* order 0..0
* network 0..0
* costToBeneficiary 0..0
* subrogation 0..0
* contract 0..0

* extension contains CoverageDateExtension named enrollDate 1..1 
* extension[enrollDate]
  * ^short = "Enrollment Date"
  * ^definition = "Specifies the date of the enrollment."

* extension contains CoverageDateExtension named effectiveDate 1..1 
* extension[effectiveDate]
  * ^short = "Effective Date"
  * ^definition = "Specifies the effective date from which the policy is valid."
