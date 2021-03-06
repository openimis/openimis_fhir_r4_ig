// This is the profile for openIMIS Contract 
// Only for POST 
Instance: Claim001CommunicationRequest
InstanceOf: OpenIMISCommunicationRequest
Description: """
            * Example of a CommunicationRequest
            """

* status = FHIRRequestStatus#active "Active"
* statusReason = FeedbackStatusCS#4 "Selected"

* subject = Reference(john-doe)

* about = Reference(Claim001)

* payload[CareRendered]
  * contentString = "Care Rendered? (yes|no)"
  * extension[type].valueCodeableConcept = FeedbackPayloadCS#CareRendered 
* payload[PaymentAsked]
  * contentString = "Payment Asked? (yes|no)"
  * extension[type].valueCodeableConcept = FeedbackPayloadCS#PaymentAsked 
* payload[DrugPrescribed]
  * contentString = "Drug Prescribed? (yes|no)"
  * extension[type].valueCodeableConcept = FeedbackPayloadCS#DrugPrescribed 
* payload[DrugReceived]
  * contentString = "Drug Received? (yes|no)"
  * extension[type].valueCodeableConcept = FeedbackPayloadCS#DrugReceived 
* payload[Asessment]
  * contentString = "Asessment? (0|1|2|3|4|5)"
  * extension[type].valueCodeableConcept = FeedbackPayloadCS#Asessment 

* recipient = Reference(Roberts-Jeb-EO)
