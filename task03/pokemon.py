import requests

name = "fire"
url = "https://pokeapi.co/api/v2/type/{}".format(name)
response = requests.get(url)

if response:
    data = response.json()
else:
    print("Error to fetch the data")

for i in range(len(data['pokemon'])):
    print(data['pokemon'][i]['pokemon']['name'])
