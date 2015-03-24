public class Greeting_Controller {
    //自動実装プロパティ
    public String greeting { get; set; }

    //Constructor
    public Greeting_Controller() {
        this.greeting = 'こんにちは';
    }
    
    //method
    public void exit(){
    this.greeting = 'さようなら';
    }
}