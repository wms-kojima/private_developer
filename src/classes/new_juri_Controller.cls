public class new_juri_Controller{
    public Lead leds { get; set; }
    public string serviceNameInput{ get; set; }
    
    public new_juri_Controller(){
        LeadMngmnt lm = new LeadMngmnt();
        leds = lm.getleds(System.currentPageReference().getParameters().get('id'));
    }
    
    public void onClick(){    
        insertDate();
        sendMail();        
    }
    
    private void insertDate(){    
        AccountMngmnt am = new AccountMngmnt(leds); 
        Account accs = am.creatAccount();
 
        ContactMngmnt cm = new ContactMngmnt(leds,accs);
        cm.creatContact();
    
        ServiceMngmnt sm = new ServiceMngmnt(leds,accs,serviceNameInput);
        sm.creatService();        
    }
    
    private void sendMail(){    
        MailMngmnt mm = new MailMngmnt();        
        mm.sendMail('管理者','受理受付',leds.id);        
    }       
}