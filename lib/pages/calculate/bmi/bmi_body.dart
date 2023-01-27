import 'package:bmi_app/components/calculate_button.dart';
import 'package:bmi_app/components/gender.dart';
import 'package:bmi_app/components/textfield_number.dart';
import 'package:bmi_app/pages/calculate/bmi/bmi_result_page.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController heightController = TextEditingController();

  TextEditingController weightController = TextEditingController();
  int currentIndex = 0;
  late double hasil;
  late String kondisi, info, condition, risk, saran;
  late Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: Text(
                    "BMI Calculator",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GenderSection(
                  currentIndex: currentIndex,
                  onChange: (valueGender) {
                    this.currentIndex = valueGender;
                  },
                ),
                Column(
                  children: [
                    TextFieldNumber(
                      text: "Weight",
                      controller: this.weightController,
                      spress: () {
                        double valueWeight =
                            double.parse(this.weightController.text);
                        valueWeight++;
                        this.weightController.text = valueWeight.toString();
                      },
                      ppress: () {
                        double valueWeight =
                            double.parse(this.weightController.text);
                        valueWeight--;
                        this.weightController.text = valueWeight.toString();
                      },
                      hint: 'in kg/kilogram',
                    ),
                    TextFieldNumber(
                      text: "Height",
                      controller: this.heightController,
                      spress: () {
                        double valueHeight =
                            double.parse(this.heightController.text);
                        valueHeight++;
                        this.heightController.text = valueHeight.toString();
                      },
                      ppress: () {
                        double valueHeight =
                            double.parse(this.heightController.text);
                        valueHeight--;
                        this.heightController.text = valueHeight.toString();
                      },
                      hint: 'in cm/centimeter',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CalculateButton(
            onPress: () async {
              // if (weightController.text == 0.0.toString() ||
              //     heightController.text == 0.0.toString()) {
              //   SnackBar(
              //     duration: Duration(seconds: 60),
              //     content: Text("Please fill Height and Weight section."),
              //     action: SnackBarAction(
              //       label: "dismiss",
              //       onPressed: () {},
              //     ),
              //   );
              // }

              if (currentIndex == 0) {
                hasil = double.parse(weightController.text) /
                    (double.parse(heightController.text) /
                        100 *
                        double.parse(heightController.text) /
                        100);
                if (hasil <= 18.5) {
                  kondisi = "Underweight";
                  color = Colors.blueGrey;
                  info = "(BMI under 18.5)";
                  condition =
                      "A BMI value below 18.5 means you are underweight";
                  risk =
                      "Based on research results from the United Kingdom National Health Service, when your body weight is lower than the ideal weight, you also have a risk of certain diseases due to nutritional deficiencies and a weak immune system. This opens up opportunities for the following health risks:\n– Malnutrition.\n– Anemia.\n– Osteoporosis due to deficiency of calcium and vitamin D.\n– Fertility problems from irregular menstrual cycles.\n– Higher risk of surgical complications .\n– Restricted growth and development problems in children and adolescents.";
                  saran =
                      "If you want to gain weight, you need to know in advance how many calories your body needs per day. In order for the body to get the maximum source of energy for activities. Gaining weight must increase muscle mass not increase fat mass. The proportion of food must be considered, not only calories, but also macronutrients (carbohydrates, proteins, fats) and micro (vitamins and minerals). You can also do regular exercise so that the muscles are formed optimally. You can increase your calorie intake by 300-500 kcal per day. For example, if your total daily calorie requirement is 1700 kcal. That is, you need to consume food with a total of 1700 500 = 2200 kcal per day. To find out how many calories you need each day, check the Calorie Requirement Calculator at Hello Sehat";
                } else if (hasil >= 18.6 && hasil <= 22.9) {
                  kondisi = "Normal";
                  color = Colors.blueGrey;
                  info = "(BMI 18.6 to 22.9)";
                  condition =
                      "If your body mass index value is 18.5 to 24.9, it means you have normal weight.";
                  risk =
                      "People with normal body mass index values may still be at risk for certain diseases. However, the risk is lower than people with abnormal BMI values. \nPeople with normal BMI can also have a high fat percentage, so it must be calculated body fat and metabolic conditions. In order to prevent various chronic diseases, it is important to maintain a healthy lifestyle, starting from a good diet, exercise, and regular health checks.";
                  saran =
                      "If you want to maintain your weight, it's important to know how many calories you need per day, so that the body is able to perform its functions in daily activities. You need to consume food and drinks with a daily number of calories that suit your body's needs. \nFor example, if your daily calorie requirement is 1950 kcal, make sure you consume food and drinks that match that calorie value. Don't forget to use the principle of balanced nutrition. That way, all the types of nutrients the body needs will be fulfilled properly.";
                } else if (hasil >= 23 && hasil <= 29.9) {
                  kondisi = "Overweight";
                  color = Colors.blueGrey;
                  info = "(BMI 23 to 29.9)";
                  condition =
                      "You are considered overweight if your body mass index (BMI) is 25.0-29.9.";
                  risk =
                      "According to the Centers for Disease Control (CDC), being overweight can increase the risk of type 2 diabetes, hypertension, heart problems, stroke, osteoarthritis, fatty liver, kidney disease, and certain types of cancer.";
                  saran =
                      "Jika ingin menurunkan berat badan, ketahui dulu berapa banyak kalori yang Anda butuhkan per hari untuk menjalankan fungsi dasar tubuh dan aktivitas sehari-hari. Penting juga untuk mengetahui bagaimana kondisi kesehatan Anda saat ini, karena hal ini akan memengaruhi perhitungan kalori harian.\nSelanjutnya, lihat label informasi nilai gizi pada produk, catat berapa kalori yang akan dikonsumsi. Sesuaikan dengan jumlah kalori yang sudah dikurangi sebelumnya dari total kebutuhan kalori harian. konsumsi makanan dan minuman dengan kandungan kalori yang lebih sedikit dari kebutuhan harian.\nMisalnya, jika kebutuhan asupan kalori Anda 2100 kkal per hari, usahakan untuk mengurangi jumlahnya sekitar 300-500 kkal. Biasanya Anda akan dianjurkan untuk mengurangi kalori harian sebanyak 5-15% dari kebutuhan sebelumnya.\nHal ini tergantung dengan kondisi kesehatan dan kemampuan tubuh Anda. Program menurunkan berat badan ini harus dilakukan bertahap dengan memantau kondisi tubuh. Rata-rata dengan mengurangi 500 Kkal per hari, maka penurunan berat badan yang dihasilkan per minggu sekitar 500 gram sampai 1 kilogram.\nTujuan dari program ini adalah menurunkan massa lemak dan meningkatkan metabolisme tubuh. Berapa kebutuhan kalori minimum setiap orang? Hal ini tergantung dengan perhitungan metabolisme basal. Setiap orang akan berbeda, karena banyak faktor yang memengaruhi hal ini, dari kondisi kesehatan, usia, jenis kelamin, berat badan, tinggi badan, dan aktivitas fisik. Oleh karena sangat subjektif, konsultasikan hal ini pada pakar diet atau nutrisionis.\nMeski begitu, rata-rata seorang wanita butuh 2.000 Kkal per hari. Sementara rata-rata kebutuhan kalori pria berkisar 2.500 Kkal per hari. Namun setiap orang membutuhkan minimal 1200 kkal per hari untuk menjaga fungsi tubuh. Mengonsumsi kurang dari 1.200 kkal per hari akan berdampak buruk bagi kesehatan tubuh.";
                } else if (hasil >= 30) {
                  kondisi = "Obecity";
                  color = Colors.red;
                  info = "(BMI above 30)";
                  condition =
                      "You have obesity, if your BMI is between 30-34.9.";
                  risk =
                      "Obesity has an effect on the body, increasing the risk of death, and developing certain health conditions, such as:\n– Type 2 diabetes\n– High LDL cholesterol, low HDL cholesterol, or unhealthy blood lipid levels\n– Coronary heart disease\n – Stroke\n– Gallbladder disease\n– Osteoarthritis\n– Sleep apnea and breathing problems\n– Chronic inflammation and increased oxidative stress\n– Cancer\n– Clinical depression, anxiety and other mental health conditions";
                  saran =
                      "If you want to lose weight, first know how many calories you need per day to carry out basic body functions and daily activities. It's also important to know your current health condition, because this will affect your daily calorie calculation. Next, look at the nutritional value information label on the product, note how many calories will be consumed. Adjust to the number of calories that have been previously reduced from the total daily calorie needs. consume foods and drinks with fewer calories than daily needs. For example, if your calorie intake needs are 2100 kcal per day, try to reduce the amount by around 300-500 kcal. Usually you will be advised to reduce daily calories by 5-15% of your previous needs. This depends on your health condition and body's ability. This weight loss program must be carried out gradually by monitoring the condition of the body. On average, by reducing 500 Kcal per day, the resulting weight loss per week is around 500 grams to 1 kilogram. The goal of this program is to reduce fat mass and increase body metabolism. What is the minimum calorie requirement for each person? This depends on the calculation of basal metabolism. Everyone will be different, because many factors influence this, from health conditions, age, gender, weight, height, and physical activity. Because it is very subjective, consult this with a dietitian or nutritionist. Even so, the average woman needs 2000 Kcal per day. Meanwhile, the average calorie requirement for men is around 2500 Kcal per day. But everyone needs a minimum of 1200 kcal per day to maintain body functions. Consuming less than 1200 kcal per day will be bad for the health of the body.";
                } else {
                  kondisi = "Berat badan belum ditentukan";
                  color = Colors.white;
                  condition = "";
                  risk = "";
                  saran = "";
                }
              } else {
                hasil = double.parse(weightController.text) /
                    (double.parse(heightController.text) /
                        100 *
                        double.parse(heightController.text) /
                        100);
                if (hasil <= 18.5) {
                  kondisi = "Underweight";
                  color = Colors.blueGrey;
                  info = "(BMI under 18.5)";
                  condition =
                      "A BMI value below 18.5 means you are underweight";
                  risk =
                      "Based on research results from the United Kingdom National Health Service, when your body weight is lower than the ideal weight, you also have a risk of certain diseases due to nutritional deficiencies and a weak immune system. This opens up opportunities for the following health risks:\n– Malnutrition.\n– Anemia.\n– Osteoporosis due to deficiency of calcium and vitamin D.\n– Fertility problems from irregular menstrual cycles.\n– Higher risk of surgical complications .\n– Restricted growth and development problems in children and adolescents.";
                  saran =
                      "If you want to gain weight, you need to know in advance how many calories your body needs per day. In order for the body to get the maximum source of energy for activities. Gaining weight must increase muscle mass not increase fat mass. The proportion of food must be considered, not only calories, but also macronutrients (carbohydrates, proteins, fats) and micro (vitamins and minerals). You can also do regular exercise so that the muscles are formed optimally. You can increase your calorie intake by 300-500 kcal per day. For example, if your total daily calorie requirement is 1700 kcal. That is, you need to consume food with a total of 1700 500 = 2200 kcal per day. To find out how many calories you need each day, check the Calorie Requirement Calculator at Hello Sehat";
                } else if (hasil >= 18.6 && hasil <= 25) {
                  kondisi = "Normal";
                  color = Colors.blueGrey;
                  info = "(BMI 18.6 to 25)";
                  condition =
                      "If your body mass index value is 18.5 to 24.9, it means you have normal weight.";
                  risk =
                      "People with normal body mass index values may still be at risk for certain diseases. However, the risk is lower than people with abnormal BMI values. \nPeople with normal BMI can also have a high fat percentage, so it must be calculated body fat and metabolic conditions. In order to prevent various chronic diseases, it is important to maintain a healthy lifestyle, starting from a good diet, exercise, and regular health checks.";
                  saran =
                      "If you want to maintain your weight, it's important to know how many calories you need per day, so that the body is able to perform its functions in daily activities. You need to consume food and drinks with a daily number of calories that suit your body's needs. \nFor example, if your daily calorie requirement is 1950 kcal, make sure you consume food and drinks that match that calorie value. Don't forget to use the principle of balanced nutrition. That way, all the types of nutrients the body needs will be fulfilled properly.";
                } else if (hasil >= 25.1 && hasil <= 27) {
                  kondisi = "Overweight";
                  color = Colors.blueGrey;
                  info = "(BMI 25.1 to 27)";
                  condition =
                      "You are considered overweight if your body mass index (BMI) is 25.0-29.9.";
                  risk =
                      "According to the Centers for Disease Control (CDC), being overweight can increase the risk of type 2 diabetes, hypertension, heart problems, stroke, osteoarthritis, fatty liver, kidney disease, and certain types of cancer.";
                  saran =
                      "Jika ingin menurunkan berat badan, ketahui dulu berapa banyak kalori yang Anda butuhkan per hari untuk menjalankan fungsi dasar tubuh dan aktivitas sehari-hari. Penting juga untuk mengetahui bagaimana kondisi kesehatan Anda saat ini, karena hal ini akan memengaruhi perhitungan kalori harian.\nSelanjutnya, lihat label informasi nilai gizi pada produk, catat berapa kalori yang akan dikonsumsi. Sesuaikan dengan jumlah kalori yang sudah dikurangi sebelumnya dari total kebutuhan kalori harian. konsumsi makanan dan minuman dengan kandungan kalori yang lebih sedikit dari kebutuhan harian.\nMisalnya, jika kebutuhan asupan kalori Anda 2100 kkal per hari, usahakan untuk mengurangi jumlahnya sekitar 300-500 kkal. Biasanya Anda akan dianjurkan untuk mengurangi kalori harian sebanyak 5-15% dari kebutuhan sebelumnya.\nHal ini tergantung dengan kondisi kesehatan dan kemampuan tubuh Anda. Program menurunkan berat badan ini harus dilakukan bertahap dengan memantau kondisi tubuh. Rata-rata dengan mengurangi 500 Kkal per hari, maka penurunan berat badan yang dihasilkan per minggu sekitar 500 gram sampai 1 kilogram.\nTujuan dari program ini adalah menurunkan massa lemak dan meningkatkan metabolisme tubuh. Berapa kebutuhan kalori minimum setiap orang? Hal ini tergantung dengan perhitungan metabolisme basal. Setiap orang akan berbeda, karena banyak faktor yang memengaruhi hal ini, dari kondisi kesehatan, usia, jenis kelamin, berat badan, tinggi badan, dan aktivitas fisik. Oleh karena sangat subjektif, konsultasikan hal ini pada pakar diet atau nutrisionis.\nMeski begitu, rata-rata seorang wanita butuh 2.000 Kkal per hari. Sementara rata-rata kebutuhan kalori pria berkisar 2.500 Kkal per hari. Namun setiap orang membutuhkan minimal 1200 kkal per hari untuk menjaga fungsi tubuh. Mengonsumsi kurang dari 1.200 kkal per hari akan berdampak buruk bagi kesehatan tubuh.";
                } else if (hasil >= 28) {
                  kondisi = "Obecity";
                  color = Colors.red;
                  info = "(BMI above 28)";
                  condition =
                      "You have obesity, if your BMI is between 30-34.9.";
                  risk =
                      "Obesity has an effect on the body, increasing the risk of death, and developing certain health conditions, such as:\n– Type 2 diabetes\n– High LDL cholesterol, low HDL cholesterol, or unhealthy blood lipid levels\n– Coronary heart disease\n – Stroke\n– Gallbladder disease\n– Osteoarthritis\n– Sleep apnea and breathing problems\n– Chronic inflammation and increased oxidative stress\n– Cancer\n– Clinical depression, anxiety and other mental health conditions";
                  saran =
                      "If you want to lose weight, first know how many calories you need per day to carry out basic body functions and daily activities. It's also important to know your current health condition, because this will affect your daily calorie calculation. Next, look at the nutritional value information label on the product, note how many calories will be consumed. Adjust to the number of calories that have been previously reduced from the total daily calorie needs. consume foods and drinks with fewer calories than daily needs. For example, if your calorie intake needs are 2100 kcal per day, try to reduce the amount by around 300-500 kcal. Usually you will be advised to reduce daily calories by 5-15% of your previous needs. This depends on your health condition and body's ability. This weight loss program must be carried out gradually by monitoring the condition of the body. On average, by reducing 500 Kcal per day, the resulting weight loss per week is around 500 grams to 1 kilogram. The goal of this program is to reduce fat mass and increase body metabolism. What is the minimum calorie requirement for each person? This depends on the calculation of basal metabolism. Everyone will be different, because many factors influence this, from health conditions, age, gender, weight, height, and physical activity. Because it is very subjective, consult this with a dietitian or nutritionist. Even so, the average woman needs 2000 Kcal per day. Meanwhile, the average calorie requirement for men is around 2500 Kcal per day. But everyone needs a minimum of 1200 kcal per day to maintain body functions. Consuming less than 1200 kcal per day will be bad for the health of the body.";
                } else {
                  kondisi = "Berat badan belum ditentukan";
                  color = Colors.white;
                  condition = "";
                  risk = "";
                  saran = "";
                }
              }

              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BmiResult(
                        value: kondisi,
                        valueNumber: hasil.toStringAsFixed(1),
                        color: color,
                        valueInfo: info,
                        condition: condition,
                        risk: risk,
                        saran: saran,
                      )));

              hasil = 0;
              this.heightController.text = "";
              this.weightController.text = "";
              currentIndex = 0;
              setState(() {});
            },
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
