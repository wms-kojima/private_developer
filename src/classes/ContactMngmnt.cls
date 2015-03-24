public class ContactMngmnt{
    Account accs;
    Lead leds;
    
    public ContactMngmnt(Lead aLead,Account aAccount){
        leds = aLead;
        accs = aAccount;
    }
    
    public Contact  creatContact(){
        Contact cont = new Contact();                
        cont.accountid = accs.id;
        cont.LastName = leds.LastName;
        cont.FirstName = leds.FirstName;
        cont.NAME_KANA__c = leds.namaekana__c;
        cont.Email = leds.EMail;
        cont.Phone = leds.Phone;      
        insert cont;
        
        return cont;
    }    
}