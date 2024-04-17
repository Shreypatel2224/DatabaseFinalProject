from faker import Faker
import random
import json

fake = Faker()

# Define how many records we want to generate
num_users = 60
num_faculty = 50
num_students = 50
num_alumni = 50
num_incoming_students = 50
num_coop_cycles = 15
num_coop_positions = 200
num_questions = 100
num_answers = 150
num_reviews = 100
num_compensation_packages = 200
num_companies = 30


# Generate User data
def create_users(n):
    users = []
    for i in range(1, n+1):
        users.append({
            "User_ID": i,
            "Username": fake.user_name(),
            "User_Type": fake.random_element(elements=('Student', 'Faculty', 'Alumni', 'Incoming Student')),
            "Password": fake.password(),
            "Email": fake.ascii_free_email()
        })
    return users

users = create_users(num_users)

# Assign User_IDs to Faculty, Student, Alumni, and Incoming_Student
# Note that in a real scenario, you should ensure the foreign key constraints are respected
# Here we're randomly assigning User_IDs, which might not match your business logic

def create_coop_positions(n, company_ids, user_ids, cycle_ids):
    coop_positions = []
    for i in range(1, n+1):
        coop_positions.append({
            'Position_ID': i,
            'Title': fake.job(),
            'Industry': fake.industry(),
            'Location': fake.city(),
            'Role_Description': fake.text(max_nb_chars=200),
            'Company_Size': fake.random_int(min=1, max=10000),
            'Work_Hours': fake.random_int(min=20, max=40),
            'Responsibilities': fake.text(max_nb_chars=200),
            'Company_ID': random.choice(company_ids),
            'Cycle_ID': random.choice(cycle_ids),
            'User_ID': random.choice(user_ids)
        })
    return coop_positions

def create_faculty(n, user_ids):
    faculty = []
    for i in range(n):
        faculty.append({
            "Faculty_ID": i + 1,
            "User_ID": random.choice(user_ids),
            "Name": fake.name(),
            "Department": fake.bs()
        })
    return faculty

def create_students(n, user_ids):
    students = []
    for i in range(n):
        students.append({
            "Student_ID": i + 1,
            "User_ID": random.choice(user_ids),
            "Name": fake.name(),
            "Major": fake.word(),
            "Grad_Date": fake.date_between(start_date='today', end_date='+4y')
        })
    return students

def create_alumni(n, user_ids):
    alumni = []
    for i in range(n):
        alumni.append({
            "Alumni_ID": i + 1,
            "User_ID": random.choice(user_ids),
            "Name": fake.name(),
            "Major": fake.word(),
            "Grad_Date": fake.date_between(start_date='-30y', end_date='today')
        })
    return alumni

def create_incoming_students(n, user_ids):
    incoming_students = []
    for i in range(n):
        incoming_students.append({
            "Incoming_Student_ID": i + 1,
            "User_ID": random.choice(user_ids),
            "Name": fake.name(),
            "Major": fake.word(),
            "Admission_Date": fake.date_between(start_date='today', end_date='+2y')
        })
    return incoming_students

# Get the list of User_IDs to be used as foreign keys
user_ids = [user['User_ID'] for user in users]

faculty = create_faculty(num_faculty, user_ids)
students = create_students(num_students, user_ids)
alumni = create_alumni(num_alumni, user_ids)
incoming_students = create_incoming_students(num_incoming_students, user_ids)

# Create CoopCycles
def create_coop_cycles(n):
    cycles = []
    for i in range(1, n+1):
        cycles.append({
            'Year': fake.year(),
            'PlacementRate': fake.random_number(digits=2),
            'Type': fake.random_element(elements=('Fall', 'Spring', 'Summer')),
            'Cycle_ID': i
        })
    return cycles

coop_cycles = create_coop_cycles(num_coop_cycles)
cycle_ids = [cycle['Cycle_ID'] for cycle in coop_cycles]

# Create CoopPositions
coop_positions = create_coop_positions(num_coop_positions, company_ids, user_ids, cycle_ids)

