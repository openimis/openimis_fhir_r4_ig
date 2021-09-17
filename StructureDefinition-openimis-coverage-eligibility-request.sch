<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile CoverageEligibilityRequest
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:CoverageEligibilityRequest</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest">
      <sch:assert test="count(f:identifier) &lt;= 0">identifier: maximum cardinality of 'identifier' is 0</sch:assert>
      <sch:assert test="count(f:priority) &lt;= 0">priority: maximum cardinality of 'priority' is 0</sch:assert>
      <sch:assert test="count(f:serviced[x]) &lt;= 0">serviced[x]: maximum cardinality of 'serviced[x]' is 0</sch:assert>
      <sch:assert test="count(f:enterer) &lt;= 0">enterer: maximum cardinality of 'enterer' is 0</sch:assert>
      <sch:assert test="count(f:provider) &lt;= 0">provider: maximum cardinality of 'provider' is 0</sch:assert>
      <sch:assert test="count(f:facility) &lt;= 0">facility: maximum cardinality of 'facility' is 0</sch:assert>
      <sch:assert test="count(f:supportingInfo) &lt;= 0">supportingInfo: maximum cardinality of 'supportingInfo' is 0</sch:assert>
      <sch:assert test="count(f:insurance) &lt;= 0">insurance: maximum cardinality of 'insurance' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest">
      <sch:assert test="not(parent::f:contained and f:contained)">If the resource is contained in another resource, it SHALL NOT contain nested Resources (inherited)</sch:assert>
      <sch:assert test="not(exists(for $id in f:contained/*/f:id/@value return $contained[not(parent::*/descendant::f:reference/@value=concat('#', $contained/*/id/@value) or descendant::f:reference[@value='#'])]))">If the resource is contained in another resource, it SHALL be referred to from elsewhere in the resource or SHALL refer to the containing resource (inherited)</sch:assert>
      <sch:assert test="not(exists(f:contained/*/f:meta/f:versionId)) and not(exists(f:contained/*/f:meta/f:lastUpdated))">If a resource is contained in another resource, it SHALL NOT have a meta.versionId or a meta.lastUpdated (inherited)</sch:assert>
      <sch:assert test="not(exists(f:contained/*/f:meta/f:security))">If a resource is contained in another resource, it SHALL NOT have a security label (inherited)</sch:assert>
      <sch:assert test="exists(f:text/h:div)">A resource should have narrative for robust management (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.meta</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:meta">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.implicitRules</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:implicitRules">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.language</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:language">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.text</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.extension</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.modifierExtension</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.identifier</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.status</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:status">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.priority</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:priority">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.purpose</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:purpose">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.patient</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:patient">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.serviced[x] 1</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:serviced[x]">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.created</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:created">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.enterer</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:enterer">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.provider</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:provider">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.insurer</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:insurer">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.facility</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:facility">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.supportingInfo</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:supportingInfo">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.supportingInfo.extension</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:supportingInfo/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.supportingInfo.modifierExtension</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:supportingInfo/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.supportingInfo.sequence</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:supportingInfo/f:sequence">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.supportingInfo.information</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:supportingInfo/f:information">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.supportingInfo.appliesToAll</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:supportingInfo/f:appliesToAll">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.insurance</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:insurance">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.insurance.extension</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:insurance/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.insurance.modifierExtension</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:insurance/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.insurance.focal</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:insurance/f:focal">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.insurance.coverage</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:insurance/f:coverage">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.insurance.businessArrangement</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:insurance/f:businessArrangement">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:CoverageEligibilityRequest/f:item</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item">
      <sch:assert test="count(f:supportingInfoSequence) &lt;= 0">supportingInfoSequence: maximum cardinality of 'supportingInfoSequence' is 0</sch:assert>
      <sch:assert test="count(f:productOrService) &gt;= 1">productOrService: minimum cardinality of 'productOrService' is 1</sch:assert>
      <sch:assert test="count(f:modifier) &lt;= 0">modifier: maximum cardinality of 'modifier' is 0</sch:assert>
      <sch:assert test="count(f:provider) &lt;= 0">provider: maximum cardinality of 'provider' is 0</sch:assert>
      <sch:assert test="count(f:quantity) &lt;= 0">quantity: maximum cardinality of 'quantity' is 0</sch:assert>
      <sch:assert test="count(f:unitPrice) &lt;= 0">unitPrice: maximum cardinality of 'unitPrice' is 0</sch:assert>
      <sch:assert test="count(f:facility) &lt;= 0">facility: maximum cardinality of 'facility' is 0</sch:assert>
      <sch:assert test="count(f:diagnosis) &lt;= 0">diagnosis: maximum cardinality of 'diagnosis' is 0</sch:assert>
      <sch:assert test="count(f:detail) &lt;= 0">detail: maximum cardinality of 'detail' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.extension</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.modifierExtension</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.supportingInfoSequence</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:supportingInfoSequence">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.category</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:category">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:CoverageEligibilityRequest/f:item/f:productOrService</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:productOrService">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 0">coding: maximum cardinality of 'coding' is 0</sch:assert>
      <sch:assert test="count(f:text) &gt;= 1">text: minimum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.productOrService</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:productOrService">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.productOrService.extension</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:productOrService/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.productOrService.coding</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:productOrService/f:coding">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.productOrService.text</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:productOrService/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.modifier</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:modifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.provider</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:provider">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.quantity</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:quantity">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.unitPrice</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:unitPrice">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.facility</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:facility">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.diagnosis</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:diagnosis">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.diagnosis.extension</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:diagnosis/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.diagnosis.modifierExtension</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:diagnosis/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.diagnosis.diagnosis[x] 1</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:diagnosis/f:diagnosis[x]">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CoverageEligibilityRequest.item.detail</sch:title>
    <sch:rule context="f:CoverageEligibilityRequest/f:item/f:detail">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
