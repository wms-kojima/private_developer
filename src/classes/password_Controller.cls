public class password_Controller {

//自動実装プロパティ
public integer i{ get; set; }
public integer n{ get; set; }
public integer a{ get; set; }
public string password{ get; set; }
public string box{ get; set; }

//Constructor
    public password_Controller() {
    password = '';
    box = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    n=null;
    a=0;
    }

public void onClick() {    
password='';

for(integer i=0;  i < n; ++i){
a = math.floor(math.random()*box.length()).intValue() ;
password = password + box.substring(a,a+1);}


}}