# Create Questions
def create_questions(n, user_ids):
    questions = []
    for i in range(1, n+1):
        questions.append({
            'Title': fake.sentence(),
            'Date': fake.date(),
            'Status': fake.random_element(elements=('Open', 'Closed', 'Resolved')),
            'Content': fake.text(),
            'User_ID': random.choice(user_ids),
            'Question_ID': i
        })
    return questions

questions = create_questions(num_questions, user_ids)

# Create Answers
def create_answers(n, user_ids, question_ids):
    answers = []
    for i in range(1, n+1):
        answers.append({
            'Content': fake.text(),
            'Date': fake.date(),
            'User_ID': random.choice(user_ids),
            'Question_ID': random.choice(question_ids),
            'Answer_ID': i
        })
    return answers

answers = create_answers(num_answers, user_ids, [q['Question_ID'] for q in questions])

# Create Reviews
def create_reviews(n, user_ids, position_ids):
    reviews = []
    for i in range(1, n+1):
        reviews.append({
            'Title': fake.sentence(),
            'Rating': fake.random_element(elements=(1, 2, 3, 4, 5)),
            'Content': fake.text(),
            'Date': fake.date(),
            'User_ID': random.choice(user_ids),
            'Position_ID': random.choice(position_ids),
            'Review_ID': i
        })
    return reviews

reviews = create_reviews(num_reviews, user_ids, [p['Position_ID'] for p in coop_positions])

# Create CompensationPackages
def create_compensation_packages(n, position_ids):
    compensation_packages = []
    for i in range(1, n+1):
        compensation_packages.append({
            'Perks': fake.sentence(),
            'Hourly': fake.random_number(digits=2),
            'BonusTotal': fake.random_number(digits=3),
            'HousingTotal': fake.random_number(digits=3),
            'RelocationTotal': fake.random_number(digits=3),
            'Position_ID': random.choice(position_ids),
            'CP_ID': i
        })
    return compensation_packages

compensation_packages = create_compensation_packages(num_compensation_packages, [p['Position_ID'] for p in coop_positions])

# Generate Company data
def create_companies(n):
    companies = []
    for i in range(1, n+1):
        companies.append({
            "Company_ID": i,
            "Name": fake.company(),
            "Location": fake.address(),
            "Industry": fake.bs(),
            "Size": fake.random_digit_not_null(),
            "Reputation": fake.word()
        })
    return companies

companies = create_companies(num_companies)
company_ids = [company['Company_ID'] for company in companies]

# Generate CoopCycle data
def create_coop_cycles(n):
    cycles = []
    for i in range(1, n+1):
        cycles.append({
            "Cycle_ID": i,
            "Year": fake.year(),
            "PlacementRate": fake.random_number(digits=2),
            "Type": fake.random_element(elements=('Fall', 'Spring', 'Summer'))
        })
    return cycles

coop_cycles = create_coop_cycles(num_coop_cycles)
cycle_ids = [cycle['Cycle_ID'] for cycle in coop_cycles]

# Now define create_coop_positions with the correct parameters
def create_coop_positions(n, company_ids, user_ids, cycle_ids):
    coop_positions = []
    for i in range(1, n+1):
        coop_positions.append({
            "Position_ID": i,
            # ... other attributes ...
            "Company_ID": random.choice(company_ids),
            "User_ID": random.choice(user_ids),
            "Cycle_ID": random.choice(cycle_ids)
        })
    return coop_positions

# Now we have company_ids and cycle_ids defined, we can call create_coop_positions
coop_positions = create_coop_positions(num_coop_positions, company_ids, user_ids, cycle_ids)


coop_cycles = create_coop_cycles(num_coop_cycles)
cycle_ids = [cycle['Cycle_ID'] for cycle in coop_cycles]

companies = create_companies(num_companies)
company_ids = [company['Company_ID'] for company in companies]

# Now you can call create_coop_positions
coop_positions = create_coop_positions(num_coop_positions, company_ids, user_ids, cycle_ids)

# Now you can write the data to JSON files or create SQL insert statements as needed


# You can then serialize this data to JSON, or convert to SQL INSERT statements as needed
# For instance:
# save_data_to_json('users', users)
# ...
