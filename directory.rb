# put all of the students into an array
def input_students
  puts "Please enter the name of the student"
  #create an empty array
  students = []
  #gets first name
  name = gets.chomp
  puts "Please enter the student's cohort"
  puts "To finish, just hit return twice"
  #gets cohort
  cohort = gets.chomp
  #while name is not empty, repeat this code
  while !name.empty? && !cohort.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have ##{students.count} students"
    # request another name
    puts "Enter next student name"
    # get another student name from user
    name = gets.chomp
    puts "Enter student cohort"
    # get cohort from user
    cohort = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index  do |student, index|
    #print students that begin with 'd'""
    if student[:name][0] == "d"
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)}"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#call the methods to see results
students = input_students
print_header
print(students)
print_footer(students)