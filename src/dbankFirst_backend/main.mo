import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  var currentValue = 300;
  currentValue := 100;//assignment in place

  let id = 1243258409;// it is immutable, cannot be changed
  Debug.print(debug_show(id));

  //these functions `pTopUp` and `withdraw` are 'update methods' which change/write on the blockchain, so they are computationally expensive and take time

  public func pTopUp(amount: Float) {//public function, can be run from the terminal with `dfx canister call dbankFirst_backend pTopUp`
    currentValue += amount;
    Debug.print(debug_show(currentValue))
  };


  public func withdraw(amount: Float){
    if ((currentValue - amount) : Float >= 0){
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print(debug_show("not enough value to withdraw"));
    }
  };

  //the query function
  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound(rate: Float) {
    let currentTime : Int = Time.now();
    let elapsedTime : Int = (currentTime-startTime)/1000000000 : Int;

    currentValue:= currentValue*((1+rate)**(Float.fromInt(elapsedTime))) : Float;
  }
}
