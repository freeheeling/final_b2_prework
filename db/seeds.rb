Course.destroy_all
Student.destroy_all

# courses
art = Course.create(name: 'Art')
music = Course.create(name: 'Music')
math = Course.create(name: 'Math')

# students
bob = Student.create(name: 'Bob')
dan = Student.create(name: 'Dan')
lou = Student.create(name: 'Lou')

# course_students
art.course_students.create!(student: bob, course: art, grade: 3.5)
art.course_students.create!(student: dan, course: art, grade: 3.4)
art.course_students.create!(student: lou, course: art, grade: 3.1)
music.course_students.create!(student: lou, course: music, grade: 2.5)
music.course_students.create!(student: bob, course: music, grade: 3.3)
music.course_students.create!(student: dan, course: music, grade: 3.9)
math.course_students.create!(student: dan, course: math, grade: 3.2)
math.course_students.create!(student: lou, course: math, grade: 2.2)
math.course_students.create!(student: bob, course: math, grade: 2.9)
