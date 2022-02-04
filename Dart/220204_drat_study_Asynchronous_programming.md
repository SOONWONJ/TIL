
# Dart 비동기 프로그래밍

dartpad 사이트
https://dartpad.dev/?id

비동기 프로그래밍
https://www.youtube.com/watch?v=rk41rBXq3zQ&t=13s


***

### Future
```dart
void main(){
  // Future 미래에 받아올 값
  
  addNumbers(1,1);
  addNumbers(2,2);
}

void addNumbers(int number1, int number2){
  print('계산 시작: $number1 + $number2');
  
  //서버 시뮬레이션
  Future.delayed(Duration(seconds:2),(){
    print('계산 완료: $number1 + $number2 = ${number1 + number2}');
  });
  
  print('함수 완료: $number1 + $number2 = ${number1 + number2}');
}
```
결과

계산 시작: 1 + 1

함수 완료: 1 + 1 = 2

계산 시작: 2 + 2

함수 완료: 2 + 2 = 4

계산 완료: 1 + 1 = 2

계산 완료: 2 + 2 = 4

***

### await 1
```dart
void main() {
  // Future 미래에 받아올 값
  Future<String> name = Future.value('코드팩토리');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  addNumbers(1,1);
  addNumbers(2,2);
}

void addNumbers(int number1, int number2) async{
  print('계산 시작: $number1 + $number2');
  
  //서버 시뮬레이션
  await Future.delayed(Duration(seconds:2),(){
    print('계산 완료: $number1 + $number2 = ${number1 + number2}');
  });
  
  print('함수 완료: $number1 + $number2 = ${number1 + number2}');
}
```
결과

계산 시작: 1 + 1

계산 시작: 2 + 2

계산 완료: 1 + 1 = 2

함수 완료: 1 + 1 = 2

계산 완료: 2 + 2 = 4

함수 완료: 2 + 2 = 4
***

### await 2
```dart
void main() async{
  // Future 미래에 받아올 값
  
  await addNumbers(1,1);
  await addNumbers(2,2);
}

Future<void> addNumbers(int number1, int number2) async{
  print('계산 시작: $number1 + $number2');
  
  //서버 시뮬레이션
  await Future.delayed(Duration(seconds:2),(){
    print('계산 완료: $number1 + $number2 = ${number1 + number2}');
  });
  
  print('함수 완료: $number1 + $number2 = ${number1 + number2}');
}
```
결과

계산 시작: 1 + 1

계산 완료: 1 + 1 = 2

함수 완료: 1 + 1 = 2

계산 시작: 2 + 2

계산 완료: 2 + 2 = 4

함수 완료: 2 + 2 = 4

***

### Stream 1
```dart
import 'dart:async';

void main() async{
  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();
  
  final streamListener1 = stream.listen((val){
    print('Listener 1 : $val');
  });
  
  final streamListener2 = stream.listen((val){
    print('Listener 2 : $val');
  });
  
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
}
```
결과

Listener 1 : 1

Listener 2 : 1

Listener 1 : 2

Listener 2 : 2

Listener 1 : 3

Listener 2 : 3

Listener 1 : 4

Listener 2 : 4

Listener 1 : 5

Listener 2 : 5
***

### Stream 2
```dart
import 'dart:async';

void main() async{
  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();
  
  final streamListener1 = stream.where((val)=>val%2 ==0).listen((val){
    print('Listener 1 : $val');
  });
  
  final streamListener2 = stream.where((val)=>val%2 ==1).listen((val){
    print('Listener 2 : $val');
  });
  
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
}

```
Listener 2 : 1

Listener 1 : 2

Listener 2 : 3

Listener 1 : 4

Listener 2 : 5
***

### Stream 3
```dart
import 'dart:async';

void main() {
  calculate(2).listen((val) {
    print('calculate(2) : $val');
  });
  
  calculate(4).listen((val) {
    print('calculate(4) : $val');
  });
}

Stream<int> calculate(int number) async* {
  for (int i = 0; i < 5; i++) {
    yield i * number;
  }
}

```
calculate(2) : 0

calculate(4) : 0

calculate(2) : 2

calculate(4) : 4

calculate(2) : 4

calculate(4) : 8

calculate(2) : 6

calculate(4) : 12

calculate(2) : 8

calculate(4) : 16
***

### Stream 4
```dart
import 'dart:async';

void main() {
  calculate(2).listen((val) {
    print('calculate(2) : $val');
  });
  
  calculate(4).listen((val) {
    print('calculate(4) : $val');
  });
}

Stream<int> calculate(int number) async* {
  for (int i = 0; i < 5; i++) {
    yield i * number;
  }
  
  await Future.delayed(Duration(seconds:1));
}
```
calculate(2) : 0

calculate(4) : 0

calculate(2) : 2

calculate(4) : 4

calculate(2) : 4

calculate(4) : 8

calculate(2) : 6

calculate(4) : 12

calculate(2) : 8

calculate(4) : 16
***

### Stream 5
```dart
import 'dart:async';

void main() {
  playAllStream().listen((val) {
    print(val);
  });
}

Stream<int> playAllStream() async* {
  yield* calculate(1);
  yield* calculate(1000);
}

Stream<int> calculate(int number) async* {
  for (int i = 0; i < 5; i++) {
    yield i * number;

    await Future.delayed(Duration(seconds: 1));
  }
}

```

0

1

2

3

4

0

1000

2000

3000

4000
***
