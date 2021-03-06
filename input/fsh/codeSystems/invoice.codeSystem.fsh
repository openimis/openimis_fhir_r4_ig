CodeSystem: InvoiceTypeCS
Id: invoice-type
Title: "Type (Invoice)"
Description: "Indicates the Type for an Invoice. Values defined by openIMIS. Can not be extended."
* #contribution "Contribution" "To pay the contribution for a Policy under the Informal Sector coverage."
* #contract "Contract" "To pay the contributions under the Formal Sector coverage."
* #funding "Funding" "To create a request for external funds."

CodeSystem: InvoiceChargeItemCS
Id: invoice-charge-item
Title: "ChargeItem (Invoice)"
Description: "Indicates the ChargeItem for a lineItem from an Invoice. Values defined by openIMIS. Can not be extended."
* #contribution "Contribution"
* #policy "Policy"

CodeSystem: BillTypeCS
Id: bill-type
Title: "Type (Bill Invoice)"
Description: "Indicates the Type for Bill. Values defined by openIMIS. Can not be extended."
* #claim-batch "Claim batch payment" "How much the insurance need to pay the HF for the claims reimbursment."
* #commission "Commission" "How much the insurance need to pay the commission to EO."
* #fees "Fees" "How much the insurance need to pay the payment platform for the fee for payment service."

CodeSystem: BillChargeItemCS
Id: bill-charge-item
Title: "ChargeItem (Bill Invoice)"
Description: "Indicates the ChargeItem for a lineItem from a Bill. Values defined by openIMIS. Can not be extended."
* #claim "Claim" "Fee-for-service or Capitation amount"
* #commission "Commission" "Commission amount"
* #fees "Fees" "Fees amount"
