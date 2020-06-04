public class NewBeerEmailNotification {
	
    @InvocableMethod
    public static void SendEmails(){
    	//get contacts
        List<contact> lstcon=[SELECT id FROM contact WHERE Type__c = 'customer' limit 250];
        //get contacts id
        List<Id> lstids= new List<Id>();
        for(Contact c:lstcon)
        {
            lstids.add(c.id);
        }
        
        //prepare message and targets
        EmailTemplate et=[Select id from EmailTemplate where name = 'Marketing: Product Inquiry Response' limit 1]; 
        Messaging.MassEmailMessage mail = new Messaging.MassEmailMessage();
        mail.setTargetObjectIds(lstIds);
        mail.setSenderDisplayName('System Admin');
        mail.setTemplateId(et.id);
        
        //send email
        Messaging.sendEmail(new Messaging.MassEmailMessage[] { mail });
    }
}