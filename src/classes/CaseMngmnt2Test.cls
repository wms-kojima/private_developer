@isTest
private class CaseMngmnt2Test{
    private static testMethod void getServiceTest(){
        CaseMngmnt2Test cm2Test = new CaseMngmnt2Test();
    	Account accs = cm2Test.getAccount();
    	insert accs;
        CaseMngmnt2 cm2 = new CaseMngmnt2();
    	service__c serv = cm2.getService(accs.KIGYO_ID__c,accs.id);

    	System.assertEquals('コンサルティングオプション', serv.moushikomipakku__c);
        System.assertEquals(accs.KIGYO_ID__c, serv.KIGYO_ID__c);
        System.assertEquals(accs.id, serv.torihikisaki__c);
    }

    private Account getAccount(){
    	Account accs = new Account();
    	accs.memo__c = 'テスト';
        accs.kaisyameikana__c = 'テストカイシャ';
        accs.syubetsu__c = '申込み';
        accs.moushikomipakku__c = '標準パック';
        accs.namaekana__c = 'テストナマエ';
        accs.Name = 'テスト会社';
        accs.KIGYO_ID__c = '999999';
        return accs;
    }
}