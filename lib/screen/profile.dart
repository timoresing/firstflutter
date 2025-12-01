import 'package:flutter/material.dart';
import 'package:firstflutter/components/profile_widget/menu_list.dart';
import 'package:firstflutter/screen/item_list.dart';
import 'package:firstflutter/services/auth_service.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios_rounded),
                      color: Colors.white,
                    ),
                    const Text(
                      'Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.mode_edit_rounded),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Container(
                          width: 99,
                          height: 99,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.asset('assets/images/profile-pic.png'),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Patra Rafles Wostyla Sinaga',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        Text(
                          'patrawoilah@students.usu.ac.id',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.6)
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: 372,
                          height: 68,
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 4,
                                    color: Colors.black.withOpacity(0.24)
                                )
                              ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset('assets/images/point.png')
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '9999',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20
                                    ),
                                  ),
                                  Text(
                                    'E-point',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.6)
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                              Container(
                                width: 2,
                                height: 46,
                                color: Colors.black.withOpacity(.6),
                              ),
                              Container(
                                height: 45,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xff009421),
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12)
                                        )
                                    ),
                                    child: Text(
                                        'Redeem Now!',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14
                                    )
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            child: ListView(
                              children: [
                                const SizedBox(height: 10),
                                MenuList(
                                    title: 'Transaction History',
                                    icon: Icon(Icons.history_rounded)
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ItemListScreen()
                                        )
                                    )
                                  },
                                  child: MenuList(
                                      title: 'Task',
                                      icon: Icon(Icons.task_alt_rounded)
                                  ),
                                ),
                                const SizedBox(height: 10),
                                MenuList(
                                    title: 'Leaderboard',
                                    icon: Icon(Icons.leaderboard_outlined)
                                ),
                                const SizedBox(height: 10),
                                MenuList(
                                    title: 'Notification',
                                    icon: Icon(Icons.notifications_active_outlined)
                                ),
                                const SizedBox(height: 10),
                                MenuList(
                                    title: 'Privacy Policy',
                                    icon: Icon(Icons.privacy_tip_outlined)
                                ),
                                const SizedBox(height: 10),
                                MenuList(
                                    title: 'My Medali',
                                    icon: Icon(Icons.stars_outlined)
                                ),
                                const SizedBox(height: 10),
                                MenuList(
                                    title: 'Change Password',
                                    icon: Icon(Icons.lock_outline_rounded)
                                ),
                                const SizedBox(height: 10),
                                MenuList(
                                    title: 'Help Centre',
                                    icon: Icon(Icons.help_outline_rounded)
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () async => await AuthService().signOut(),
                                  child: MenuList(
                                      title: 'Log Out',
                                      icon: Icon(Icons.login_rounded, color: Colors.red,)
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        )
    );
  }
}
