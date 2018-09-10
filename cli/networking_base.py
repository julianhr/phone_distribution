import time


class NetworkingBase:
  def __init__(self):
    self.timeout = 3
    self.base_url = 'https://phone-distribution.herokuapp.com'

  def acknowledge_network_retry(self, attempts):
    if self.quit:
      return

    if attempts >= 3:
      print('\nThere appear to be network problems. Please try again later. Goodbye!')
      self.quit = True
      return

    backoff = 2 ** attempts
    long_txt = "There was a problem creating your account."
    long_txt += f" I will try again in {backoff} seconds.\n"
    print(long_txt)
    time.sleep(backoff)