CREATE TABLE gym_data (
    age INT,
    gender VARCHAR(10),
    weight_kg DECIMAL,
    height_m DECIMAL,
    max_bpm INT,
    avg_bpm INT,
    resting_bpm INT,
    session_duration_hours DECIMAL,
    calories_burned INT,
    workout_type VARCHAR(50),
    fat_percentage DECIMAL,
    water_intake_liters DECIMAL,
    workout_frequency_days_week INT,
    experience_level INT,
    bmi DECIMAL
);

--Klasifikasi BMI Berdasarkan Gender
SELECT gender, 
       CASE 
           WHEN bmi < 18.5 THEN 'Underweight'
           WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal weight'
           WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
           WHEN bmi >= 30 THEN 'Obesity'
           ELSE 'Unknown' 
       END AS bmi_category
FROM gym_data;

--Workout Type Berdasarkan Gender
SELECT gender, workout_type, COUNT(*) AS workout_count
FROM gym_data
GROUP BY gender, workout_type
ORDER BY workout_count DESC;

--Workout Yang Paling Banyak Membakar Kalori Dan Fat
SELECT workout_type, SUM(calories_burned) AS total_calories_burned, SUM(fat_percentage) AS total_fat_burned
FROM gym_data
GROUP BY workout_type
ORDER BY total_calories_burned DESC;

--Workout Dengan rata-rata BPM tertinggi
SELECT workout_type, AVG(avg_bpm) AS average_bpm
FROM gym_data
GROUP BY workout_type
ORDER BY average_bpm DESC;

--Korelasi antara experience level dan average BPM
SELECT experience_level, AVG(avg_bpm) AS average_bpm
FROM gym_data
GROUP BY experience_level
ORDER BY experience_level;



