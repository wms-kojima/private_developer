public class fizzbuzz_Controller {

//自動実装プロパティ
public string moji{ get; set; }
public integer suji{ get; set; }

//Constructor
    public fizzbuzz_Controller() {
    moji = '';
    }
    
    
    public void onClick() {    
    //判定
    if((math.mod(suji,3) == 0) && (math.mod(suji,5) == 0)){
    moji='fizzbuzz';
    
    }
    else if(math.mod (suji,3) == 0){
    moji='fizz';
    }
    else if (math.mod(suji,5) == 0){
    moji='buzz';
    }
    else{
    
    moji='' + suji;}    
    
    }
    }