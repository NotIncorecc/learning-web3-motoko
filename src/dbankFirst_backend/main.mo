import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300;
  currentValue := 100;//assignment in place

  Debug.print("Hello");
  //error line 9: currentValue is not a string, but a nat
  //Debug.print(currentValue);
  Debug.print(debug_show(currentValue));//correct way to print a nat

  let id = 1243258409;// it is immutable, cannot be changed
  Debug.print(debug_show(id))
}
