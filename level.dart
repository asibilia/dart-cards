import 'dart:math' as math;

void main() {
//   Level lvl_one = new Level(1);
//   print(lvl_one);

//   Level lvl_two = new Level(2);
//   print(lvl_two);

//   Level lvl_three = new Level(3);
//   print(lvl_three);

//   print('-------------');

//   Experience playerXP = new Experience(0);

//   print('Player created!');
//   print('Player XP: ${playerXP}');
//   print('Player is level: ${playerXP.getLevel()}\n');

//   print('Player completes training!');
//   print('+200xp');

//   playerXP.addExperience(200);

//   print('Player XP: ${playerXP}');
//   print('Player is level: ${playerXP.getLevel()}\n');

//   print('Player completes training!');
//   print('+1200xp');
//   playerXP.addExperience(1200);

//   print('Player XP: ${playerXP}');
//   print('Player is level: ${playerXP.getLevel()}\n');

  User alec = new User(
      2200, 'Alec', 'Sibilia', 'sibilia.alec@gmail.com', 'http://image.com');

//   alec.addExperience(2200);

  print(alec);
}

class User extends Player {
  String firstName;
  String lastName;
  String email;
  String photoUrl;

  User(xp, this.firstName, this.lastName, this.email, this.photoUrl)
      : super(xp);

  @override
  toString() {
    return 'Name: $firstName $lastName\nEmail: $email\nPhoto URL: $photoUrl\nLevel: $level\nExperience: $xp';
  }
}

class Player extends Experience {
  int level;

  Player(xp) : super(xp) {
    this.level = super.getLevel();
  }
}

class Experience {
  int xp;

  @override
  toString() {
    return '$xp xp';
  }

  Experience(int xp) {
    this.xp = xp;
  }

  addExperience(int value) {
    this.xp += xp;
  }

  removeExperience(int value) {
    this.xp -= xp;
  }

  getLevel() {
    int userLevel = 1;
    int maxLevel = 100;

    while (userLevel <= maxLevel) {
      var isInLevel = new Level(userLevel).isInLevel(this.xp);

      if (isInLevel) {
        return userLevel;
      }

      userLevel++;
    }
  }
}

class Level {
  double exponent = 1.5;
  int baseXP = 1000;

  int currentLevel;
  int minXp;
  int maxXp;

  @override
  toString() {
    return 'Level: $currentLevel \nRange: $minXp -- $maxXp xp \n';
  }

  Level(int currentLevel) {
    this.currentLevel = currentLevel;
    this.minXp = this.setMinXp(currentLevel);
    this.maxXp = this.setMaxXp(currentLevel);
  }

  setMinXp(int level) {
    var newMaxXp =
        this.baseXP * math.pow((level - 1).toDouble(), this.exponent);
    return newMaxXp.floor();
  }

  setMaxXp(int level) {
    var newMaxXp = this.baseXP * math.pow(level.toDouble(), this.exponent);
    return newMaxXp.floor() - 1;
  }

  isInLevel(int xp) {
    if ((xp >= this.minXp) && (xp <= this.maxXp)) {
      return true;
    } else {
      return false;
    }
  }
}
