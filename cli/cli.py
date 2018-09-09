import readline
import requests
from util import Util


readline.parse_and_bind('tab: complete')
readline.parse_and_bind('set editing-mode vi')

if __name__ == '__main__':
  base_url = 'http://localhost:3000'
  long_txt = '''
Thank you for your interest in selecting a phone number.
To get started we first need some information.

'''
  print(long_txt)

  quit = False
  while not quit:
    print('What is your email address?')
    email = input().strip()
    params = { 'email': email }
    res = requests.get(f'{base_url}/api/users/show', params=params, timeout=5)
    json = Util.res_to_json(res)

    if not json:
      print('\nWhat is your name?',)
      name = input().strip()
      params = { 'user': { 'full_name': name, 'email': email } }

      res = requests.post(f'{base_url}/users', json=params)
      json = Util.res_to_json(res)

      if json:
        quit = True
      else:
        print("hmm, there was a problem creating your account, let's try again\n")
    else:
      quit = True

  name = json['full_name']
  print(f'\nHi {name}, what zip code are you interested in?')
  zip_code = input().strip()

  long_txt = '''
Please select the best option for you

1. Assign me a random number
2. Let me choose a number

'''
  print(long_txt)
  option = input().strip()

  if option == '1':
    res = requests.get(f'{base_url}/api/zip_code/{zip_code}/random_numbers', timeout=5)
    json = Util.res_to_json(res)

    if json:
      for i, num in enumerate(json):
        print(f'{i + 1}) {num}', end='   ')
        if 1 > 0 and (i + 1) % 3 == 0:
          print()
      print()

      print('Which random number would you like to have?')
      selected = int(input().strip())

      try:
        number = json[selected - 1]
        params = { 'number': number, 'email': email }
        res = requests.put(f'{base_url}/api/phone_number/assign_specific', params=params, timeout=5)
        json = Util.res_to_json(res)

        print()
        if 'assigned' in json and json['assigned'] == True:
          print(f"The number {number} was successfully assigned to you!")
        else:
          print('hmm, looks like something went wrong')
      except:
        print('hmm, looks like the selection was not correct')
    else:
      print('\nLooks like no numbers were found using the supplied information.')

  if option == '2':
    quit = False
    while not quit:
      long_txt = '''
Enter the area code and phone number you want to inquire about.
Make sure to enter it in the format AAA-NNN-NNNN. For example: 760-528-3698'''
      print(long_txt)
      number = input().strip()

      if len(number.split('-')) == 3:
        quit = True
      else:
        print("hmm, looks like something went wrong, let's try again.")

    res = requests.get(f'{base_url}/api/phone_number/{number}/availability', timeout=5)
    json = Util.res_to_json(res)

    print()
    if 'available' in json and json['available'] == True:
      print(f"The number {number} is available. Would you like me to assign it to you?")

      if input().strip().lower() in 'yes':
        params = { 'number': number, 'email': email }
        res = requests.put(f'{base_url}/api/phone_number/assign_specific', params=params, timeout=5)
        json = Util.res_to_json(res)

        print()
        if 'assigned' in json and json['assigned'] == True:
          print(f"The number {number} was successfully assigned to you!")
        else:
          print(f"Looks like something went wrong. Let's try again")
      else:
        print('Good bye!')
    else:
      print(f"hmm, looks like the number {number} wasn't found in the list of available numbers")

