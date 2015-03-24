public class ServiceMngmnt{
    Account accs;
    Lead leds;
    string serviceNameInput;
        
    public ServiceMngmnt(Lead aLead,Account aAccount,string aserviceNameInput){
        leds = aLead;
        accs = aAccount;
        serviceNameInput = aserviceNameInput;
    }

    public service__c creatService(){        
        service__c service = new service__c();                
        service.moushikomipakku__c = serviceNameInput;
        service.RIYOUKAISHIBI__c = system.today();
        service.torihikisaki__c = accs.id;
        service.KIGYO_ID__c = leds.KIGYOUID__c;      
        insert service;       
        
        return service; 
    }        
}