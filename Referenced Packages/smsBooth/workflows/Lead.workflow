<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>When_lead_is_generated_from_Inbound_sms</fullName>
        <description>When lead is generated from Inbound sms</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Smsforce_Template/New_Inbound_Lead</template>
    </alerts>
</Workflow>
