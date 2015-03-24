public class MailMngmnt{
    //メール送信まとめ    
    public void sendMail(String disname,String tempName,ID targetid){
        OrgWideEmailAddress owa = getOrgWideEmailAddress(disname);
        EmailTemplate temp = getEmailFromTemplate(tempName);
        Messaging.SingleEmailMessage createmail = createEmailMassage(targetid,owa.id,temp.id);
        sendEmailMassage(createmail);        
    }
        
    //組織のEmailを求める
    @TestVisible
    private OrgWideEmailAddress getOrgWideEmailAddress(String disname){   
        OrgWideEmailAddress owa = [select
                                      id,
                                      Address,
                                      DisplayName
                                  from
                                      OrgWideEmailAddress
                                  where
                                      DisplayName =:disname
                                      limit 1
                                  ];              
        return owa;        
    }
    
    // 指定したテンプレートのメール情報を取得する
    @TestVisible
    private  EmailTemplate getEmailFromTemplate(String tempName){
        EmailTemplate temp = [select
                                 id,
                                 subject,
                                 body
                             From
                                 EmailTemplate
                             where
                                 name =:tempName
                                 limit 1
                             ];                       
        return temp;        
    }
    
    // Emailを作る
    @TestVisible
    private Messaging.SingleEmailMessage createEmailMassage(ID aObjectId,
                                                           ID aOrgWideEmailAddressId,
                                                           ID asetTemplateId                                                          
                                                          ){                                       
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();        
        mail.setTargetObjectId(aObjectId);
        mail.setOrgWideEmailAddressId(aOrgWideEmailAddressId);
        mail.setTemplateId(asetTemplateId);

        return mail;        
    }
    
    //Email送る
    @TestVisible
    private void sendEmailMassage(Messaging.SingleEmailMessage mail){    
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});        
    }
    
}