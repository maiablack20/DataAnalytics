# Maia Black
# 2026-05-19
# Working with Classes Bonus Exercise

cust_list = []

class RewardsProgram:
    '''The purpose of the class is to create a rewards program for patrons of the restaurant'''


    def __init__(self, cust_name, phone, email):
        self.cust_name = cust_name
        self.phone = phone
        self.email = email
    def profile(self):
        print(f"Name: {self.cust_name}")
        print(f"Phone: {self.phone}")
        print(f"Email: {self.email}")
    def thank_you(self):
        print(f"Thank you, {self.cust_name}, for visiting our restaurant!")
    def add_to_cust_list(self):
        cust_list.append((self.cust_name, self.phone, self.email))

rewards1 = RewardsProgram("Maria Sanchez", "296-333-0002", "maria_sanchez121@hotmail.com")

rewards2 = RewardsProgram("Lisa Nelson", "678-993-8900", "lisadave2000@aol.com")

rewards3 = RewardsProgram("Robin Banks", "320-898-5544", "oohshe_stealing98@ymail.com")

# Rewards 1 Call Function:
rewards1.profile()
rewards1.thank_you()
rewards1.add_to_cust_list()
print(f"==========================================")

# Rewards 2 Call Function:
rewards2.profile()
rewards2.thank_you()
rewards2.add_to_cust_list()
print(f"==========================================")

# Rewards 3 Call Function: 
rewards3.profile()
rewards3.thank_you()
rewards3.add_to_cust_list()
print(f"==========================================")

print(f"All Customers Have Been Added To Rewards Program: {cust_list}.")