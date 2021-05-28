class Pair<E, F> {
  E _first;
  F _second;

  Pair(this._first, this._second);

  set first(E value) => _first = value;
  set second(F value) => _second = value;

  E get first => _first;
  F get second => _second;
}
