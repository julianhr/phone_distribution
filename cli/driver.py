

class Driver:
  def __init__(self):
    self.zip_code = None

  def set_zip_code(self):
    if self.quit:
      return

    while not self.zip_code:
      print(f'\nHi {self.name}, what zip code are you interested in?')
      zip_code = input().strip()

      if zip_code:
        self.zip_code = zip_code
