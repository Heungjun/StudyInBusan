void main() {
  //1. 집합 선언
  Set<int> naturalNumbers = {1, 2, 3, 4, 1};
  Set<String> ids = {"X-3", "X-2", "X-1"};

  //2. 집합 사용
  print('numbers are $naturalNumbers');
  print('ids are $ids');
//  print('first number is ${numbers[0]}');

  for (int each in naturalNumbers) {
    print('each number is $each');
  }

//  Set<int> integers = { 0 } + naturalNumbers;

//3. 수학적 집합의 활용
  Set<int> a = {100, 200, 300};
  Set<int> b = {100, 200, 500, 1000};

  print('a union b = ${a.union(b)}');
  print('a intersection b = ${a.intersection(b)}');
  print('a difference b = ${a.difference(b)}');
}
