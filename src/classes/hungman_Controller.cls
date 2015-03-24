/**
 *ハングマン
 *@author kojima 2014/09
 */
public class hungman_Controller{
    /**
     *インスタンス変数
     */
    Integer miss = 0;
    String correct {get; set;}
    public String correctHint {get; set;}
    public String picture {get; set;}
    public String result {get; set;}
    public String userAnswer {get; set;}

    /**
     *コンストラクタ.
     */
    private hungman_Controller(){
        Integer i = getNumber();
        correct = getword(i);
        correctHint = getHintWord(i);
        result = '-'.repeat(correct.length());
    }

    /**
     *ボタンでの結果を表示.
     */
    public void onClick(){
        miss++;
        if(getResult(correct, userAnswer)){
            result = '正解!!';
            picture = 'http://linemarket.net/wp-sm/wp-content/uploads/1009150_main.png';
            return;
        }
        if(miss == 6){
            result = 'HANGMAN!';
            picture = getPictureURL();
            return;
        }
        result = getNewResult(correct, userAnswer);
        picture = getPictureURL();
    }

    /**
     *正解選ぶための数字決定.
     */
    private Integer getNumber(){
        return math.round(math.random()*5 + 0.5);
    }

    /**
     *正解を得る.
     */
    private String getword(Integer i){
        List<String> word = new List<String>();
        word.add('geography');
        word.add('cat');
        word.add('yesterday');
        word.add('java');
        word.add('truck');

        return word.get(i);
    }

    private String getHintWord(Integer i){
        List<String> hintWord = new List<String>();
        hintWord.add('');
        hintWord.add('');
        hintWord.add('');
        hintWord.add('');
        hintWord.add('');

        return hintWord.get(i);
    }

    /**
     *文字列が合ってるかの判定。だけどいらないかも….
     */
    private boolean getResult(String correct, String userAnswer){
        return correct.equals(userAnswer);
    }

    /**
     *文字を比べて間違っている部分に'-'を代入する.
     */
    private String getNewResult(String correct, String userAnswer){
        String newResult = '';
        Integer n;
        for(n = 0; n < correct.length();){
            if(!compareWord(n)){
                newResult = newResult + '-';
            }
            else{
                newResult = newResult + userAnswer.substring(n, n+1);
            }
            n++;
        }
        return newResult;
    }

    /**
     *一文字ずつ比較してtureかfalseを返す.
     */
    private Boolean compareWord(Integer n){
        List<Boolean> judge = new List<Boolean>();
        judge.add(correct.substring(n, n+1) == userAnswer.substring(n, n+1));
        return judge.get(n);
    }

    /**
     *missの回数によってURLを取得.
     */
    private String getPictureURL(){
        if(miss == 1){
            return picture = 'http://www.line-tatsujin.com/stamp/detail/a10914/002.png';
        }
        else if(miss == 2){
            return picture = 'http://linemarket.net/wp-sm/wp-content/uploads/1009823_main.png';
        }
        else if(miss == 3){
            return picture = 'http://www.line-tatsujin.com/stamp/detail/a10914/002.png';
        }
        else if(miss == 4){
            return picture = 'http://linemarket.net/wp-sm/wp-content/uploads/1009823_main.png';
        }
        else if(miss == 5){
            return picture = 'http://linemarket.net/wp-sm/wp-content/uploads/1011586_main.png';
        }
        else{
            return picture = 'http://www.line-tatsujin.com/stamp/detail/a10914/040.png';
        }
    }
}