global class SendSurveyBatch implements Database.Batchable<sObject>, Database.Stateful {
	
	global integer emailLimit = 0;
	global integer emailCount = 0;
	
    global Database.QueryLocator start(Database.BatchableContext BC) {   
    	// Getting the Email Limit from Custom Setting. Else setting default limit to 100
    	if(Configurations__c.getInstance('Email_Limit') != null){
    		emailLimit = integer.valueof(Configurations__c.getInstance('Email_Limit').Limit__c);
    	}else{
    		emailLimit = 100;
    	}
    	// Get all Contacts where Survery_Date__c is less than now / today;
        String query = 'Select id, Survey_Date__c from contact where Survey_Date__c < Today';  
        return Database.getQueryLocator(query);
    }
      
    global void execute(Database.BatchableContext BC, List<Contact> conList) {
    	List<Contact> updateContactList = new List<Contact>();
    	// If its within the limits sends an Email via workflow else escape the loop.
    	system.debug('emailCount'+emailCount); 
        system.debug('emailLimit'+emailLimit);
    	for(Contact con : conList){
    		if(emailCount == emailLimit){ 
    			break;
    		}else{
    			emailCount++;
    			con.Survey_Date__c = null;
    			updateContactList.add(con);
    		}
    	}
    	if(updateContactList.size() > 0){
    		// Here the failures are not handled. Can be handled by error framework or by creating a Error Log in 
    		// Error__c custom object.
    		database.update(updateContactList,false);
    	}
    	
    }   
     
    global void finish(Database.BatchableContext BC) {
        // Can send failed contacts emails if required.
  	}
}