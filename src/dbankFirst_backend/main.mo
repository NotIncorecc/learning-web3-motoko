import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300;
  currentValue := 100;//assignment in place

  let id = 1243258409;// it is immutable, cannot be changed
  Debug.print(debug_show(id));

  func topUp(){//private function(only accessible to the DBank actor)
    currentValue += 1;
    Debug.print(debug_show(currentValue))
  };

  public func pTopUp() {//public function, can be run from the terminal with `dfx canister call dbankFirst_backend pTopUp`
    currentValue += 1;
    Debug.print(debug_show(currentValue))
  }

  //topup();
}
