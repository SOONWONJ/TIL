
# Dart 객체지향 프로그래밍

dartpad 사이트
https://dartpad.dev/?id

함수형 프로그래밍
https://www.youtube.com/watch?v=fwh27A_D-20


***

### 형변환
```dart
  List<String> blackPink = ['로제', '지수', '리사', '제니'];
  
  print(blackPink);
  print(blackPink.asMap());
  print(blackPink.toSet());
  
  Map blackPinkMap = blackPink.asMap();
  
  print(blackPinkMap.keys.toList());
  print(blackPinkMap.values.toList());
  
  Set blackPinkSet = Set.from(blackPink);
  
  print(blackPinkSet.toList());
```

***

### List
```dart
void main() {
  List<String> blackPink = ['로제', '지수', '리사', '제니'];

  final newBlackPink = blackPink.map((x) {
    return '블랙핑크 $x';
  });

  print(blackPink);             //[로제, 지수, 리사, 제니]
  print(newBlackPink.toList()); //[블랙핑크 로제, 블랙핑크 지수, 블랙핑크 리사, 블랙핑크 제니]
  
  final newBlackPink2 = blackPink.map((x) => '블랙핑크 $x');
  print(newBlackPink2.toList());//[블랙핑크 로제, 블랙핑크 지수, 블랙핑크 리사, 블랙핑크 제니]
  
  print(blackPink == blackPink);        //true
  print(newBlackPink == blackPink);     //false
  print(newBlackPink == newBlackPink2); //false
  
  String number = '13579';
  
  final parsed = number.split('').map((x)=>'$x.jpg').toList();
  
  print(parsed);  //[1.jpg, 3.jpg, 5.jpg, 7.jpg, 9.jpg]
}

```

***

### Map, Set
```dart
void main() {
  Map<String, String> harryPotter = {
    'Harry Potter': '해리포터',
    'Ron Weasly': '론 위즐리',
    'Hermione Granger': '헤르미온느 그레인저',
  };

  final result = harryPotter.map(
    (key, value) => MapEntry(
      'HPC $key',
      '해리포터 $value',
    ),
  );

  print(harryPotter);//{Harry Potter: 해리포터, Ron Weasly: 론 위즐리, Hermione Granger: 헤르미온느 그레인저}
  print(result);//{HPC Harry Potter: 해리포터 해리포터, HPC Ron Weasly: 해리포터 론 위즐리, HPC Hermione Granger: 해리포터 헤르미온느 그레인저}

  final keys = harryPotter.keys.map((x) => 'HPC $x').toList();
  final values = harryPotter.values.map((x) => '해리포터 $x').toList();

  print(keys);//[HPC Harry Potter, HPC Ron Weasly, HPC Hermione Granger]
  print(values);//[해리포터 해리포터, 해리포터 론 위즐리, 해리포터 헤르미온느 그레인저]

  Set blackPinkSet = {
    '로제',
    '지수',
    '제니',
    '리사',
  };

  final newSet = blackPinkSet.map((x) => '블랙핑크 $x').toSet();
  print(newSet);//{블랙핑크 로제, 블랙핑크 지수, 블랙핑크 제니, 블랙핑크 리사}
}

```

***

### where
```dart
void main() {
  List<Map<String,String>> people = [
    {
      'name' : '로제',
      'group' : '블랙핑크',
    },
    {
      'name' : '지수',
      'group' : '블랙핑크',
    },
    {
      'name' : 'RM',
      'group' : 'BTS',
    },
    {
      'name' : '뷔',
      'group' : 'BTS',
    },
  ];
  
  print(people);
  
  final blackPink = people.where((x)=>x['group'] == '블랙핑크').toList();
  final bts = people.where((x)=>x['group'] == 'BTS').toList();
  
  print(blackPink);//[{name: 로제, group: 블랙핑크}, {name: 지수, group: 블랙핑크}]
  print(bts);//[{name: RM, group: BTS}, {name: 뷔, group: BTS}]
}
```

***

### reduce
```dart
void main() {
  List<int> numbers = [1, 3, 5, 7, 9];

  /*
  final result = numbers.reduce((prev, next) {
    print('----------');
    print('previous : $prev');
    print('next : $next');
    print('total : ${prev + next}');

    return prev + next;
  });
  ----------
  previous : 1
  next : 3
  total : 4
  ----------
  previous : 4
  next : 5
  total : 9
  ----------
  previous : 9
  next : 7
  total : 16
  ----------
  previous : 16
  next : 9
  total : 25
  */
  final result = numbers.reduce((prev, next) => prev + next);

  print(result);

  List<String> words = [
    '안녕하세요',
    '저는',
    '입니다.',
  ];

  final sentence = words.reduce((prev, next) => prev + next);
  print(sentence);

  //reduce는 return과 List의 변수형이 같아야 한다.
  //words.reduce((prev, next)=> prev.length + next.length);
}
```

***

### fold
```dart
  List<int> numbers = [1, 3, 5, 7, 9];
  
  final sum = numbers.fold<int>(0, (prev, next) => prev + next);
  
  print(sum); //25
  
  List<String> words = [
    '안녕하세요',
    '저는',
    '입니다.',
  ];
  
  final sentence = words.fold<String>('', (prev, next)=>prev + next);
  print(sentence); //안녕하세요저는입니다.
  
  final count = words.fold<int>(0, (prev, next)=>prev + next.length);
  print(count); //11
```

***

### cascading operator
```dart
void main() {
  List<int> even = [2, 4, 6, 8];
  List<int> odd = [1, 3, 5, 7];
  
  // cascading operator
  // ...
  print([even, odd]);       // [[2, 4, 6, 8], [1, 3, 5, 7]]
  print([...even, ...odd]); // [2, 4, 6, 8, 1, 3, 5, 7]
}

```

***
