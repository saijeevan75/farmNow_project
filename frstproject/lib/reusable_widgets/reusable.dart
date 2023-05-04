import 'package:flutter/material.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 200,
    color: Colors.white,
  );
}

Image logoWidgetDrawer(String imageName, double width, double height) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: width,
    height: height,
    color: Colors.white,
  );
}

Image logofarmdetails(String imageName, double width, double height) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: width,
    height: height,
    color: Colors.green[800],
  );
}

TextFormField reusableTextFieldSignUp(String text, IconData icon,
    bool isPasswordType, TextEditingController controller, String type) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    validator: (value) {
      if (type == "password") {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return "*Password cannot be empty";
        }
        if (!regex.hasMatch(value)) {
          return ("*Please enter valid password min. 6 character");
        } else {
          return null;
        }
      }
    },
    onChanged: (value) {},
  );
}

TextFormField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 17.0),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

//farmdetails
TextField farmdetailsfield(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 15),
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0.3, color: Colors.green),
            borderRadius: BorderRadius.circular(15)),
        fillColor: Colors.green,
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container pageButton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: (MediaQuery.of(context).size.width) / 2.5,
    height: 40,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        isLogin ? "Log In" : "Sign Up",
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    ),
  );
}

TextFormField reusableTextFieldEmail(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 15),
    decoration: InputDecoration(
        errorStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.3, color: Colors.green),
            borderRadius: BorderRadius.circular(15)),
        fillColor: Colors.white.withOpacity(0.3),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    validator: (value) {
      if (value!.length == 0) {
        return "*Email cannot be empty";
      }
      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
        return ("*Please enter a valid email");
      } else {
        return null;
      }
    },
    onChanged: (value) {},
  );
}

TextFormField reusableTextFieldPassword(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 15),
    decoration: InputDecoration(
        errorStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.3, color: Colors.green),
            borderRadius: BorderRadius.circular(15)),
        fillColor: Colors.white.withOpacity(0.3),
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    validator: (value) {
      RegExp regex = new RegExp(r'^.{6,}$');
      if (value!.isEmpty) {
        return "*Password cannot be empty";
      }
      if (!regex.hasMatch(value)) {
        return ("*Please enter valid password min. 6 character");
      } else {
        return null;
      }
    },
    onChanged: (value) {},
  );
}

TextFormField reusableTextFieldPhNo(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 15),
    decoration: InputDecoration(
        errorStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.3, color: Colors.green),
            borderRadius: BorderRadius.circular(15)),
        fillColor: Colors.white.withOpacity(0.3),
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    validator: (value) {
      RegExp regex = new RegExp(r'^\d{10}$');
      if (value!.isEmpty) {
        return "*PhNo cannot be empty";
      }
      if (!regex.hasMatch(value)) {
        return ("*Please enter a valid phone number");
      } else {
        return null;
      }
    },
    onChanged: (value) {},
  );
}

TextFormField reusableTextFieldPhNoFF(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(
      color: Colors.white.withOpacity(0.9),
      fontSize: 15,
    ),
    decoration: InputDecoration(
        errorStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.3, color: Colors.green),
            borderRadius: BorderRadius.circular(15)),
        fillColor: Colors.green[800],
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    // validator: (value) {
      
    //   RegExp regex = new RegExp(r'^\d{10}$');
    //   if (value!.isEmpty) {
    //     return "*Price cannot be empty";
    //   }
    //   if (!regex.hasMatch(value)) {
    //     return ("*Please enter a valid price");
    //   } else {
    //     return null;
    //   }
    // },
    // onChanged: (value) {},
  );
}

TextFormField reusableTextFieldName(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 15),
    decoration: InputDecoration(
        errorStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.3, color: Colors.green),
            borderRadius: BorderRadius.circular(15)),
        fillColor: Colors.white.withOpacity(0.3),
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    validator: (value) {
      RegExp regex = new RegExp(r'^\d{10}$');
      if (value!.isEmpty) {
        return "*Name cannot be empty";
      }
      else if(!RegExp(r'^[a-zA-Z\s]*$').hasMatch(value)){
        return '*Should only contain letters';
      }
    },
    onChanged: (value) {},
  );
}

TextFormField reusableTextFieldNameFF(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 15),
    decoration: InputDecoration(
        errorStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.3, color: Colors.green),
            borderRadius: BorderRadius.circular(15)),
        fillColor: Colors.green[800],
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    validator: (value) {
      RegExp regex = new RegExp(r'^\d{10}$');
      if (value!.isEmpty) {
        return "*Name cannot be empty";
      }
      else if(!RegExp(r'^[a-zA-Z\s]*$').hasMatch(value)){
        return '*Should only contain letters';
      }
    },
    onChanged: (value) {},
  );
}

TextFormField reusableTextFieldRePassword(
    String text,
    IconData icon,
    bool isPasswordType,
    TextEditingController precontroller,
    TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 15),
    decoration: InputDecoration(
        errorStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.3, color: Colors.green),
            borderRadius: BorderRadius.circular(15)),
        fillColor: Colors.white.withOpacity(0.3),
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    validator: (value) {
      if (precontroller.text != controller.text) {
        return "*Password did not match";
      } else if (value!.isEmpty) {
        return "*Password caanot be empty";
      } else {
        return null;
      }
    },
    onChanged: (value) {},
  );
}
