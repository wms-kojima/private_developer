public class old_juri_Controller {
    Account accs;
    @TestVisible
    Lead leds;
    Contact cont;
    public string input { get; set; }
    public service__c service { get; set; }
    
    //コンストラクタ&リード情報取得
    public Lead getleds(){
        leds = new Lead();
      
        leds = [select
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
                    id = :System.currentPageReference().getParameters().get('id')
               ];
        return leds;
    }

    public void onClick(){
        accs = new Account();
        cont = new Contact();
        service = new service__c();
        
        //取引先作成
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
        
        //取引先責任者に書き込み
        cont.accountid = accs.id;
        cont.LastName = leds.LastName;
        cont.FirstName = leds.FirstName;
        cont.NAME_KANA__c = leds.namaekana__c;
        cont.Email = leds.EMail;
        cont.Phone = leds.Phone;
      
        insert cont;
      
        //利用サービスに書き込み
        service.moushikomipakku__c = input;
        service.RIYOUKAISHIBI__c = system.today();
        service.torihikisaki__c = accs.id;
        service.KIGYO_ID__c = leds.KIGYOUID__c;
      
        insert service;
      
        send();
    }
      
    //こっからメール…
    public void send(){
              
        //多分これで管理者情報から引っ張ってくれるはず…
        //List<OrgWideEmailAddress> manager = [select id, Address from OrgWideEmailAddress where DisplayName = '管理者'];
        //だめだったらこれパクる。
        OrgWideEmailAddress owa = [select id, Address from OrgWideEmailAddress where Address =:'kojima@wmshome.net' limit 1];
        
        String to =leds.Email;
        String subject = '申込み受理';
        String body = leds.kaisyameikana__c + ' ' + leds.Name + '様、申込み受理いたしました。';
        
        //送るメソッド/       
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
         
        //さっきの指定を代入/
        mail.setToAddresses(new String[]{to}) ;//ここであて先を指定
        mail.setSubject(subject);//ここで題名を指定
        mail.setPlainTextBody(body);//ここで本文を指定      
    
        //これで送る動作？/
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }      
}