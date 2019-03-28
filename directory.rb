# put all of the students into an array
# add new info. Hardcoded but easy to add variable = gets.chomp and update hash to activate
def input_students
  puts "Please enter the name of the student"
  #create an empty array
  students = []
  #gets first name or uses 'default'
  name = gets.chomp
  name == "" ? name = "default" : name
  
  puts "Please enter the student's cohort"
  puts "To finish, just hit return twice"
  
  #gets cohort or uses 'default'
  cohort = gets.chomp
  cohort == "" ? cohort = "default" : cohort
  
  #while name is not empty, repeat this code
  until name == "default" && cohort == "default" do
    # break if name and cohort equal 'default'

    
    # add the student hash to the array
    students << {
      name: name.to_sym,
      cohort: cohort.to_sym,
      hobbies: "evil",
      country_of_birth: "fiction",
      height: "tall..."
    }
    puts "Now we have ##{students.count} students"
    
    # request another name
    puts "Enter next student name"
    
    # get another student name from user or use 'default'
    name = gets.chomp
    name == "" ? name = "default" : name
    
    puts "Enter student cohort"
    # get cohort from user or use 'default'
    cohort = gets.chomp
    cohort == "" ? cohort = "default" : cohort
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
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(30)
    puts "hobbies: #{student[:hobbies]}".center(30)
    puts "country of birth: #{student[:country_of_birth]}".center(30)
    puts "height: #{student[:height]}".center(30)
  end
end

#same function as above but without using .each
def print_no_each(students)
  counter = 0
  while counter < students.count do
    puts "#{students[counter][:name]} (#{students[counter][:cohort]} cohort)}"
    counter += 1
  end
end

def print_names_beginning_with(students)
  #ask for character
  puts "enter first character:"
  begins = gets.chomp
  
  students.each_with_index  do |student, index|
    #print students that beginning with character given
    if student[:name][0] == begins
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)}"
    end
  end
end

def print_names_shorter_than_12_chars(students)
  length = 12
  
  students.each_with_index  do |student, index|
    #print students with names shorter than 12 characters
    if student[:name].length < length
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
#print_names_beginning_with(students)
#print_names_shorter_than_12_chars(students)
#print_no_each(students)
print_footer(students)