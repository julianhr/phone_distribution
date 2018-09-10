class OfferChooser:
  def __init__(self, name):
    self.name = name
    self.option = None
    self.zip_code = None

  def start(self):
    self.set_zip_code()
    self.request_option()

  def set_zip_code(self):
    while not self.zip_code:
      print(f'\nHi {self.name}, what zip code are you interested in?')
      zip_code = input().strip()

      try:
        if 500 <= int(zip_code) <= 99999:
          self.zip_code = zip_code
      except:
        print("It appears something went wrong, let's try again")

  def request_option(self):
    while not self.option:
      long_txt = '''
Please select the best option for you

1. Assign me a random number
2. Let me choose a number

'''
      print(long_txt)
      selection = input().strip()

      if selection == '1':
        self.option = 'random_number'
      if selection == '2':
        self.option = 'select_number'
