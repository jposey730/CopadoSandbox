/**
 * @description       : 
 * @author            : gposey@copado.com 
 * @group             : 
 * @last modified on  : 05-21-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author              Modification
 * 1.0   05-19-2021   gposey@copado.com   Initial Version
**/

global with sharing class TrialScript {
    private static final List<String>ENV_NAMES = 
        new List<String>{'ORG1', 'ORG2', 'ORG3', 'ORG4', 'ORG5'};
    //private static final List<String>ENV_NAMES = 
        //new List<String>{'SBX'};
    @InvocableMethod (label='Create Sandboxes')
    global static void execute() {
        for (String name : ENV_NAMES){
            createSandboxes(name);
        }
        //createSandboxes('name');
    }

    private static void createSandboxes(String envName){
        String sfdcURL = URL.getSalesforceBaseUrl().toExternalForm(); 
        String restAPIURL = sfdcURL + '/services/data/v42.0/tooling/sobjects/SandboxInfo';  
        HttpRequest httpRequest = new HttpRequest();  
        httpRequest.setMethod('POST');   
        httpRequest.setBody('{"Description":"PipelineSandbox", "HistoryDays":0,"LicenseType":"DEVELOPER","SandboxName":"'+envName+'"}');
        httpRequest.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());        
        httpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID()); 
        httpRequest.setHeader('Content-Type', 'application/json');
        httpRequest.setEndpoint(restAPIURL);  
        String response = '';
        try {  
                Http http = new Http();   
                HttpResponse httpResponse = http.send(httpRequest);  
                if (httpResponse.getStatusCode() == 201 ) {  
                    response = JSON.serializePretty( JSON.deserializeUntyped(httpResponse.getBody()) ); 
                    //installCopado(); 
                } else {  
                    System.debug(' httpResponse ' + httpResponse.getBody() );  
                    throw new CalloutException( httpResponse.getBody() );  
                }   
        } catch( System.Exception e) {  
                System.debug('ERROR: '+ e);  
                throw e;  
        }  
        System.debug(' ** response ** : ' + response );  
    }

    // public static PageReference installCopado(){
    //     PageReference retURL = new PageReference('https://login.salesforce.com/packaging/installPackage.apexp?p0=04t5p000001BlaY');
    //     retURL.setRedirect(true);
    //     return retURL;

    // }
    // public class MyDeployCallback implements Metadata.DeployCallback {
    //     public void handleResult(Metadata.DeployResult result, Metadata.DeployCallbackContext context){
    //         if(result.status == Metadata.DeployStatus.Succeeded){
    //             System.debug('Success');
    //         }else{
    //             System.debug('Failure');
    //         }
    //     } 
    // }
    // public class CreateMetadata{
    //     public void updateAndDeployMetadata() {
    //         //Metadata.CustomMetadata customMetadata =  new Metadata.CustomMetadata();
    //         Metadata.InstalledPackage install = new Metadata.InstalledPackage();
    //         Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
    //         mdContainer.addMetadata(install);
    //         MyDeployCallback callback = new MyDeployCallback();   
    //         // Enqueue custom metadata deployment
    //         Id jobId = Metadata.Operations.enqueueDeployment(mdContainer, callback);
    //     }
    // }
}