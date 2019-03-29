def get_name
    while true do
      puts "Name: "
      name = gets.chomp 
      
      puts "type 'c' to confirm, or hit return to retype"
      command = gets.chomp
      break if command == "c"
    end
  name == "" ? name = "default" : name
  return name.to_sym
end

def get_cohort
  puts "Cohort:"
  cohort = gets.chomp
  cohort == "" ? cohort = "default" : cohort
  return cohort.to_sym
end

def input_students
  # create an empty array
  students = []
  
  # get details or use 'default'
  puts "Please enter new student details"
  name = get_name
  cohort = get_cohort
  
  puts "***Leave Name and Cohort empty to exit.***".center(50)
  puts "Warning incomplete entries will not be saved!".center(50)
  
  #breaks if BOTH name and cohort are empty or :default
  until name == :default && cohort == :default do
  
    # add hash to the array.
    students << {
      name: name,
      cohort: cohort,
      hobbies: "evil",
      country_of_birth: "fiction",
      height: "tall..."
    }
    puts "Now we have ##{students.count} students"
    
    puts "Enter next student's details"
    name = get_name
    cohort = get_cohort
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