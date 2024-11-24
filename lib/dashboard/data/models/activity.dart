class Activity {
  const Activity({
    required this.time,
    required this.duration,
    required this.title,
    required this.location,
    required this.spots,
    required this.price,
    required this.category,
    this.available = true,
  });

  final String time;
  final String duration;
  final String title;
  final String location;
  final int spots;
  final String price;
  final String category;
  final bool available;

  Activity copyWith({
    String? time,
    String? duration,
    String? title,
    String? location,
    int? spots,
    String? price,
    String? category,
    bool? available,
  }) =>
      Activity(
        time: time ?? this.time,
        duration: duration ?? this.duration,
        title: title ?? this.title,
        location: location ?? this.location,
        spots: spots ?? this.spots,
        price: price ?? this.price,
        category: category ?? this.category,
        available: available ?? this.available,
      );
}

const activities = [
  Activity(
    time: '10:00 AM',
    duration: '60',
    title: 'Morning Yoga Session',
    location: 'Fitness Center Jakarta',
    spots: 8,
    price: '25',
    category: 'Sports',
    available: true,
  ),
  Activity(
    time: '2:00 PM',
    duration: '90',
    title: 'Basketball Training',
    location: 'Sports Hall Kemang',
    spots: 12,
    price: '30',
    category: 'Sports',
    available: false,
  ),
  Activity(
    time: '4:30 PM',
    duration: '45',
    title: 'Kids Art Class',
    location: 'Creative Studio Senayan',
    spots: 5,
    price: '20',
    category: 'Kids',
    available: true,
  ),
  Activity(
    time: '7:00 PM',
    duration: '120',
    title: 'Evening Dance Workshop',
    location: 'Dance Studio BSD',
    spots: 15,
    price: '35',
    category: 'Creative',
    available: true,
  ),
];
