public class CaseMngmnt2{
    Case cas;      
    public void BeforeInsert(Case[] acase){
        for(Case cas:acase){
            CaseMngmnt cm = new CaseMngmnt();         
            Account accs = cm.kigyoidAccount(cas.KIGYO_ID__c);
            cas.Accountid = accs.id;
            
            Contact cont = cm.kigyoidContact(cas.KIGYO_ID__c);
            cas.Contactid = cont.id;
        }
    }
    
     public void AfterUpdate(Case[] acase){
         try{
            for(Case cas:acase){
                if(cas.Status == '完了'){
                    CaseMngmnt cm = new CaseMngmnt();
                    Contact cont = cm.kigyoidContact(cas.KIGYO_ID__c);
                    MailMngmnt mm = new MailMngmnt();        
                    mm.sendMail('管理者','コンサルティングオプション申込み完了',cont.id);

                    service__c service = getService(cas.KIGYO_ID__c,cont.Accountid);
                    insert service;
                }
            }
        }
        catch(Exception e){        
            return;
        }
    }
    
    @TestVisible
    private service__c getService(String kigyoid,ID accountid){
        service__c service = new service__c();
        service.moushikomipakku__c = 'コンサルティングオプション';
        service.RIYOUKAISHIBI__c = system.today();
        service.KIGYO_ID__c = kigyoid;
        service.torihikisaki__c = accountid;        
        return service;
    }                    
}