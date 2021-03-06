// This is the profile for openIMIS Organization 
// Mapping is done throught Health Facility openIMIS entity
Profile: OpenIMISInsurancePlan
Parent: InsurancePlan
Id: openimis-insurance-plan
Title: "openIMIS Insurance Plan"
Description: "Defines an Insurance Plan for openIMIS which maps to a Product."

* id
  * ^short = "Organization UUID"
  * ^definition = "Organization UUID generated by openIMIS."

* identifier 1..* MS // Must contain at least the HF Code
  * type 1..1  
  * value 1..1
* identifier.type.coding.code from OpenIMISIdentifierVS (required)
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.rules = #closed
* identifier contains
    Code 1..1 MS and
    UUID 0..1 
* identifier[Code].type.coding.code = OpenIMISIdentifierCS#Code // it is mapped to Code
  * ^short = "Insurance Plan openIMIS Code"
  * ^definition = "Product Code managed by openIMIS."
* identifier[UUID].type.coding.code = OpenIMISIdentifierCS#UUID
  * ^short = "InsurancePlan openIMIS UUID"
  * ^definition = "Product UUID generated by openIMIS."

* status 1..1
* status from InsurancePlanPublicationStatusVS (required)

* type 1..1 
* type from InsurancePlanCoverageTypeVS (required)
  * ^short = "Type of Insurance Plan"
  * ^definition = """Defines the type of Insurance Plan. 
  Currently only medical is managed. Can have other values in the future."""

* name 1..1 
* alias 0..0 

* period 1..1
  * start 1..1 
    * ^short = "Insurance Plan start date"
    * ^definition = "Date from which the Product is valid."
  * end 1..1
    * ^short = "Insurance Plan end date"
    * ^definition = "Date to which the Product is valid."

* ownedBy 0..0
* administeredBy 0..0

* coverageArea 1..1 
* coverageArea only Reference(OpenIMISLocation)

* contact 0..0
* endpoint 0..0
* network 0..0

* coverage 1..1
  * type from InsurancePlanCoverageTypeVS (required)
  * network 0..0
  * benefit 1..1
    * type from InsurancePlanCoverageTypeVS (required)
    * requirement 0..0
    * limit 1..2
      * code 1..1 
      * code from InsurancePlanCoverageBenefitLimitVS (required)
    * limit ^slicing.discriminator.type = #value
    * limit ^slicing.discriminator.path = "code.coding.code"
    * limit ^slicing.rules = #closed
    * limit contains
        period 1..1 and
        memberCount 0..1 
    * limit[period]
      * value 1..1 
        * ^short = "Insurance Period (months)"
        * ^definition = """Number of months the Insuree is covered. Mapped to `insurancePeriod`"""
      * code = InsurancePlanCoverageBenefitLimitCS#period "Period"
    * limit[memberCount]
      * value 1..1 
        * ^short = "Member Count"
        * ^definition = """Maximal number of members of a household/group for the product. Mapped to `memberCount`"""
      * code = InsurancePlanCoverageBenefitLimitCS#memberCount "Member Count"
      

* plan 1..1
  * identifier 0..0
  * type 0..0
  * coverageArea 0..0
  * network 0..0
  * generalCost 1..1
    * type 1..1 
    * type from InsurancePlanGeneralCostTypeVS (required)
    * cost 1..1
    * comment 0..0
  * generalCost ^slicing.discriminator.type = #value
  * generalCost ^slicing.discriminator.path = "type.coding.code"
  * generalCost ^slicing.rules = #closed
  * generalCost contains
      lumpsum 1..1 and
      premiumAdult 0..1 and
      premiumChild 0..1 and 
      registrationLumpsum 0..1 and 
      registrationFee 0..1 and
      generalAssemblyLumpSum 0..1 and
      generalAssemblyFee 0..1
  * generalCost[lumpsum]
    * type = InsurancePlanGeneralCostTypeCS#lumpsum "Lumpsum"
    * groupSize 1..1
      * ^short = "Threshold Member"
      * ^definition = "Number of members in group that are covered."
  * generalCost[premiumAdult]
    * type = InsurancePlanGeneralCostTypeCS#premiumAdult "Premium Adult"
    * groupSize 0..0
  * generalCost[premiumChild]
    * type = InsurancePlanGeneralCostTypeCS#premiumChild "Premium Child"
    * groupSize 0..0
  * generalCost[registrationLumpsum]
    * type = InsurancePlanGeneralCostTypeCS#registrationLumpsum "Registration Lumpsum"
    * groupSize 0..0
  * generalCost[registrationFee]
    * type = InsurancePlanGeneralCostTypeCS#registrationFee "Registration Fee"
    * groupSize 0..0
  * generalCost[generalAssemblyLumpSum]
    * type = InsurancePlanGeneralCostTypeCS#generalAssemblyLumpSum "General Assembly Lump Sum"
    * groupSize 0..0
  * generalCost[generalAssemblyFee]
    * type = InsurancePlanGeneralCostTypeCS#generalAssemblyFee "General Assembly Fee"
    * groupSize 0..0

  * specificCost 0..0

