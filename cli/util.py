class Util:
  @staticmethod
  def res_to_json(res):
    res_json = {}

    if res.ok:
      try:
        res_json = res.json()
      except:
        pass

    return res_json
