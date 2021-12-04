// This is the profile for openIMIS Invoice 
// Mapping is done throught Invoice openIMIS entities
Profile: OpenIMISInvoice 
Parent: Invoice
Id: openimis-invoice-invoice
Title: "openIMIS Invoice"
Description: "Defines an Invoice for openIMIS."

* id
  * ^short = "Invoice UUID"
  * ^definition = "Invoice UUID generated by openIMIS."

* identifier 2..2 
  * type 1..1  
  * value 1..1
* identifier.type.coding.code from OpenIMISIdentifierVS (required)
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.rules = #closed
* identifier contains
    Code 1..1 MS and
    UUID 1..1 
* identifier[Code].type.coding.code = OpenIMISIdentifierCS#Code 
  * ^short = "Invoice openIMIS Code"
  * ^definition = "Invoice Code managed by openIMIS."
* identifier[UUID].type.coding.code = OpenIMISIdentifierCS#UUID
  * ^short = "Invoice openIMIS UUID"
  * ^definition = "Invoice UUID generated by openIMIS."

* status = FHIRFinancialResourceStatusCodes#active "Active"
  * ^short = "FHIR Claim Status"
  * ^definition = "Claim status reported to FHIR Claim required Statuses."

* cancelledReason 0..0
* type 1..1
  * coding from InvoiceTypeVS (required)
  * ^short = "contribution | contract | funding"
  * ^definition = "Invoice type as defined by openIMIS."
  
* subject 0..0
* recipient 1..1
* recipient only Reference(Organization or Patient)
  * ^short = "Third party"
  * ^definition = "Reference to the third party."

* date 1..1

* participant 0..0
* issuer 0..0 // openIMIS is issuing this invoice
* account 0..0 // refecence to an Account

* lineItem 1..*
  * sequence 0..0
  * chargeItem[x] only CodeableConcept
  * chargeItemCodeableConcept from InvoiceChargeItemVS (required)
  * priceComponent 1..*
    * type from InvoicePriceComponentTypeVS
      * ^short = "base | deduction | discount | tax"
    * code 0..1
      * ^definition = "Code only for the base"
      * coding.code = OpenIMISIdentifierCS#Code 
    * factor 1..1
      * ^definition = """
      * quantity only for the base
      * rate for tax 
      * discount for discount
      * 1 for deduction
      """
    * amount 1..1
      * ^definition = """
      * unit_price*quantity only for the base
      * (unit_price*quantity*(1-discount)-deduction)*rate for tax
      * -1*unit_price*quantity*discount for discount
      * -1*deduction for deduction"""
      * value 1..1
      * currency 0..1

    * extension contains UnitPriceExtension named unitPrice 1..1 
    * extension[unitPrice]
      * ^short = "Unit Price"
      * ^definition = "Specifies the lineItem unit price."



* totalPriceComponent 0..0

* totalNet 1..1
  * value 1..1
  * currency 0..1

* totalGross 1..1
  * value 1..1
  * currency 0..1

* paymentTerms 0..1
* note 0..1
