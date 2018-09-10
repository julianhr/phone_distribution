import requests
from networking_base import NetworkingBase
from util import Util


class ChooseNumberOffer(NetworkingBase):
  def __init__(self, email):
    NetworkingBase.__init__(self)
    self.email = email
    self.phone_number = None
    self.is_available = False
    self.is_confirmed = False
    self.is_assigned = False
    self.quite = False

  def start(self):
    self.ask_for_number()
    self.check_availability()
    self.confirm()
    if self.is_confirmed:
      self.assign()
      self.communicate_outcome()

  def ask_for_number(self):
    while self.phone_number is None:
      long_txt = 'Enter the area code and phone number you want to inquire about.'
      long_txt += '\nMake sure to enter it in the format AAA-NNN-NNNN.'
      long_txt += ' For example: 760-528-3698'
      print(long_txt)

      number = input().strip()

      if self.is_number_valid(number):
        self.phone_number = number
      else:
        print("Looks like something went wront, let's try again\n")

  def is_number_valid(self, number):
    try:
      parts = number.split('-')
      len(parts[0]) == 3
      len(parts[1]) == 3
      len(parts[2]) == 4

      return 1000000000 <= int(''.join(parts)) <= 9999999999
    except:
      return False

  def check_availability(self):
    url = f'{self.base_url}/api/phone_number/{self.phone_number}/availability'
    has_info = False
    attempts = 0

    while not has_info and attempts < 3:
      attempts += 1
      try:
        res = requests.get(url, timeout=self.timeout)
        has_info = True
        if res.ok:
          json = Util.res_to_json(res)
          if 'available' in json and json['available'] == True:
            self.is_available = True
        else:
          break
      except ConnectionError:
        self.acknowledge_network_retry(attempts)

  def confirm(self):
    if self.is_available:
      long_txt = f"\nThe number {self.phone_number} is available."
      long_txt += " Would you like me to assign it to you?"
      print(long_txt)

      if input().strip().lower() in 'yes':
        self.is_confirmed = True
    else:
      print(f'Looks like the number {self.phone_number} is not in the list of available numbers.')

  def assign(self):
    params = { 'number': self.phone_number, 'email': self.email }
    attempts = 0

    while attempts < 3:
      attempts += 1
      url = f'{self.base_url}/api/phone_number/assign_specific'
      try:
        res = requests.put(url, params=params, timeout=self.timeout)
        if res.ok:
          json = Util.res_to_json(res)
          self.is_assigned = 'assigned' in json and json['assigned'] == True
        else:
          break
      except ConnectionError:
        self.acknowledge_network_retry(attempts)

  def communicate_outcome(self):
    print()
    if self.is_assigned:
      print(f"The number {self.phone_number} was successfully assigned to you!")
    else:
      print(f"We're sorry we couldn't successfully assign the number to you. Please try again later.")
