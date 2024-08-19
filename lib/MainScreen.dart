import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 40, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 10),
        const Text(
          'Good morning Alex',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 20),
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/avatar.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottom(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              _buildForm(),
              const SizedBox(height: 20),
              _buildSearchField(),
              const SizedBox(height: 20),
              _buildWhatDoYouNeedText(),
              const SizedBox(height: 20),
              _buildIconGrid(), // Adding the icon grid widget here
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.green,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text content on the left side
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Until',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const Text(
                  '20 April - 30 May',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '30%',
                  style: TextStyle(
                    color: Colors.yellowAccent,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '!Discount',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          // Image on the right side
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: Image.asset(
              "assets/images/boy.webp",
              width: 120,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search for...',
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildWhatDoYouNeedText() {
    return const Text(
      'What do you need?',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildIconGrid() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 4, // Number of columns in the grid
        crossAxisSpacing: 10, // Horizontal space between items
        mainAxisSpacing: 10, // Vertical space between items
        children: [
          _buildIconWithLabel(Icons.email, 'Inbox'),
          _buildIconWithLabel(Icons.map, 'Maps'),
          _buildIconWithLabel(Icons.chat, 'Chats'),
          _buildIconWithLabel(Icons.bar_chart, 'Report'),
          _buildIconWithLabel(Icons.calendar_today, 'Calendar'),
          _buildIconWithLabel(Icons.lightbulb, 'Tips'),
          _buildIconWithLabel(Icons.settings, 'Settings'),
          _buildIconWithLabel(Icons.more_horiz, 'More'),
        ],
      ),
    );
  }

  Widget _buildIconWithLabel(IconData iconData, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 30,
          child: Icon(
            iconData,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
