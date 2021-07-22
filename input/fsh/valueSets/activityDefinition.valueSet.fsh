ValueSet: ActivityDefinitionUsageContextTypeVS
Id: activity-definition-usage-context-type
Title: "Usage Context Type (ActivityDefinition)"
Description: "Indicates the Usage Context Type for an ActivityDefinition."
* UsageContextTypeCS#gender "Gender"
* UsageContextTypeCS#age "Age Range"
* UsageContextTypeCS#workflow "Workflow Setting"
* UsageContextTypeCS#venue "Clinical Venue"

ValueSet: ActivityDefinitionUsageContextGenderTypeVS
Id: activity-definition-usage-context-gender-type
Title: "Usage Context for Gender Type (ActivityDefinition)"
Description: "Indicates the Usage Context for Gender Type for an ActivityDefinition."
* FHIRAdministrativeGenderCS#male "Male"
* FHIRAdministrativeGenderCS#female "Female"

ValueSet: ActivityDefinitionUsageContextAgeTypeVS
Id: activity-definition-usage-context-age-type
Title: "Usage Context for Age Type (ActivityDefinition)"
Description: "Indicates the Usage Context for Age Type for an ActivityDefinition."
* codes from system ActivityDefinitionUsageContextAgeTypeCS

ValueSet: ActivityDefinitionUsageContextWorkflowTypeVS
Id: activity-definition-usage-context-workflow-type
Title: "Usage Context for Workflow Type (ActivityDefinition)"
Description: "Indicates the Usage Context for Workflow Type for an ActivityDefinition. Values defined by openIMIS. Can not be extended."
* codes from system ActivityDefinitionUsageContextWorkflowTypeCS

ValueSet: ActivityDefinitionUsageContextVenueTypeVS
Id: activity-definition-usage-context-venue-type
Title: "Usage Context for Venue Type (ActivityDefinition)"
Description: "Indicates the Usage Context for Venue Type for an ActivityDefinition."
* FHIRActCodeCS#AMB "ambulatory"
* FHIRActCodeCS#IMP "IMP"
