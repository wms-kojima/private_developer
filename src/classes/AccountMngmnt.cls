public class AccountMngmnt{
    public Account accs;
    Lead leds;
    
    public AccountMngmnt(Lead aLead){
        leds = aLead;
    }

    public Account creatAccount(){                    
        accs = new Account();        
        accs.consulting_opution__c = leds.consulting_opution__c; /*コンサルティングオプション*/
        accs.memo__c = leds.memo__c; /*メモ*/
        accs.kaisyameikana__c = leds.kaisyameikana__c; /*会社名カナ*/
        accs.syubetsu__c = leds.syubetsu__c; /*種別*/
        accs.juribi__c = leds.juribi__c; /*受理日*/
        accs.moushikomipakku__c = leds.moushikomipakku__c; /*申込みパック*/
        accs.moushikomibi__c = leds.moushikomibi__c; /*申込日*/
        accs.namaekana__c = leds.namaekana__c; /*名前カナ*/
        accs.Name = leds.Company; /*取引先名*/
        accs.KIGYO_ID__c = leds.KIGYOUID__c; /*企業ID*/    
        insert accs;
        
        return accs;     
    }
}