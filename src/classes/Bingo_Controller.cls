/**
 * １．ビンゴマス（２４マス）に数字（１～７５）を割り当てる。全て変数に格納して値を保持。listのlistらしい。二次元配列？
 * ２．真ん中に「bingo」を持たせる
 * ３．１～７５の数字をランダムに呼ぶメソッド（一度呼んだ数字は呼ばない制御はどこにしよ）
 * ４．呼ばれた数字がマスにあった場合、そのマスに「bingo」を持たせる
 * ５．ビンゴとなる変数の組み合わせが全て「bingo」になったらビンゴ的なメッセージ表示
 * ６．あとなんかないか・・・？差分333
 */


public class Bingo_Controller{
	List<Integer> remainNumber = new List<Integer>{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75};
	
	/**
	 * Constructor
	 */
	public Bingo_Controller(){
		//ビンゴカードを作るsssssssssssssssssssssss
		//createBingoCard();
	}

	/**
	 * １～７５の数字をランダムに取得
	 * 取得したらその番号消す
	 */
	private Integer getNumber(){
		Integer randomNumber = (math.floor(math.random()*76)-1).intValue();
		Integer bingoNumber = remainNumber.get(randomNumber);
		remainNumber.remove(randomNumber);
		return bingoNumber;
	}

	/**
	 * ビンゴシートに値をセットしていく
	 */
	//private List<List<Integer>> createBingoCard(){
	//	//マップに数字を入れていく？ListのList？どうやって値をもたせればいいのか・・・
	//	List<Integer> bingoCardNumber1 = new List<Integer>();
	//	List<Integer> bingoCardNumber2 = new List<Integer>();
	//	List<Integer> bingoCardNumber3 = new List<Integer>();
	//	List<Integer> bingoCardNumber4 = new List<Integer>();
	//	List<Integer> bingoCardNumber5 = new List<Integer>();

	//	bingoCardNumber1 = setNumber();
	//	bingoCardNumber2 = setNumber();
	//	bingoCardNumber3 = setNumber();
	//	bingoCardNumber4 = setNumber();
	//	bingoCardNumber5 = setNumber();

		//繰り返し?
		//ランダムメソッドを呼び出して格納
		//すでにカードに含まれている数字だったらもう一度メソッドを呼ぶ的な？
		//ビンゴカードに値をセット
		//真ん中に「bingo」をセット
		//ビンゴの値を返す
	//	List<List<Integer>> bingoCardNumbers = new List<List<Integer>>(bingoCardNumber1, bingoCardNumber2, bingoCardNumber3, bingoCardNumber4, bingoCardNumber5);
	//	return bingoCardNumbers;
	//}

	private List<Integer> setNumber(){
		List<Integer> bingoCardNumber = new List<Integer>();
		for(Integer i=0; i<4; i++){
			bingoCardNumber.add(getNumber());
		}
		return bingoCardNumber;
	}

	/**
	 * ビンゴゲーム中の数字取得ボタン
	 */
	public void hogehoge(){
		//リストに取得した数字入れてって重複しないようにするーーーー・・・・・
		//bingoNumber的な変数にその都度入れてく？
		//そしたらいままで出た数消えちゃう。Stringでどんどん足してく？
		//

	}

	/**
	 * 判定するメソッド
	 */
	public void judgeNumber(){
		//setNumberで得た数字がビンゴカードの中に含まれてないかチェック
		//含まれてたらその値を数字から「bingo」に変える？
		//
	}
}