* extension contains InsurancePlanConversionExtension named conversion 0..1
* extension[conversion]
  * ^short = "Conversion Product"
  * ^definition = "Reference to the product which replaces the current product in case of renewal after the period end."

* extension contains InsurancePlanMaxInstallmentsExtension named maxInstallments 1..1
* extension[maxInstallments]
  * ^short = "Max Installments"
  * ^definition = "Maximal number of instalments in which contributions for a policy may be paid."


* extension contains InsurancePlanStartCycleExtension named startCycle 0..4 
* extension[startCycle]
  * ^short = "Start Cycle"
  * ^definition = "If one or more starting dates (a day and a month) of a cycle are specified then the insurance product is considered as the insurance product with fixed enrolment dates. In this case, activation of underwritten and renewed policies is accomplished always on fixed dates during a year. Maximum four cycle dates can be specified."

* extension contains InsurancePlanPeriodExtension named administrationPeriod 0..1
* extension[administrationPeriod]
  * ^short = "Administration Period"
  * ^definition = """Duration of the administration period in months. The administration period is added to the enrolment date/renewal date for determination of the policy start date. Mapped to `administrationPeriod`"""

* extension contains InsurancePlanPeriodExtension named gracePeriodPayment 0..1
* extension[gracePeriodPayment]
  * ^short = "Grace Period Payment"
  * ^definition = """Duration of the period in months, in which a policy has a grace period (not fully paid up) before it is suspended. Mandatory, although it is by default and can be left at zero. Mapped to `waitingPeriod`"""

* extension contains InsurancePlanPeriodExtension named gracePeriodRenewal 0..1
* extension[gracePeriodRenewal]
  * ^short = "Grace Period Renewal"
  * ^definition = """Duration of the period in months after the starting date of a cycle (including this starting date), in which renewing of a policy will still be associated with this cycle. Mapped to `gracePeriodRenewal`"""

* extension contains InsurancePlanPeriodExtension named gracePeriodEnrolment 0..1
* extension[gracePeriodEnrolment]
  * ^short = "Start Cycle"
  * ^definition = """Duration of the period in months after the starting date of a cycle (including this starting date), in which underwriting of a policy will still be associated with this cycle. Mapped to `gracePeriod`"""

* extension contains InsurancePlanDiscountExtension named renewalDiscount 0..1
* extension[renewalDiscount]
  * ^short = "Renewal Discount"
  * ^definition = """Discount to apply for renewals"""

* extension contains InsurancePlanDiscountExtension named enrolmentDiscount 0..1
* extension[enrolmentDiscount]
  * ^short = "Enrolment Discount"
  * ^definition = """Discount to apply for enrolment"""

/*{
      / "prodId": 2, 
      / "productCode": "RX01",
      / "productName": "Regional fixed enrolment",
      / "locationId": 6,
      / "insurancePeriod": 12, // coverage.benefit.limit
      / "dateFrom": "2016-01-01",
      / "dateTo": "2025-12-01",
      "conversionProdId": 14,

      / "lumpsum": 5000.00, // InsurancePlanGeneralCostTypeCS#lumpsum "Lumpsum"
      / "memberCount": 10,
      // "threshold": 0, integer
     
      / "premiumAdult": 1000.00,
      / "premiumChild": 500.00,
      / "registrationLumpsum": 4000.00,
      / "registrationFee": null,
      / "generalAssemblyLumpSum": 6000.00,
      / "generalAssemblyFee": null,
     
      / "startCycle1": "01-01",
      / "startCycle2": "01-05",
      / "startCycle3": "01-08",
      / "startCycle4": "01-10",


      "maxInstallments": 3, Max Installments (integer)
      
      / "renewalDiscountPerc": 50, Renewal Disc. % (float)
      / "renewalDiscountPeriod": 2, Renewal Disc. Period (months)
      
      / "enrolmentDiscountPerc": 80, Enrolment Disc. % (float)
      / "enrolmentDiscountPeriod": 2, Enrolment Disc. Period (months)

      / "administrationPeriod": 1, Administration Period (months)
      / "waitingPeriod": 1, Grace Period Payment (months)
      / "gracePeriodRenewal": 1, Grace Period Renewal (months)
      / "gracePeriod": 1, Grace Period Enrolment (months)

    }*/