<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Survey_Email_Alert</fullName>
        <description>Survey Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Survey_Email_Template</template>
    </alerts>
    <rules>
        <fullName>Send Survey Email Workflow</fullName>
        <actions>
            <name>Survey_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Survey_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Workflow to send survey email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
