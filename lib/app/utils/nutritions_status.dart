class NutritionStatus {
  String status;
  String description;
  double heightRecommendation;

  NutritionStatus(this.status, this.description, this.heightRecommendation);

  static NutritionStatus calculate(double height, int age, String gender) {
    List<List<List<double>>> referenceHeights = [
      // Usia 0 bulan
      [
        // Jenis kelamin: Laki-laki
        [44.2, 46.1, 55.6],
        // Jenis kelamin: Perempuan
        [43.6, 45.4, 54.7],
      ],
      // Usia 1 bulan
      [
        // Jenis kelamin: Laki-laki
        [48.9, 50.8, 60.6],
        // Jenis kelamin: Perempuan
        [47.8, 49.8, 59.5],
      ],
      // Usia 2 bulan
      [
        // Jenis kelamin: Laki-laki
        [52.4, 54.4, 64.4],
        // Jenis kelamin: Perempuan
        [51, 53, 63.2],
      ],
      // Usia 3 bulan
      [
        // Jenis kelamin: Laki-laki
        [55.3, 57.3, 67.6],
        // Jenis kelamin: Perempuan
        [53.5, 55.6, 66.1],
      ],
      // Usia 4 bulan
      [
        // Jenis kelamin: Laki-laki
        [57.6, 59.7, 70.1],
        // Jenis kelamin: Perempuan
        [55.6, 57.8, 68.6],
      ],
      // Usia 5 bulan
      [
        // Jenis kelamin: Laki-laki
        [59.6, 61.7, 72.2],
        // Jenis kelamin: Perempuan
        [57.4, 59.6, 70.7],
      ],
      // Usia 6 bulan
      [
        // Jenis kelamin: Laki-laki
        [61.2, 63.3, 74],
        // Jenis kelamin: Perempuan
        [58.9, 61.2, 72.5],
      ],
      // Usia 7 bulan
      [
        // Jenis kelamin: Laki-laki
        [62.7, 64.8, 75.7],
        // Jenis kelamin: Perempuan
        [60.3, 62.7, 74.2],
      ],
      // Usia 8 bulan
      [
        // Jenis kelamin: Laki-laki
        [64, 66.2, 77.2],
        // Jenis kelamin: Perempuan
        [61.7, 64, 75.8],
      ],
      // Usia 9 bulan
      [
        // Jenis kelamin: Laki-laki
        [65.2, 67.5, 78.7],
        // Jenis kelamin: Perempuan
        [62.9, 65.3, 77.4],
      ],
      // Usia 10 bulan
      [
        // Jenis kelamin: Laki-laki
        [66.4, 68.7, 80.1],
        // Jenis kelamin: Perempuan
        [64.1, 66.5, 78.9],
      ],
      // Usia 11 bulan
      [
        // Jenis kelamin: Laki-laki
        [67.6, 69.9, 81.5],
        // Jenis kelamin: Perempuan
        [65.2, 67.7, 80.3],
      ],
      // Usia 12 bulan
      [
        // Jenis kelamin: Laki-laki
        [68.6, 71, 82.9],
        // Jenis kelamin: Perempuan
        [66.3, 68.9, 81.7],
      ],
      // Usia 13 bulan
      [
        // Jenis kelamin: Laki-laki
        [69.6, 72.1, 84.2],
        // Jenis kelamin: Perempuan
        [67.3, 70, 83.1],
      ],
      // Usia 14 bulan
      [
        // Jenis kelamin: Laki-laki
        [70.6, 73.1, 85.5],
        // Jenis kelamin: Perempuan
        [68.3, 71, 84.4],
      ],
      // Usia 15 bulan
      [
        // Jenis kelamin: Laki-laki
        [71.6, 74.1, 86.7],
        // Jenis kelamin: Perempuan
        [69.3, 72, 85.7],
      ],
      // Usia 16 bulan
      [
        // Jenis kelamin: Laki-laki
        [72.5, 75, 88],
        // Jenis kelamin: Perempuan
        [70.2, 73, 87],
      ],
      // Usia 17 bulan
      [
        // Jenis kelamin: Laki-laki
        [73.3, 76, 89.2],
        // Jenis kelamin: Perempuan
        [71.1, 74, 88.2],
      ],
      // Usia 18 bulan
      [
        // Jenis kelamin: Laki-laki
        [52.4, 54.4, 64.4],
        // Jenis kelamin: Perempuan
        [51.9, 53.0, 63.2],
      ],
      // Usia 19 bulan
      [
        // Jenis kelamin: Laki-laki
        [75, 77.7, 91.5],
        // Jenis kelamin: Perempuan
        [72.8, 75.8, 90.6],
      ],
      // Usia 20 bulan
      [
        // Jenis kelamin: Laki-laki
        [75.8, 78.6, 92.6],
        // Jenis kelamin: Perempuan
        [73.7, 76.7, 91.7],
      ],
      // Usia 21 bulan
      [
        // Jenis kelamin: Laki-laki
        [76.5, 79.4, 93.8],
        // Jenis kelamin: Perempuan
        [74.5, 77.5, 92.9],
      ],
      // Usia 22 bulan
      [
        // Jenis kelamin: Laki-laki
        [77.2, 80.2, 94.9],
        // Jenis kelamin: Perempuan
        [75.2, 78.4, 94],
      ],
      // Usia 23 bulan
      [
        // Jenis kelamin: Laki-laki
        [78, 81, 95.9],
        // Jenis kelamin: Perempuan
        [76, 79.2, 95],
      ],
      // Usia 24 bulan
      [
        // Jenis kelamin: Laki-laki
        [78.7, 81.7, 97],
        // Jenis kelamin: Perempuan
        [76.7, 80, 96.1],
      ],
      // Usia 25 bulan
      [
        // Jenis kelamin: Laki-laki
        [78.6, 81.7, 97.3],
        // Jenis kelamin: Perempuan
        [76.8, 80, 96.4],
      ],
      // Usia 26 bulan
      [
        // Jenis kelamin: Laki-laki
        [79.3, 82.5, 98.3],
        // Jenis kelamin: Perempuan
        [77.5, 80.8, 97.4],
      ],
      // Usia 27 bulan
      [
        // Jenis kelamin: Laki-laki
        [79.9, 83.1, 99.3],
        // Jenis kelamin: Perempuan
        [78.1, 81.5, 98.4],
      ],
      // Usia 28 bulan
      [
        // Jenis kelamin: Laki-laki
        [80.5, 83.8, 100.3],
        // Jenis kelamin: Perempuan
        [78.8, 82.2, 99.4],
      ],
      // Usia 29 bulan
      [
        // Jenis kelamin: Laki-laki
        [81.1, 84.5, 101.2],
        // Jenis kelamin: Perempuan
        [79.5, 82.9, 100.3],
      ],
      // Usia 30 bulan
      [
        // Jenis kelamin: Laki-laki
        [81.7, 85.1, 102.1],
        // Jenis kelamin: Perempuan
        [80.1, 83.6, 101.3],
      ],
      // Usia 31 bulan
      [
        // Jenis kelamin: Laki-laki
        [82.3, 85.7, 103],
        // Jenis kelamin: Perempuan
        [80.7, 84.3, 102.2],
      ],
      // Usia 32 bulan
      [
        // Jenis kelamin: Laki-laki
        [82.8, 86.4, 103.9],
        // Jenis kelamin: Perempuan
        [81.3, 84.9, 103.1],
      ],
      // Usia 33 bulan
      [
        // Jenis kelamin: Laki-laki
        [83.4, 86.9, 104.8],
        // Jenis kelamin: Perempuan
        [81.9, 85.6, 103.9],
      ],
      // Usia 34 bulan
      [
        // Jenis kelamin: Laki-laki
        [83.9, 87.5, 105.6],
        // Jenis kelamin: Perempuan
        [82.5, 86.2, 104.8],
      ],
      // Usia 35 bulan
      [
        // Jenis kelamin: Laki-laki
        [84.4, 88.1, 106.4],
        // Jenis kelamin: Perempuan
        [83.1, 86.8, 105.6],
      ],
      // Usia 36 bulan
      [
        // Jenis kelamin: Laki-laki
        [85, 88.7, 107.2],
        // Jenis kelamin: Perempuan
        [83.6, 87.4, 106.5],
      ],
      // Usia 37 bulan
      [
        // Jenis kelamin: Laki-laki
        [85.5, 89.2, 108],
        // Jenis kelamin: Perempuan
        [84.2, 88, 107.3],
      ],
      // Usia 38 bulan
      [
        // Jenis kelamin: Laki-laki
        [86, 89.8, 108.8],
        // Jenis kelamin: Perempuan
        [84.7, 88.6, 108.1],
      ],
      // Usia 39 bulan
      [
        // Jenis kelamin: Laki-laki
        [86.5, 90.3, 109.5],
        // Jenis kelamin: Perempuan
        [85.3, 89.2, 108.9],
      ],
      // Usia 40 bulan
      [
        // Jenis kelamin: Laki-laki
        [87, 90.9, 110.3],
        // Jenis kelamin: Perempuan
        [85.8, 89.8, 109.7],
      ],
      // Usia 41 bulan
      [
        // Jenis kelamin: Laki-laki
        [87.5, 91.4, 111],
        // Jenis kelamin: Perempuan
        [86.3, 90.4, 110.5],
      ],
      // Usia 42 bulan
      [
        // Jenis kelamin: Laki-laki
        [88, 91.9, 111.7],
        // Jenis kelamin: Perempuan
        [86.8, 90.9, 111.2],
      ],
      // Usia 43 bulan
      [
        // Jenis kelamin: Laki-laki
        [88.4, 92.4, 112.5],
        // Jenis kelamin: Perempuan
        [87.4, 91.5, 112],
      ],
      // Usia 44 bulan
      [
        // Jenis kelamin: Laki-laki
        [88.9, 93, 113.2],
        // Jenis kelamin: Perempuan
        [87.9, 92, 112.7],
      ],
      // Usia 45 bulan
      [
        // Jenis kelamin: Laki-laki
        [89.4, 93.5, 113.9],
        // Jenis kelamin: Perempuan
        [88.4, 92.5, 113.5],
      ],
      // Usia 46 bulan
      [
        // Jenis kelamin: Laki-laki
        [89.8, 94, 114.6],
        // Jenis kelamin: Perempuan
        [88.9, 93.1, 114.2],
      ],
      // Usia 47 bulan
      [
        // Jenis kelamin: Laki-laki
        [90.3, 94.4, 115.2],
        // Jenis kelamin: Perempuan
        [89.3, 93.6, 114.9],
      ],
      // Usia 48 bulan
      [
        // Jenis kelamin: Laki-laki
        [90.7, 94.9, 115.9],
        // Jenis kelamin: Perempuan
        [89.8, 94.1, 115.7],
      ],
      // Usia 49 bulan
      [
        // Jenis kelamin: Laki-laki
        [91.2, 95.4, 116.6],
        // Jenis kelamin: Perempuan
        [90.3, 94.6, 116.4],
      ],
      // Usia 50 bulan
      [
        // Jenis kelamin: Laki-laki
        [91.6, 95.9, 117.3],
        // Jenis kelamin: Perempuan
        [90.7, 95.1, 117.1],
      ],
      // Usia 51 bulan
      [
        // Jenis kelamin: Laki-laki
        [92.1, 96.4, 117.9],
        // Jenis kelamin: Perempuan
        [91.2, 95.6, 117.7],
      ],
      // Usia 52 bulan
      [
        // Jenis kelamin: Laki-laki
        [92.5, 96.9, 118.6],
        // Jenis kelamin: Perempuan
        [91.7, 96.1, 118.4],
      ],
      // Usia 53 bulan
      [
        // Jenis kelamin: Laki-laki
        [93, 97.4, 119.2],
        // Jenis kelamin: Perempuan
        [92.1, 96.6, 119.1],
      ],
      // Usia 54 bulan
      [
        // Jenis kelamin: Laki-laki
        [93.4, 97.8, 119.9],
        // Jenis kelamin: Perempuan
        [92.6, 97.1, 119.8],
      ],
      // Usia 55 bulan
      [
        // Jenis kelamin: Laki-laki
        [93.9, 98.3, 120.6],
        // Jenis kelamin: Perempuan
        [93, 97.6, 120.4],
      ],
      // Usia 56 bulan
      [
        // Jenis kelamin: Laki-laki
        [94.3, 98.8, 121.2],
        // Jenis kelamin: Perempuan
        [93.4, 98.1, 121.1],
      ],
      // Usia 57 bulan
      [
        // Jenis kelamin: Laki-laki
        [94.7, 99.3, 121.9],
        // Jenis kelamin: Perempuan
        [93.9, 98.5, 121.8],
      ],
      // Usia 58 bulan
      [
        // Jenis kelamin: Laki-laki
        [95.2, 99.7, 122.6],
        // Jenis kelamin: Perempuan
        [94.3, 99, 122.4],
      ],
      // Usia 59 bulan
      [
        // Jenis kelamin: Laki-laki
        [95.6, 100.2, 123.2],
        // Jenis kelamin: Perempuan
        [94.7, 99.5, 123.1],
      ],
      // Usia 60 bulan
      [
        // Jenis kelamin: Laki-laki
        [96.1, 100.7, 123.9],
        // Jenis kelamin: Perempuan
        [95.2, 99.9, 123.7],
      ],

      // lakukan penambahan data referensi sesuai kebutuhan
    ];

    int ageIndex = age.toInt();
    int genderIndex = (gender == 'Male') ? 0 : 1;

    List<double> referenceHeight = referenceHeights[ageIndex][genderIndex];

    if (height < referenceHeight[0]) {
      return NutritionStatus(
          'Sangat Pendek',
          'Perlu perbaikan gizi dengan makanan sehat dan bergizi. Konsultasikan segera dengan dokter di pusat kesehatan terdekat.',
          referenceHeight[2]);
    } else if (height < referenceHeight[1]) {
      return NutritionStatus(
          'Pendek',
          'Perlu perbaikan gizi dengan makanan sehat dan bergizi.',
          referenceHeight[2]);
    } else if (height <= referenceHeight[2]) {
      return NutritionStatus(
          'Normal',
          'Tetap pertahankan dengan memberi makanan sehat dan bergizi.',
          referenceHeight[2]);
    } else {
      return NutritionStatus(
          'Tinggi',
          'Tetap pertahankan dengan memberi makanan sehat dan bergizi.',
          referenceHeight[2]);
    }
  }
}
