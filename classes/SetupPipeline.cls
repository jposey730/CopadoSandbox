/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-21-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   05-19-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class SetupPipeline {
    private static final List<String>ENV_NAMES = 
            new List<String>{'ORG1', 'ORG2', 'ORG3', 'ORG4', 'ORG5'}; 
    public static void setupTrialPipline (){
        createOrgCredentials();
        //createPipeline();
    }

    public static void createOrgCredentials (){
        List<copado__Org__c>orgCreds = new List<copado__Org__c>();

        for(String name : ENV_NAMES){
            copado__Org__c orgCred = new copado__Org__c();
            orgCred.copado__is_Developer_Hub_Org__c = false;
            if(name != 'PROD')
                orgCred.copado__Org_Type__c = 'Sandbox';
            else
                orgCred.copado__Org_Type__c = 'Production/Developer';
            orgCred.Name = name;
            orgCreds.add(orgCred);
        }
        try{
            insert orgCreds;
        }catch(DMLException e){
            System.debug('Exception in createOrgCredentials = ' + e );
        }
    }
    // public static void createPipeline(){
    //     copado__Deployment_Flow__c pl = new copado__Deployment_Flow__c();
    //     pl.Active = true;
    //     Name = 'Trial Pipeline';
    // }
}