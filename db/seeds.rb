require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
Student.create(email: 'student@example.com', password: 'password', password_confirmation: 'password', full_name: 'Nguyen Van A')
Staff.create(email: 'staff@example.com',  password: 'password', password_confirmation: 'password', role: :creator, first_name: 'B', last_name: 'Nguyen Thi', description: 'New staff. Good communication skill.', salary: 5000000, salary_period: :per_month)
Lecture.create(email: 'lecture@example.com',  password: 'password', password_confirmation: 'password', first_name: 'C', last_name: 'Bui Van', description: 'New lecture. Good technical skill.', salary: 200000, salary_period: :per_lesson)
ClassRoom.create(name: 'Room A', description: '40m2, good for about 30 students.', price: '2000000', price_period: :per_month)
Course.create(name: 'Object C', class_room: ClassRoom.first, staff: Staff.first, lecture: Lecture.first, description: 'Object C basic for IOS developer.', start_date: 1.month.from_now, end_date: 3.months.from_now, max_num_of_students: 30, price: 2000000)
Lesson.create(course: Course.first, index: 1, name: 'Hello World', description: 'The very first knowledge about Object C.')
