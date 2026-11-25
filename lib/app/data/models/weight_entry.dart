class WeightEntry {
  final double weight;
  final DateTime date;

  const WeightEntry({required this.weight, required this.date});

  Map<String, dynamic> toJson() => {
        'weight': weight,
        'date': date.toIso8601String(),
      };

  factory WeightEntry.fromJson(Map<String, dynamic> json) => WeightEntry(
        weight: (json['weight'] as num).toDouble(),
        date: DateTime.parse(json['date'] as String),
      );
}
