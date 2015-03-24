@isTest
private class CaseMngmntDateTest{
    /**
     * getCaseのテストコード.
     * @param aCase getCaseDateで作成したケース
     * @param cs csMngmntDateで作成したケース
     * @author kojima
     */
    private static testMethod void getCaseTest(){
    Case aCase = getCaseDate();
    insert aCase;
    CaseMngmntDate csMngmntDate = new CaseMngmntDate();
    Case cs = csMngmntDate.getCase(aCase.id);

    System.assertEquals(aCase.Id, cs.Id);
    }
    /**
     * kigyoidAccountのテストコード.
     * @param acct getKigyoIdAccountで作成した取引先
     * @author kojima
     */
    private static testMethod void kigyoIdAccountTest(){
        insert getAccountDate();
        CaseMngmntDate csMngmntDate = new CaseMngmntDate();         
        Account acct = csMngmntDate.getKigyoIdAccount('999999');

        System.assertEquals('999999', acct.KIGYO_ID__c);
    }
    /**
     * kigyoIdContactのテストコード.
     * @param cont getKigyoIdContactで作成した取引先
     * @author kojima
     */
    private static testMethod void kigyoIdContactTest(){
        insert getContactDate();
        CaseMngmntDate csMngmntDate = new CaseMngmntDate(); 
        Contact cont = csMngmntDate.getKigyoIdContact('999999');

        System.assertEquals('999999', cont.KIGYO_ID__c);
    }
    /**
     * getServiceのテストコード.
     * @param acct getKigyoIdAccountで作成した取引先
     * @param serv sMngmntDate.getServiceで作成したコンサルティングオプションサービス
     * @author kojima
     */
    private static testMethod void getServiceTest(){
        Account acct = getAccountDate();
        CaseMngmntDate csMngmntDate = new CaseMngmntDate();
        service__c serv = csMngmntDate.getService(acct.KIGYO_ID__c, acct.Id);

        System.assertEquals(acct.KIGYO_ID__c, serv.KIGYO_ID__c);
        System.assertEquals(acct.Id, serv.torihikisaki__c);
    }
    /**
     * getAccountDateのテストコード.
     * @param acct 取引先
     * @author kojima
     */
    private static Account getAccountDate(){
        Account acct = new Account();
        acct.memo__c = 'テスト';
        acct.kaisyameikana__c = 'テストカイシャ';
        acct.syubetsu__c = '申込み';
        acct.moushikomipakku__c = '標準パック';
        acct.namaekana__c = 'テストナマエ';
        acct.Name = 'テスト会社';
        acct.KIGYO_ID__c = '999999';
        return acct;
    }
    /**
     * getContactDateのテストコード.
     * @param cont 取引先責任者
     * @author kojima
     */
    private static Contact getContactDate(){
        Contact cont = new Contact();
        cont.LastName = '名前';
        cont.Email = 'test@test.jp';
        cont.FirstName = 'テスト';
        cont.Phone = '0123-456-789';
        cont.NAME_KANA__c = 'テストナマエ';
        cont.KIGYO_ID__c = '999999';
        return cont;
    }
    /**
     * getCaseDateのテストコード.
     * @param acct 取引先
     * @param cont 取引先責任者
     * @param cs ケース
     * @author kojima
     */
    private static Case getCaseDate(){
        Account acct = getAccountDate();
        insert acct;
        Contact cont = getContactDate();
        insert cont;

        Case cs = new Case();
        cs.KIGYO_ID__c = '999999';
        cs.AccountId = acct.Id;
        cs.ContactId = cont.Id;
        cs.consulting_opution__c = '標準コンサルティング';
        cs.Type = 'コンサルティングオプション申込み';
        return cs;
    }
}