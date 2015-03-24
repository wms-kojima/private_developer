@isTest
private class ContactMngmntTest{
    private static testMethod void creatContactTest(){    
        Lead lead = new Lead();        
        lead.memo__c = 'テストメモ';
        lead.kaisyameikana__c = 'テストカイシャ';
        lead.syubetsu__c ='申込み';
        lead.juribi__c =Date.parse('2014/08/16') ;
        lead.moushikomipakku__c = '標準パック';
        lead.namaekana__c = 'テストナマエ';
        lead.LastName = '名前';
        lead.FirstName = 'テスト';
        lead.EMail = 'test@test.jp';
        lead.Phone = '0123-456-789';
        lead.Company = 'テスト会社';
        lead.moushikomibi__c = Date.parse('2014/08/15');
        lead.KIGYOUID__c = '111111';        
        insert lead;
        
        Account accs = new Account();
        accs.memo__c = lead.memo__c; /*メモ*/
        accs.kaisyameikana__c = lead.kaisyameikana__c; /*会社名カナ*/
        accs.syubetsu__c = lead.syubetsu__c; /*種別*/
        accs.juribi__c = lead.juribi__c; /*受理日*/
        accs.moushikomipakku__c = lead.moushikomipakku__c; /*申込みパック*/
        accs.moushikomibi__c = lead.moushikomibi__c; /*申込日*/
        accs.namaekana__c = lead.namaekana__c; /*名前カナ*/
        accs.Name = lead.Company; /*取引先名*/
        accs.KIGYO_ID__c = lead.KIGYOUID__c; /*企業ID*/    
        
        ContactMngmnt cm = new ContactMngmnt(lead,accs);
        Contact cont = cm.creatContact();        
               
        System.assertEquals('名前', cont.LastName);
        System.assertEquals('テスト', cont.FirstName);
        System.assertEquals('テストナマエ', cont.NAME_KANA__c);
        System.assertEquals('test@test.jp', cont.Email);
        System.assertEquals('0123-456-789', cont.Phone);
    }    
}