import requests
import json


def logItem(barcode):
    config_json = open("config.json")
    config = json.load(config_json)
    
    print config['url']
    print config['TrolleyNo']
    
    url = config['url']
    TrolleyNo = config['TrolleyNo']
    
    payload = {'TrolleyNo': TrolleyNo , 'barcode': barcode }
    r = requests.post(url, data=payload)
    
    print r.text
    
    config_json.close()
    
#logItem(3000)
if __name__ == '__main__':
    config_json = open("config.json")
    config = json.load(config_json)

    url = config['url']
    message = "HEY. What's up?"
    payload = {'message':message }

    r = requests.post(url, data=payload)

    print r.text

    config_json.close()

