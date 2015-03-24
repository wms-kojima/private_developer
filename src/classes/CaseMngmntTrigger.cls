public class CaseMngmntTrigger{
    /**
     * コンサルティングオプションケースのbeforeInsert.
     * @param aCase ケース
     * @param acct 取引先
     * @param cont 取引先責任者
     * @author kojima
     */
    public void beforeInsert(Case aCase){
            CaseMngmntDate csMngmntDate = new CaseMngmntDate();
            Account acct = csMngmntDate.getKigyoIdAccount(aCase.KIGYO_ID__c);
            aCase.AccountId = acct.Id;
            
            Contact cont = csMngmntDate.getKigyoIdContact(aCase.KIGYO_ID__c);
            aCase.ContactId = cont.Id;
    }
    /**
     * コンサルティングオプションケースのafterUpdate.
     * @param aCase_old trigger.old
     * @param aCase_new trigger.new
     * @author kojima
     */
    public void afterUpdate(Case aCase_old, Case aCase_new){
        if(aCase_old.Status != '完了' && aCase_new.Status == '完了'){
            CaseMngmntDate csMngmntDate = new CaseMngmntDate();
            Contact cont = csMngmntDate.getKigyoIdContact(aCase_new.KIGYO_ID__c);

            MailMngmnt mailMngmnt = new MailMngmnt();
            mailMngmnt.sendMail('管理者', 'コンサルティングオプション申込み完了', cont.id);

            insert csMngmntDate.getService(aCase_new.KIGYO_ID__c, cont.Accountid);
        }
    }
}