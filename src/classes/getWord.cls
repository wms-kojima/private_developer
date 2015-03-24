/**
 *ハングマンゲーム
 *@author kojima 2014/09
 */
public class hungman_Controller{
    /**
     *インスタンス変数
     */
    /*Integer i;
    Integer miss = 0;
    public Integer correctLength {get; set;}
    public String correct {get; set;}
    public String picture {get; set;}
    public String result {get; set;}
    public String userAnswer {get; set;}

    /**
     *コンストラクタ.
     */
    /*private hungman_Controller(){
        i = getNumber();
        correct = getCorrect();
        //correctLength = correct.length();
    }

    /**
     *ボタンでの結果を表示.
     */
    /*public void onClick(){
        /*if(userAnswer.isWhitespace()){
            result = '';
            return;
        }
        if(getResult(correct, userAnswer)){
            return result = '正解!!';
        }
        return result = getNewResult(correct, userAnswer);
    }

    /**
     *正解か不正解かでresultを変える.
     */
    /*private String getResultWord(){
        if(getResult(correct, userAnswer)){
            return result = '正解!!';
        }
        return result = getNewResult(correct, userAnswer);
    }

    /**
     *正解か不正解かでpictureを変える.
     */
    /*private String getResultPicture(){
        if(getResult(correct, userAnswer)){
            return picture = '';
        }
        return picture = getPicture();
    }*/

    /**
     *missが５回以上かどうかで画像のURLを変える.
     */
    /*private String getPicture(){
        if(miss > 5){
            return picture = '';
        }
        picture = getPictureURL(miss);
        miss++;
        return picture;
    }

    /**
     *missが0～4回のときのURL.
     */
    /*private String getPictureURL(Integer miss){
        if(miss == 0){
            return picture = '';
        }
        else if(miss == 1){
            return picture = '';
        }
        else if(miss == 2){
            return picture = '';
        }
        else if(miss == 3){
            return picture = '';
        }
        else{
            return picture = '';
        }
    }

    /**
     *正解選ぶための数字決定.
     */
    /*private Integer getNumber(){
        return math.round(math.random()*5 + 0.5);
    }

    /**
     *正解を得る.
     */
    /*private String getCorrect(){
        List<String> word = new List<String>();
        word.add('geography');
        word.add('cat');
        word.add('yesterday');
        word.add('java');
        word.add('truck');

        return word.get(i);
    }

    /**
     *文字列が合ってるかの判定。だけどいらないかも….
     */
    /*private boolean getResult(String correct, String userAnswer){
        return correct.equals(userAnswer);
    }

    /**
     *文字を比べて間違っている部分に'-'を代入する.
     */
    /*private String getNewResult(String correct, String userAnswer){
        String newResult = '';
        Integer n;
        for(n = 0; n < correctLength;){
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
    /*private Boolean compareWord(Integer n){
        List<Boolean> judge = new List<Boolean>();
        judge.add(correct.substring(n, n+1) == userAnswer.substring(n, n+1));
        return judge.get(n);
    }*/
}