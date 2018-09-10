import requests
from util import Util
from networking_base import NetworkingBase


class RandomNumberOffer(NetworkingBase):
  def __init__(self, registrar, zip_code):
    NetworkingBase.__init__(self)
    self.registrar = registrar
    self.zip_code = zip_code
    self.random_numbers = None
    self.selected_number = None
    self.is_number_assigned = False
    self.quit = False

  def start(self):
    self.fetch_random_numbers()
    self.validate_numbers()

    if not self.quit:
      self.print_phone_numbers()
      self.request_selection()
      self.assign_number()
      self.communicate_outcome()

  def fetch_random_numbers(self):
    json = None
    has_info = False
    attempts = 0

    while not has_info and attempts < 3:
      try:
        url = f'{self.base_url}/api/zip_code/{self.zip_code}/random_numbers'
        res = requests.get(url, timeout=self.timeout)
        has_info = True
        if res.ok:
          json = Util.res_to_json(res)
          if json:
            self.random_numbers = json
      except ConnectionError:
        attempts += 1
        self.acknowledge_network_retry(attempts)

  def validate_numbers(self):
    if self.random_numbers is None:
      self.quit = True
      print(f'No phone numbers were found in zip code {self.zip_code}')

  def print_phone_numbers(self):
    for i, num in enumerate(self.random_numbers):
      print(f'{i + 1}) {num}', end='   ')
      if 1 > 0 and (i + 1) % 3 == 0:
        print()

  def request_selection(self):
    while self.selected_number is None:
      print('\nWhich random number would you like to have? (or q to leave)')

      try:
        choice = input().strip()

        if choice == 'q':
          print('Goodbye!')
          self.quit = True
          break
        else:
          choice = int(choice)

        if 0 <= choice < len(self.random_numbers):
          number = self.random_numbers[choice - 1]
          self.selected_number = number
        else:
          print("Something went wrong, let's try again")
      except:
        print("Something went wrong, let's try again")

  def assign_number(self):
      params = { 'number': self.selected_number, 'email': self.registrar.email }
      url = f'{self.base_url}/api/phone_number/assign_specific'
      attempts = 0

      while attempts < 3:
        attempts += 1
        try:
          res = requests.put(url, params=params, timeout=self.timeout)
          if res.ok:
            json = Util.res_to_json(res)
            self.is_number_assigned = 'assigned' in json and json['assigned'] == True
          else:
            break
        except ConnectionError:
          self.acknowledge_network_retry(attempts)

  def communicate_outcome(self):
      print()
      if self.is_number_assigned:
        print(f"The number {self.selected_number} was successfully assigned to you!")
        self.quit = True
      else:
        print('Looks like we were unsuccessful assigning your number. Please try again.')
