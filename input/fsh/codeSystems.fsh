
// Code System for openIMIS Identifiers
CodeSystem: OpenIMISIdentifierCS
Id:         openimis-identifiers-cs
Title:     "openIMIS Identifiers code system"
Description: "Identifiers that are specific to openIMIS and could not be found in standard sources"
* #UUID  
    "UUID unique identifier"
    "The UUID V4 unique identifier that is generated by the openIMIS Database"
* #DBID 
    "DB unique identifier"
    "The DB unique integer identifier managed by the openIMIS DB"
* #Code
    "Unique code"
    "An identifier issued by the implementer to identify an openIMIS entity"

CodeSystem: OpenIMISContactRelationshipCS
Id: openimis-contact-relationship-cs
Title: "openIMIS Contact Relationship code system"
Description: "Indicates the Relationship of a Patient with the Head of the Family"
* ^url =  https://openimis.github.io/openimis_fhir_r4_ig/CodeSystem/openimis-contact-relationship-cs
* #Spouse "Spouse"
* #Brother/Sister "Brother/Sister"
* #Father/Mother "Father/Mother"
* #Uncle/Aunt "Uncle/Aunt"
* #Son/Daughter "Son/Daughter"
* #GrandParents "Grand parents"
* #Employee "Employee"
* #Others "Others"