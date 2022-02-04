
# Dart 공부

dartpad 사이트
https://dartpad.dev/?id

1시간만에 끝내는 Dart언어 기본기 
https://www.youtube.com/watch?v=3Ck42C2ZCb8


***

### 기본 예제
```dart
void main() {
  print('Hello');
}
```

***

### 변수
```dart
  //integer
  int number1 = 2;
  int number2 = 4;
  print(number1 + number2);//6
  print(number1 - number2);//-2
  print(number1 / number2);//0.5
  print(number1 * number2);//8

  //double
  double number1 = 2.5;
  double number2 = 0.5;
  
  print(number1 + number2);//3
  print(number1 - number2);//2
  print(number1 / number2);//5
  print(number1 * number2);//1.25

  // Boolean
  bool isTrue = true;
  bool isFalse = false;
  
  print(isTrue);//true
  print(isFalse);//false
  
  // String
  String name = '이름';
  String name2 = '성함';
  
  print(name + name2);          //이름성함
  print(name + ' ' + name2);    //이름 성함
  print('${name} ${name2}');    //이름 성함
  print('$name $name2');        //이름 성함
  
  // variable
  var name3 = '블랙';
  var number = 20;
  
  print(name3.runtimeType);     //String
  print(number.runtimeType);    //int
  //직접 명시하지 않아도 될 경우에만 var 타입 사용
  //왠만하면 직접 변수형 명시

  // dynamic
  dynamic name = '이름';
  print(name); //이름
  dynamic number = 1;
  print(number); //1
  
  var name2 = '블랙';
  print(name2); //블랙
  
  print(name.runtimeType); //String
  print(name2.runtimeType);//String
  
  //dynamic과 var의 차이
  name = 2;
  //name2 = 5; 안됨
  
  print(name.runtimeType);//int
```

***

### null
```dart
  // null : 아무런 값도 있지 않다.

  // non-nullable : null이 될 수 없다.
  //String name = null; //안됨
  
  // nullable : null이 될 수 있다.
  String? name2 = null;
  print(name2); //null
  
  // ! : 무조건 null이 아니다.
  //print(name2!);
```
***

### final, const
```dart
  //final, const
  //변수의 값을 한번 설정하면 변경하지 못함
  final String name = '이름';
  final name2 = '이름'; //변수형 생략 가능
  //name = '성함'; 안됨
  
  const String name3 = '이름';
  const name4 = '이름'; //변수형 생략 가능
  //name3 = '성함'; 안됨
  
  // const : 빌드타임에 이미 정해진 값.
  // final : 빌드타임에 값을 몰라도 됨.
  final DateTime now = DateTime.now();
  //const DateTime now2 = DateTime.now(); 안됨
```
***

### Operators
```dart
  // Operators
  double number = 2;

  print(number);      //2
  print(number + 2);  //4
  print(number - 2);  //0
  print(number * 2);  //4
  print(number / 2);  //1
  print('------------------');
  print(number % 2);  //0
  print(number % 3);  //2
  print('------------------');
  print(number);      //2
  number++;
  print(number);      //3
  number--;
  print(number);      //2
  print('------------------');
  number += 1;
  print(number);      //3
  number -= 1;
  print(number);      //2
  number *= 2;
  print(number);      //4
  number /= 2;
  print(number);      //2

  print('------------------');
  double? number2 = 4.0;
  print(number2);     //4
  number2 = 2.0;
  print(number2);     //2
  number2 = null;
  print(number2);     //null
  //?? : number2가 null인 경우만 오른쪽 값으로 변경해라
  number2 ??= 3.0;
  print(number2);     //3
  
  print('------------------');
  int number3 = 1;
  int number4 = 2;

  print(number3 > number4);   //false
  print(number3 < number4);   //true
  print(number3 >= number4);  //false
  print(number3 <= number4);  //true
  print(number3 == number4);  //false
  print(number3 != number4);  //true
  print('------------------');
  int number5 = 1;
  // 변수형 비교
  print(number5 is int);    //true
  print(number5 is String); //false
  print(number5 is! int);   //false
  print(number5 is! String);//true
  print('------------------');
  bool result = 12 > 10 && 1 > 0;
  print(result);  //true
  bool result2 = 12 > 10 && 0 > 1;
  print(result2); //false
  bool result3 = 12 > 10 || 1 > 0;
  print(result3); //true
  bool result4 = 12 > 10 || 0 > 1;
  print(result4); //true
   bool result5 = 12 < 10 || 0 > 1;
  print(result5); //false
```
***

### List
```dart
  // List
  List<String> blackPink = ['제니', '지수', '로제', '리사'];
  List<int> numbers = [1, 2, 3, 4, 5, 6];

  print(blackPink);   //[제니, 지수, 로제, 리사]
  print(numbers);     //[1, 2, 3, 4, 5, 6]

  print(blackPink[0]);//제니
  print(blackPink[1]);//지수
  
  print(blackPink.length);  //4
  
  blackPink.add('코드팩토리');
  print(blackPink);         //[제니, 지수, 로제, 리사, 코드팩토리]
  
  blackPink.remove('코드팩토리');
  print(blackPink);         //[제니, 지수, 로제, 리사]
  
  print(blackPink.indexOf('로제'));//2
```
***

