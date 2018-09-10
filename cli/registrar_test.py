import pytest
import unittest.mock
import requests
import json
from registrar import Registrar
from networking_base import NetworkingBase
from util import Util


@pytest.fixture(autouse=True)
def no_requests(monkeypatch):
    monkeypatch.delattr("requests.sessions.Session.request")

def test_parent_class():
  print('class inherits from NetworkingBase')
  r = Registrar()
  assert r.__class__.__base__ == NetworkingBase

def test_set_email_valid(monkeypatch):
  print('an email is set if one is passed')
  test_email = '123@email.com'
  monkeypatch.setattr('builtins.input', lambda: test_email)
  r = Registrar()
  r.set_email()
  assert r.email == test_email

def test_fetch_account():
  print('test that requests sends get request to verify user account')
  r = Registrar()
  r.email = '123@email.com'
  requests.get = unittest.mock.MagicMock()
  r.fetch_account()
  requests.get.assert_called_once()

def test_fetch_account_sets_is_registered(monkeypatch):
  def mock_call(path=None):
    return { 'full_name': 'John Smith' }
  monkeypatch.setattr(Util, 'res_to_json', mock_call)
  r = Registrar()
  r.fetch_account()
  assert r.is_registered == True
  assert r.name == mock_call()['full_name']

def test_set_name(monkeypatch):
  test_name = 'John Smith'
  monkeypatch.setattr('builtins.input', lambda: test_name)
  r = Registrar()
  r.set_name()
  assert r.name == test_name

def test_create_account(monkeypatch):
  print('test requests sends a post action to the endpoint for account creation')
  r = Registrar()
  r.is_registered = False
  requests.post = unittest.mock.MagicMock()
  r.create_account()
  requests.post.assert_called_once()