import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue1: Float = 300.0;

  var startTime = Time.now();

  let id = 1243258409;// it is immutable, cannot be changed
  Debug.print(debug_show(id));
  Debug.print(debug_show(currentValue1));

  //these functions `pTopUp` and `withdraw` are 'update methods' which change/write on the blockchain, so they are computationally expensive and take time

  public func pTopUp(amount: Float) {//public function, can be run from the terminal with `dfx canister call dbankFirst_backend pTopUp`
    currentValue1 += amount;
    Debug.print(debug_show(currentValue1))
  };


  public func withdraw(amount: Float){
    if ((currentValue1 - amount) : Float >= 0){
    currentValue1 -= amount;
    Debug.print(debug_show(currentValue1));
    } else {
      Debug.print(debug_show("not enough value to withdraw"));
    }
  };

  //the query function
  public query func checkBalance(): async Float {
    return currentValue1;
  };

  public func compound(rate: Float) {
    let currentTime = Time.now();
    let elapsedTime = Float.fromInt(currentTime-startTime)/1000000000;
    currentValue1:=currentValue1* (1.0 + rate) ** elapsedTime;
    startTime:=currentTime;
  }
  //I deleted .dfx and tried again
  //The whole problem was that icp had stored the currentValue1 as int only, so it was not allowing changing of type
  //deletion of previous data in .dfx fixed the problem 
}
