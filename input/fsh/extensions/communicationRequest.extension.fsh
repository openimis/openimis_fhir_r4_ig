Extension: CommunicationPayloadTypeExtension
Id:        communication-payload-type
Title:    "Payload Type (CommunicationRequest | Communication)"
Description: "Indicates the payload type for a Communication."
* insert ExtensionContext(OpenIMISCommunication)
* insert ExtensionContext(OpenIMISCommunicationRequest)
* value[x] only CodeableConcept
* valueCodeableConcept from FeedbackPayloadVS (required)

