// This is the profile for openIMIS Contract 
// Only for POST 
Profile: OpenIMISContract
Parent: Contract
Id: openimis-contract
Title: "openIMIS Contract"
Description: """
            * Defines a Contract for openIMIS use to enrol a Family/Group. Mapped mostly to Policy and will link Group/Family and Patient/Insurees. 
            * 
            * Available endpoint is accepting only **POST**. 
            """

// ToDo: define if this is needed 
* id
  * ^short = "Contract UUID"
  * ^definition = "Policy UUID generated by openIMIS."

// ToDo: define if this is needed 
* identifier 0..* 
* identifier.type 1..1  
* identifier.type.coding.code from OpenIMISIdentifierVS (required)
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.rules = #closed
* identifier contains
    UUID 0..1 
* identifier[UUID].type.coding.code = OpenIMISIdentifierCS#UUID
  * ^short = "Organization openIMIS UUID"
  * ^definition = "Health Facility UUID generated by openIMIS."

* url 0..0
* version 0..0
* status from ContractStatusCodesVS (required)
  * ^short = "Contract Status"
  * ^definition = """Status for a Contract. Can be either offered (idle) or executed (active). Mapped to `Policy.PolicyStatus`."""

* legalState 0..0
* instantiatesCanonical 0..0
* instantiatesUri 0..0
* contentDerivative 0..0

* issued 1..1
  * ^short = "Enrolment/Renewal date"
  * ^definition = """Date when the enrolment/renewal took place. Mapped to `Policy.EnrollDate`."""

* applies 0..0
* expirationType 0..0

* subject 1..1
* subject only Reference(OpenIMISGroup)
  * ^short = "Insured Group"
  * ^definition = """Reference to the Group/Family that is enroled. Mapped to `Policy.FamilyID`."""

* authority 0..0
* domain 0..0
* site 0..0
* name 0..0 // can be used to display the name of the head of the family
* title 0..0
* subtitle 0..0
* alias 0..0

* author 0..1
* author only Reference(OpenIMISEnrolmentOfficerPractitioner)
  * ^short = "Enrolment Officer"
  * ^definition = """Reference to the Enrolment Officer. Mapped to `Policy.OfficerID`."""

* scope 1..1 
* scope from ContractScopeVS (required)
  * ^short = "Scope"
  * ^definition = "Indicates if the contract is for the Formal or Informal Sector."

* topic[x] 0..0
* type 0..0
* subType 0..0
* contentDefinition 0..0

* term 1..*
  * ^short = "Insuree Policies"
  * ^definition = """List of policies the Beneficiary Insuree is enroling to."""

  * identifier 0..0
  * issued 0..0 
  * applies 0..0
  * topic[x] 0..0
  * type 0..0
  * subType 0..0
  * text 0..0
  * securityLabel 0..0

  * offer 1..1 // this is mandatory in FHIR Contract
    * identifier 0..0
    * party 1..1
      * reference 1..1
      * reference only Reference(OpenIMISPatient)
        * ^short = "Insuree Term"
        * ^definition = """Reference to the Insuree (Head of the Family) that will be covered by the Policies."""
      * role = ContractResourcePartyRoleCS#beneficiary "Beneficiary"
    * topic 0..0
    * type 0..0
    * decision 0..0
    * decisionMode 0..0
    * answer 0..0
    * text 0..0
    * linkId 0..0
    * securityLabelNumber 0..0

  * asset 1..* 
    * ^short = "Policy"
    * ^definition = """Policy that the Beneficiary Insuree and dependent is enroling to."""

    * scope 0..0
    * type 0..0

    * typeReference 1..*
    * typeReference only Reference(OpenIMISPatient)
      * ^short = "Insurees covered by a Policy"
      * ^definition = """Reference to the Insurees that will be covered by the Policy. Mapped through `tblInsureePolicy` table."""
    
    * subtype 0..0
    * relationship 0..0
    * context 0..0
    * condition 0..0
    * periodType 0..0 
    * period 1..1 // already defined by term.issued
      * start 1..1
        * ^short = "Start date"
        * ^definition = """Date when the enrolment/renewal starts. Mapped to `Policy.StartDate`."""
      * end 1..1
        * ^short = "End date"
        * ^definition = """Date when the enrolment/renewal will actual end. Mapped to `Policy.ExpiryDate`."""
    * usePeriod 1..1 // already defined by term.applies
      * start 1..1
        * ^short = "Effective date"
        * ^definition = """Date when the enrolment/renewal will actual start. Mapped to `Policy.EffectiveDate`."""
      * end 1..1
        * ^short = "End date"
        * ^definition = """Date when the enrolment/renewal will actual end. Mapped to `Policy.ExpiryDate`."""
    * text 0..0
    * linkId 0..0
    * answer 0..0
    * securityLabelNumber 0..0
    * valuedItem 1..*
      * entity[x] 1..1
      * entity[x] only Reference(OpenIMISInsurancePlan)
        * ^short = "InsurancePlan Reference"
        * ^definition = """Reference to the Insurance Plan the policy is related to. Mapped to `Policy.ProdID`."""
  
      * identifier 0..0
      * effectiveTime 0..0
      * quantity 0..0
      * unitPrice 0..0
      * factor 0..0
      * points 0..0
      * net 1..1
        * value 1..1
          * ^short = "Policy Value"
          * ^definition = """Cost of the policy. Mapped through `Policy.PolicyValue`."""
      * payment 0..0
//        * ^short = "Payment receipt"
//        * ^definition = """Receipt number for the payment. Mapped through `Premium.Receipt`."""
      * paymentDate 0..0
      * responsible 0..0
      * recipient 0..0
      * linkId 0..0
      * securityLabelNumber 0..0
    * extension contains ContractPremiumExtension named premium 0..* MS 
    * extension[premium]
      * ^short = "Contract Premiums"
      * ^definition = "Specifies the premiums for the contract."


  * action 0..0
  * group  0..0

* supportingInfo 0..0
* relevantHistory 0..0

* signer 0..0 // we might need this for the Formal Sector 

* friendly 0..0
* legal 0..0
* rule 0..0
* legallyBinding[x] 0..0

// ToDo: Add extension for premium 
