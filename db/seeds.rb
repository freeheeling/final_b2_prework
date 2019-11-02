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
