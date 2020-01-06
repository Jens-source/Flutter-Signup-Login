import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/widgets.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class UserManagement {


  storeNewUser(user, context) {
    Firestore.instance.collection('/users').add({
      'email': user.email,
      'uid': user.uid,
      'displayName': user.displayName,
      'photoUrl': user.photoUrl,
      'about': 'Empty',
      'firstName': 'Empty',
      'lastName': 'Empty',
      'phoneNumber': 'Empty',
      'location': 'Empty',
      'jobTitle': 'Empty',
      'desiredJobTypes': 'Empty',
      'desiredSalary': 'Empty',
      'relocatable': false,
      'degree': 'Empty',
      'school': 'Empty',
      'fieldOfStudy': 'Empty',
      'skills': 'Empty',
    }).then((value) {
    }).catchError((e) {
      print(e);
    });
  }



  Future updateProfilePicture(picUrl) async {
    var userInfo = new UserUpdateInfo();
    userInfo.photoUrl = picUrl;

    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .updateData({
            'photoUrl': picUrl
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        });
      }).catchError((e) {
        print(e);
      });
    });
  }

  static Future updateBrainstormPicture(id) async {
    var userInfo = new UserUpdateInfo();

    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
          .collection('brainstorms')
          .add({
            'brainstormId' : id,
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        });
      }).catchError((e) {
        print(e);
      });
    });
  }

  static Future updateBrainstormFriends(friendId, brainstormId) async {
    var userInfo = new UserUpdateInfo();

    await Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: friendId)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .collection('brainstorms')
              .add({
            'brainstormId' : brainstormId,
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        });
  }

  static Future updateProfilePictureFirst(picUrl) async {
    var userInfo = new UserUpdateInfo();
    userInfo.photoUrl = picUrl;

    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .updateData({
            'photoUrl': picUrl
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        });
      }).catchError((e) {
        print(e);
      });
    });
  }

  static Future updateAbout(about) async {
    var userInfo = new UserUpdateInfo();

    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .updateData({
            'about': about
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        }
        );
      });
    }
    );
  }



  static Future updateFirstName(firstName) async {
    var userInfo = new UserUpdateInfo();

    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .updateData({
            'firstName': firstName
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        }
        );
      });
    }
    );
  }

  static Future updateLastName(lastName) async {
    var userInfo = new UserUpdateInfo();

    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .updateData({
            'lastName': lastName
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        }
        );
      });
    }
    );
  }

  static Future updatePhoneNumber(phoneNumber) async {
    var userInfo = new UserUpdateInfo();

    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .updateData({
            'phoneNumber': phoneNumber
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        }
        );
      });
    }
    );
  }

  static Future updateLocation(location) async {
    var userInfo = new UserUpdateInfo();

    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .updateData({
            'location': location
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        }
        );
      });
    }
    );
  }

  static Future updateJobTitle(jobTitle) async {
    var userInfo = new UserUpdateInfo();

    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .updateData({
            'jobTitle': jobTitle
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        }
        );
      });
    }
    );
  }

  static Future updateDesiredJobTitles(desiredJobTitle) async {
    var userInfo = new UserUpdateInfo();

    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .updateData({
            'desiredJobTitle': desiredJobTitle
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        }
        );
      });
    }
    );
  }

  static Future updateDesiredSalary(desiredSalary) async {
    var userInfo = new UserUpdateInfo();

    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .updateData({
            'desiredSalary': desiredSalary
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        }
        );
      });
    }
    );
  }

  static Future updateReloacatable(relocatable) async {
    var userInfo = new UserUpdateInfo();

    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .updateData({
            'relocatable': relocatable
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        }
        );
      });
    }
    );
  }

  static Future updateEmail(email) async {
    var userInfo = new UserUpdateInfo();

    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .updateData({
            'email': email
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        }
        );
      });
    }
    );
  }

  static Future updateDegree(degree) async {
    var userInfo = new UserUpdateInfo();

    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .updateData({
            'degree': degree
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        }
        );
      });
    }
    );
  }

  static Future updateSchool(school) async {
    var userInfo = new UserUpdateInfo();

    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .updateData({
            'school': school
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        }
        );
      });
    }
    );
  }

  static Future updateNickName(displayName) async {
    var userInfo = new UserUpdateInfo();
    userInfo.displayName = displayName;


    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .updateData({
            'displayName': displayName
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        }
        );
      });
    }
    );
  }

static Future updateFieldOfStudy(fieldOfStudy) async {
  var userInfo = new UserUpdateInfo();

  await
  FirebaseAuth.instance.currentUser()
      .
  then
    ((val) {
    val.updateProfile(userInfo).then((user) {
      Firestore.instance
          .collection('/users')
          .where('uid', isEqualTo: val.uid)
          .getDocuments()
          .then((docs) {
        Firestore.instance.document('/users/${docs.documents[0].documentID}')
            .updateData({
          'fieldOfStudy': fieldOfStudy
        }).then((val) {
          print('Updated');
        }).catchError((e) {
          print(e);
        });
      }
      );
    });
  }
  );
}

  static Future updateSkills(skills) async {
    var userInfo = new UserUpdateInfo();

    await FirebaseAuth.instance.currentUser().then((val) {
      val.updateProfile(userInfo).then((user) {
        Firestore.instance
            .collection('/users')
            .where('uid', isEqualTo: val.uid)
            .getDocuments()
            .then((docs) {
          Firestore.instance.document('/users/${docs.documents[0].documentID}')
              .updateData({
            'skills': skills
          }).then((val) {
            print('Updated');
          }).catchError((e) {
            print(e);
          });
        }
        );
      });
    }
    );
  }
}



