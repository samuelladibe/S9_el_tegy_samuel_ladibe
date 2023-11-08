"""
    Notre script récupère les données du site dont le lien est donné
    dans le requests get

    Installer requests et beautifulsoup4 en amont par pip
    Importer les packages dans le script pour faire du webscraping
"""

import requests

from bs4 import BeautifulSoup

r = requests.get("http://quotes.toscrape.com", timeout =10)

#print(r.status_code) # statut de connection au lien du site
#print(r.headers['content-type']) # type de contenu du site, text/html
#print(r.encoding) # encodage


soup = BeautifulSoup(r.content, 'html.parser')
# print(soup.head)

# print(soup.a)

# on peut définir 1 ou plusieurs propriétés pour la balise recherchée

# login = soup.find('a', {'href':'/login'}) # {'href':'/login'} propriété récupère le lien vers login
# tags = soup.find_all('span', {'class':'tag-item'})
# liens = soup.select('a[class]') # lien avec une classe
# tags2 = soup.select('span[class="tag-item"]')

# print(login)
# print(tags)
# print(liens)
# print(tags2)

"""Exercise 1"""
# Check if the request was successful (status code 200)
# if r.status_code == 200:
#     # Find the top ten tags
#     top_ten = soup.find_all('span', {'class':'tag-item'})
    
#     # Print the top ten tags
#     for tag in top_ten:
#         print(tag.find('a').string)
# else:
#     print(f"Error: Unable to fetch the content. Status code: {r.status_code}")

"""Exercise 2"""
quotes = soup.select('div[class="quote"]')

for q in quotes:
    print(q.select_one('span[class="text"]').string + '  -- ' +
          q.select_one('small[class="author"]').string)
