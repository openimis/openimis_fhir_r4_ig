// This is the profile for openIMIS Group 
// Mapping is done throught Insuree and Family openIMIS entities
Profile: OpenIMISSubscription
Parent: Subscription
Id: openimis-subscription
Title: "openIMIS Subscription"
Description: "Allows to subscribe to notification of new or updates entitities."

* id
  * ^short = "Subcription UUID"
  * ^definition = "Subcription UUID generated by openIMIS."

* status 1..1
* contact 0..0
* end 0..1
  * ^short = "When to automatically disable the subscription"

* reason 1..1
* criteria 1..1
* error 0..1
* channel 1..1
  * type = FHIRSubscriptionChannelType#rest-hook "Rest Hook"
    * ^short = "Only Rest Hook is supported"
    * ^definition = "Currently, only Rest Hook is supported."
  * endpoint 1..1
    * ^short = "Where to send notifications"
    * ^definition = "Full URL to send notification about new resources."
  * payload 0..0
  * header 0..*
    * ^short = "Headers to send"
    * ^definition = "Headers to add with the notification that are sent to endpoint."
