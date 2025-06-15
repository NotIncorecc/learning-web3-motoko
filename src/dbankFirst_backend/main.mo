import Debug "mo:base/Debug";
import Int "mo:base/Int";

actor DBank {
  stable var currentValue : Float = 300;
  let startTime : Int = Time.now();
  Debug.print(debug_show(startTime));

  let id = 1243258409;// it is immutable, cannot be changed
  Debug.print(debug_show(id));

  //these functions `pTopUp` and `withdraw` are 'update methods' which change/write on the blockchain, so they are computationally expensive and take time

  public func pTopUp(amount: Nat) {//public function, can be run from the terminal with `dfx canister call dbankFirst_backend pTopUp`
    currentValue += amount;
    Debug.print(debug_show(currentValue))
  };


  public func withdraw(amount: Nat){
    if ((currentValue - amount) : Int >= 0){
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print(debug_show("not enough value to withdraw"));
    }
  };

  //the query function
  public query func checkBalance(): async Nat {
    return currentValue;
  };
}
