import requests
from networking_base import NetworkingBase
from util import Util


class Registrar(NetworkingBase):
  def __init__(self):
    NetworkingBase.__init__(self)
    self.name = None
    self.email = None
    self.quit = False
    self.is_registered = False

  def start(self):
    self.print_intro()
    self.set_email()
    self.fetch_account()
    if not self.quit:
      self.set_name()
      self.create_account()

  def print_intro(self):
    long_txt = '''
Thank you for your interest in selecting a phone number.
To get started we first need some information.

'''
    print(long_txt)

  def set_email(self):
    while self.email is None:
      print('What is your email address?')
      email = input().strip().lower()

      if email:
        self.email = email

  def fetch_account(self):
    params = { 'email': self.email }
    json = None
    has_info = False
    attempts = 0

    while not has_info and attempts < 3:
      try:
        res = requests.get(f'{self.base_url}/api/users/show', params=params, timeout=self.timeout)
        json = Util.res_to_json(res)
        has_info = True
      except ConnectionError:
        self.acknowledge_network_retry(attempts)

    # json represent the user's profile.
    # If any information is received, the user is already registered
    if json:
      self.name = json['full_name']
      self.is_registered = True

  def set_name(self):
    while self.name is None:
      print('\nWhat is your name?',)
      name = input().strip()

      if name:
        self.name = name

  def create_account(self):
    params = { 'user': { 'full_name': self.name, 'email': self.email } }
    attempts = 0

    while not self.is_registered and attempts < 3:
      attempts += 1

      try:
        res = requests.post(f'{self.base_url}/users', json=params, timeout=self.timeout)
        if res.ok:
          break
        else:
          self.quit = True
          print('There was an error creating your account')

          try:
            print(res.json())
          except:
            print(res.reason)

          break
      except ConnectionError:
        self.acknowledge_network_retry(attempts)

