import readline
import requests
import time

from registrar import Registrar
from offer_chooser import OfferChooser
from random_number_offer import RandomNumberOffer
from choose_number_offer  import ChooseNumberOffer

readline.parse_and_bind('tab: complete')
readline.parse_and_bind('set editing-mode vi')


if __name__ == '__main__':
  registrar = Registrar()
  registrar.start()

  if not registrar.quit:
    offer_chooser = OfferChooser(registrar.name)
    offer_chooser.start()

    if offer_chooser.option == 'random_number':
      offer_type = RandomNumberOffer(registrar, offer_chooser.zip_code)
      offer_type.start()
    if offer_chooser.option == 'select_number':
      offer_type = ChooseNumberOffer(registrar.email)
      offer_type.start()
