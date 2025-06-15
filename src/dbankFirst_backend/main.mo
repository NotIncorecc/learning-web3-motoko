import Debug "mo:base/Debug";
import Int "mo:base/Int";

actor DBank {
  var currentValue = 300;
  currentValue := 100;//assignment in place

  let id = 1243258409;// it is immutable, cannot be changed
  Debug.print(debug_show(id));

  public func pTopUp(amount: Nat) {//public function, can be run from the terminal with `dfx canister call dbankFirst_backend pTopUp`
    currentValue += amount;
    Debug.print(debug_show(currentValue))
  };

  /*for candid ui interface type `dfx canister id __Candid_UI`
  then go to http://127.0.0.1:4943/?canisterId=<the id you found>
  Enter the canister id you found from the command `dfx canister id dbankFirst_backend`
  */
  //orthogonal persistance: everytime `dfx deploy` runs, all the variables get wiped off 

  public func withdraw(amount: Nat){
    if ((currentValue - amount) : Int >= 0){
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print(debug_show("not enough value to withdraw"));
    }
  }
}
