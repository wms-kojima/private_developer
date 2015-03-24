public class numeron_Controller {
    //自動実装プロパティ
    public integer eat{ get; set; }
    public integer bite{ get; set; }
    public string input{ get; set; }
    public string a{ get; set; }
    public string b{ get; set; }
    public string c{ get; set; }  
    public string result{ get; set; }
    public string kekka{ get; set; }
    public string answer{ get; set; }
    public Boolean tsukuru{ get; set; }

    //Constructor
    public numeron_Controller() {
        reset();    
    }

    public void onClick(){  
        //もし入力したのが数字型以外だったらエラー
        if(input.IsNumeric() == false ){
        input = '数字を入力してください！';
        return;    
        }

        //入力の桁数が違ったらエラー
        if(input.length() != 3){
            input = '３桁の数字を入力してください！';
            return;    
            }
    
        //数字が重複したらエラー
        if(input.substring(0,1) == input.substring(1,2) ||
           input.substring(1,2)==input.substring(2,3) ||
           input.substring(2,3)==input.substring(0,1)){
        input = '数字の重複があります！';
        return; 
        }     

        //桁の位置合ってたらEAT、数字だけ合ってたらBITEを表示。if文で条件設定。
        //EAT判定
        eat=0;

        if(a==input.substring(0,1)){
            eat=eat+1;
        }
       if(b==input.substring(1,2)){
           eat=eat+1;
        }
       if(c==input.substring(2,3)){
           eat=eat+1;
        }
         
        //BITE判定
    bite=0;
    if(input.containsAny(a) == true && a != input.substring(0,1)){
      bite=bite+1;
      }
    if(input.containsAny(b) == true && b != input.substring(1,2)){
      bite=bite+1;
      }
    if(input.containsAny(c) == true && c != input.substring(2,3)){
      bite=bite+1;
      }
    
//全ての数字が揃ったら終了→お祝いコメント表示的な
    if(eat==3){
      kekka='Correct!!';
      }
    else{
      result=String.valueOf(eat)+'EAT-'+String.valueOf(bite)+'BITE';
      kekka=kekka+'\n'+result;
      }
  }
    
//０～９から３つ選ぶ→重複なし　重複したら再度ループ？
    public void reset(){
    
    tsukuru=true;
    result='';
    kekka='';
        
    while(tsukuru){
      a = math.floor(math.random()*10).format() ;
      b = math.floor(math.random()*10).format() ;
      c = math.floor(math.random()*10).format() ;
        if(a!=b && b!=c && c!=a){
        tsukuru=false;
        }
      }
    }
    public void answer(){
    answer=a+b+c;
    }
}