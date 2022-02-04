
# Dart 객체지향 프로그래밍

dartpad 사이트
https://dartpad.dev/?id

1시간만에 끝내는 객체지향 프로그래밍
https://www.youtube.com/watch?v=7e80Il_7Z70


***

### class, constructor, getter, setter
```dart
void main() {
  Idol blackPink = Idol(
    '블랙핑크',
    ['지수', '제니', '리사', '로제'],
  );
  
  Idol blackPink2 = Idol(
    '블랙핑크',
    ['지수', '제니', '리사', '로제'],
  );

  print(blackPink.name);
  print(blackPink.members);
  blackPink.sayHello();
  blackPink.introduce();

  print(blackPink == blackPink2);
  
  Idol bts = Idol.fromList(
    [
      ['RM', '진', '슈가', '제이홉', '뷔', '정국'],
      'BTS',
    ],
  );

  print(bts.name);
  print(bts.members);
  bts.sayHello();
  bts.introduce();
  
  print(blackPink.firstMember);
  print(bts.firstMember);
  
  blackPink.firstMember = '코드';
  bts.firstMember = '아이언맨';
  
  print(blackPink.firstMember);
  print(bts.firstMember);
}

// Idol class
// name (이름) - 변수
// members (멤버들) - 변수
// sayHello (인사) - 함수
// introduce (멤버소개) - 함수
// constructor (생성자)
// immutable 프로그래밍 : 한번 설정하면 수정하지 못하도록 프로그래밍함
// 소수의 상황을 제외하곤 클래스내에서 변수를 final로 설정하도록 습관 들이자.

// getter, setter
// 데이터를 가져올때, 데이터를 설정할때

// private 속성 부여 방법 : 클래스, 함수, 변수 이름 앞에 _를 붙인다.
// 다른 파일에서 사용하지 못하도록 설정함
class Idol {
  String name;
  List<String> members;

  Idol(this.name, this.members);
  Idol.fromList(List values)
      : members = values[0],
        name = values[1];

  void sayHello() {
    print('안녕하세요 $name입니다.');
  }

  void introduce() {
    print('저희 멤버는 $members가 있습니다.');
  }
  
  //getter
  String get firstMember{
    return this.members[0];
  }
  //setter : 단 하나의 파라미터만 받을수 있음
  set firstMember(String name){
    this.members[0] = name;
  }
}
```

***

### inheritance
```dart
void main() {
  print('-----------Idol-----------');
  Idol apink = Idol(name: '에이핑크', membersCount: 5);

  apink.sayName();
  apink.sayMembersCount();

  print('-----------boygroup-----------');
  BoyGroup bts = BoyGroup('BTS', 7);

  bts.sayName();
  bts.sayMembersCount();
  bts.sayMale();
  
  print('-----------girlgroup-----------');
  GirlGroup redVelvet = GirlGroup('Red Velvet', 5);
  
  redVelvet.sayName();
  redVelvet.sayMembersCount();
  redVelvet.sayFemale();
  
  print('-----------Type Comparison-----------');
  print(apink is Idol);     //true
  print(apink is BoyGroup); //false
  print(apink is GirlGroup);//false
  
  print('-----------Type Comparison2-----------');
  print(bts is Idol);       //true
  print(bts is BoyGroup);   //true
  print(bts is GirlGroup);  //false
  
}

// 상속 - inheritance
// 상속을 받으면 부모 클래스의 모든 속성을
// 자식 클래스가 부여받는다.

class Idol {
  //이름
  String name;
  //멤버 숫자
  int membersCount;

  Idol({
    required this.name,
    required this.membersCount,
  });

  void sayName() {
    print('저는 $name입니다.');
  }

  void sayMembersCount() {
    print('$name은 $membersCount명의 멤버가 있습니다.');
  }
}

class BoyGroup extends Idol {
  BoyGroup(String name, int membersCount)
      : super(name: name, membersCount: membersCount);

  void sayMale() {
    print('저는 남자 아이돌입니다.');
  }
}

class GirlGroup extends Idol {
  GirlGroup(String name, int membersCount)
      : super(name: name, membersCount: membersCount);
  
  void sayFemale() {
    print('저는 여자 아이돌입니다.');
  }
}
```

***

### override
```dart
void main() {
  TimesTwo tt = TimesTwo(2);

  print(tt.calculate()); //4
  
  TimesFour tf = TimesFour(2);

  print(tf.calculate()); //8
}

// method : function (class 내부에 있는 함수)
// override : 덮어쓰다 (우선시하다)

class TimesTwo {
  final int number;

  TimesTwo(
    this.number,
  );

  //method
  int calculate() {
    return number * 2;
  }
}

class TimesFour extends TimesTwo {
  TimesFour(
    int number,
  ) : super(number);
  
  @override
  int calculate(){
    return super.calculate() * 2;
  }
}
```

***

### static
```dart
void main() {
  Employee seulgi = Employee('슬기');
  Employee chorong = Employee('초롱');
  
  seulgi.printNameBuilding();
  chorong.printNameBuilding();
  
  Employee.building = '오투타워';
  
  seulgi.printNameBuilding();
  chorong.printNameBuilding();
  
  Employee.printBuilding();
}

class Employee {
  // static은 instance에 귀속되지 않고 class에 귀속된다.
  // 알바생이 일하고있는 건물
  static String? building;
  // 알바생 이름
  final String name;

  Employee(
    this.name,
  );

  void printNameBuilding() {
    print('제 이름은 $name입니다. $building건물에서 근무하고 있습니다.');
  }

  static void printBuilding() {
    print('저는 $building 건물에서 근무중입니다.');
  }
}

```

***

### interface
```dart
void main() {
  BoyGroup bts = BoyGroup('BTS');
  GirlGroup redVelvet = GirlGroup('레드벨벳');
  //IdolInterfaece test = IdolInterfaece('테스트'); //abstract 선언 했기 때문에 instance화 할수 없음
  
  bts.sayName();      //제 이름은 BTS입니다.
  redVelvet.sayName();//제 이름은 레드벨벳입니다.
  
  print(bts is IdolInterface); //true
  print(bts is BoyGroup); //true
  print(bts is GirlGroup); //false
}

// interface
// 클래스를 생성할때 꼭 사용해야하는 함수나 변수를 정의
// abstract : 인스턴스로 만들지 못하도록 추상화 함
abstract class IdolInterface {
  String name;

  IdolInterface(this.name);

  void sayName();
}

class BoyGroup implements IdolInterface {
  @override
  String name;

  BoyGroup(this.name);

  @override
  void sayName() {
    print('제 이름은 $name입니다.');
  }
}

class GirlGroup implements IdolInterface {
  @override
  String name;

  GirlGroup(this.name);

  @override
  void sayName() {
    print('제 이름은 $name입니다.');
  }
}
```

***

### generic
```dart
void main() {
  Lecture<String> lecture1 = Lecture('123', 'lecture1');
  
  lecture1.printIdType();
  
  Lecture<int> lecture2 = Lecture(123, 'lecture2');
  
  lecture2.printIdType();
  
}

// generic : 타입을 외부에서 받을때 사용

class Lecture<T> {
  final T id;
  final String name;

  Lecture(this.id, this.name);
  
  void printIdType(){
    print(id.runtimeType);
  }
}

```

***