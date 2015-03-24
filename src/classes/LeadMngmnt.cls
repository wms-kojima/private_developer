public class LeadMngmnt{

    public static void SetValueRecieveForm(Lead[] leds){
        Date dToday = System.today();
        for(Lead l:leds){
            l.moushikomibi__c = dToday;
        }
    }    

    public Lead getleds(ID lid){
        Lead leds = [select
                        id,
                        Name,
                        consulting_opution__c,
                        memo__c,
                        kaisyameikana__c,
                        syubetsu__c,
                        juribi__c,
                        moushikomipakku__c,
                        moushikomibi__c,
                        namaekana__c,
                        LastName,
                        FirstName,
                        EMail,
                        Phone,
                        Company,
                        KIGYOUID__c
                    from
                        Lead
                    where
                        id = :lid
                    ];
        return leds;
    }
    
}