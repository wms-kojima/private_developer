@isTest
private class old_juricontrollerTest{
    private static testMethod void myTest() {

        Lead lead = new Lead();    
        //firstとlastが組み合わさったものだからこれ単体はいらない？leds.Name = 'テスト名前';
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

        old_juri_Controller jC = new old_juri_Controller();
        jC.leds = lead;
        jC.onClick();
        
        Account accs = [select
                    id,
                    memo__c,
                    kaisyameikana__c,
                    syubetsu__c,
                    juribi__c,
                    moushikomipakku__c,
                    moushikomibi__c,
                    namaekana__c,
                    Name
                from
                    Account
                where
                    Name =: 'テスト会社'
                         
               ];
                   
        Contact cont = [select
                    LastName,
                    FirstName,
                    NAME_KANA__c,
                    Email,
                    Phone
                from
                    Contact
                where
                    accountid =: accs.id
               ];
            
        service__c service = [select
                                 //moushikomipakku__c,
                                 //RIYOUKAISHIBI__c,
                                 torihikisaki__c
                             from
                                 service__c
                             where
                                 torihikisaki__c =: accs.id
                             ];
               
        System.assertEquals('テストメモ', accs.memo__c);
        System.assertEquals('テストカイシャ', accs.kaisyameikana__c);
        System.assertEquals('申込み', accs.syubetsu__c);
        System.assertEquals(Date.parse('2014/08/16'), accs.juribi__c);
        System.assertEquals('標準パック', accs.moushikomipakku__c);
        System.assertEquals(Date.parse('2014/08/15'), accs.moushikomibi__c);
        System.assertEquals('テストナマエ', accs.namaekana__c);
        System.assertEquals('テスト会社', accs.Name);
        System.assertEquals('名前', cont.LastName);
        System.assertEquals('テスト', cont.FirstName);
        System.assertEquals('テストナマエ', cont.NAME_KANA__c);
        System.assertEquals('test@test.jp', cont.Email);
        System.assertEquals('0123-456-789', cont.Phone);
        System.assertEquals(accs.id, service.torihikisaki__c);        
    }
    
}