### Map
```dart
  //Map : Key, Value
  Map<String, String> dictionary ={
    'Harry Potter' : '해리포터',
    'Ron weasley' : '론 위즐리',
    'Hermione Granger' : '헤르미온느 그레인저',
  };
  print(dictionary);//{Harry Potter: 해리포터, Ron weasley: 론 위즐리, Hermione Granger: 헤르미온느 그레인저}
  
  Map<String, bool> isHarryPotter = {
    'Harry Potter' : true,
    'Ron weasley' : true,
    'Iron Man' : false,
  };
  print(isHarryPotter);//{Harry Potter: true, Ron weasley: true, Iron Man: false}
  
  isHarryPotter.addAll({
    'Spider Man' : false,
  });
  print(isHarryPotter);//{Harry Potter: true, Ron weasley: true, Iron Man: false, Spider Man: false}
  
  //Key에 해당되는 Value를 가져옴
  print(isHarryPotter['Iron Man']);//false
  
  isHarryPotter['Hulk'] = false;
  print(isHarryPotter);//{Harry Potter: true, Ron weasley: true, Iron Man: false, Spider Man: false, Hulk: false}
  
  isHarryPotter['Spider Man'] = true;
  print(isHarryPotter);//{Harry Potter: true, Ron weasley: true, Iron Man: false, Spider Man: true, Hulk: false}
  
  
  isHarryPotter.remove('Harry Potter');
  print(isHarryPotter);//{Ron weasley: true, Iron Man: false, Spider Man: true, Hulk: false}
  
  print(isHarryPotter.keys);//(Ron weasley, Iron Man, Spider Man, Hulk)
  print(isHarryPotter.values);//(true, false, true, false)
```
***

### Set
```dart
  // Set
  // 중복값이 없는 List
  final Set<String> names = {
    'Code Factory',
    'Flutter',
    'Black Pink',
    'Flutter'
  };
  
  print(names);//{Code Factory, Flutter, Black Pink}
  
  names.add('Jenny');
  print(names);//{Code Factory, Flutter, Black Pink, Jenny}
  names.remove('Jenny');
  print(names);//{Code Factory, Flutter, Black Pink}
  
  //존재하는지 확인
  print(names.contains('Flutter'));//true
```
***

### if, switch
```dart
  // if, switch
  int number = 3;

  if (number % 3 == 0) {
    print('나머지가 0 입니다.');
  } else if (number % 3 == 1) {
    print('나머지가 1 입니다.');
  } else {
    print('나머지가 2 입니다.');
  }

  switch (number % 3) {
    case 0:
      print('나머지가 0 입니다.');
      break;
    case 1:
      print('나머지가 1 입니다.');
      break;
    default:
      print('나머지가 2 입니다.');
      break;
  }
```
***

### for, while
```dart
  // for, while
  for (int i = 0; i < 10; i++) {
    print(i);
  }

  int total = 0;
  List<int> numbers = [1, 2, 3, 4, 5, 6];
  for (int i = 0; i < numbers.length; i++) {
    total += numbers[i];
  }
  print(total);//21
  
  //in loop
  total = 0;
  for(int number in numbers){
    total += number;
  }
  print(total);//21

  int total = 0;
  while (total < 10) {
    total += 1;
  }
  print(total); //10

  //do while
  total = 0;
  do {
    total += 1;
  } while (total < 10);
  print(total); //10

  //break
  total = 0;
  while (total < 10) {
    total += 1;
    if (total == 5) {
      break;
    }
  }
  print(total); //5

  //continue
  total = 0;
  for (int i = 0; i < 10; i++) {
    if (i == 5) {
      continue;
    }
    total += 1;
  }  
  print(total); //9
```
***

### enum
```dart
enum Status{
  approved,
  pending,
  rejected,
}

void main() {
  //enum
  Status status = Status.pending;
  
  if(status == Status.approved){
    print('승인입니다.');
  }else if(status == Status.pending){
    print('대기입니다.');
  }else{
    print('거절입니다.');
  }
}
```
***

### function
```dart
void main() {
  //function
  int result = addNumbers(y: 20, x: 30);
  print(result); //80
}

// 세개의 숫자 (x, y, z)를 더하고 짝수인지 홀수인지 알려주는 함수
// 입력, 매개변수, parameter, argument
// positional parameter : 순서가 중요한 파라미터
//addNumbers(int x, int y, int z)
//addNumbers(10, 20, 30);
// optional parameter : 있어도 되고 없어도 되는 파라미터
// addNumbers(int x, [int y = 20, int z = 30])
//addNumbers(10);
// named parameter : 이름이 있는 파라미터(순서 중요하지 않음)
//addNumbers({required int x, required int y, int z = 30})
//addNumbers(y: 10, x:30);
// arrow function : 화살표 다음의 값이 반환되는 값이다.
// int addNumbers(int x, int y, int z) => x + y + z;
int addNumbers({required int x, required int y, int z = 30}) {
  int sum = x + y + z;

  print('x : $x');
  print('y : $y');
  print('z : $z');

  if (sum % 2 == 0) {
    print('짝수입니다.');
  } else {
    print('홀수입니다.');
  }

  return sum;
}
```
***

### Typedef
```dart
void main() {
  Operation operation = add;
  int result = operation(10, 20, 30);
  print(result);//60

  operation = subtract;
  int result2 = operation(10, 20, 30);
  print(result2);//-40
  
  int result3 = calculate(30, 40, 50, add);
  print(result3);//120
  
  int result4 = calculate(30, 40, 50, subtract);
  print(result4);//-60
}

typedef Operation = int Function(int x, int y, int z);

// 더하기
int add(int x, int y, int z) => x + y + z;

// 빼기
int subtract(int x, int y, int z) => x - y - z;

// 계산
int calculate(int x, int y, int z, Operation operation) => operation(x, y, z);
```
***
