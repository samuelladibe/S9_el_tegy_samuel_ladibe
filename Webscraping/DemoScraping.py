"""
    Notre script récupère les données du site dont le lien est donné
    dans le requests get

    Installer requests et beautifulsoup4 en amont par pip
    Importer les packages dans le script pour faire du webscraping
"""

import requests

from bs4 import BeautifulSoup

URL = "http://quotes.toscrape.com"
r = requests.get(URL, timeout =10)

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
# quotes = soup.select('div[class="quote"]')

# for q in quotes:
#     print(q.select_one('span[class="text"]').string + '  -- ' +
#           q.select_one('small[class="author"]').string)


"""Exercice 3"""
# lien = soup.find('li', {'class':'next'})
# lien = lien.find('a').attrs
# print(lien)
# lien = lien['href']
# suivante = f"{URL}{lien}"   # concat URL + lien en passant leur valeurs
# print(suivante)

def trouver(url):
    req = requests.get(url, timeout=10)

    soup_def = BeautifulSoup(req.content, 'html.parser')
    lien = soup_def.find('li', {'class':'next'})

    if lien is not None:
        lien = lien.find('a').attrs
        lien = lien['href']
        suivante = f"{URL}{lien}"  # concat URL + lien en passant leur valeurs
        return suivante
    else:
        return None

# help = True
# URL_base = URL
# URLs = ["http://quotes.toscrape.com/page/1"]


# while help :
#     next = trouver(URL_base)
#     if next is not None and next not in URLs:
#         URLs.append(next)
#         URL_base = next
#     else :
#         help = False

# print(f"Il y a {len(URLs)} pages")

help = True
URL_base = URL
URLs = ["http://quotes.toscrape.com/page/1"]

while help :
    next = trouver(URL_base)
    if next is not None and next not in URLs:
        URLs.append(next)
        URL_base = next
    else :
        help = False

def trouver_citations(url):
    citations = {}

    try:
        req = requests.get(url, timeout=30)

        soup_def = BeautifulSoup(req.content, 'html.parser')
        values = []
        quotes = soup_def.select('div[class="quote"]')

        for q in quotes:
            values.append(q.select_one('span[class="text"]').string)
        
        key = url[-6:]
        citations[key] = values
        return citations
    except requests.exceptions.Timeout:
        print("Request timed out. Retrying...")
        return None

liste_citations = []
for i in range(len(URLs)):
    citation = trouver_citations(URLs[i])
    if citation is not None:  # Added a check to make sure citation is not None
        for key in citation.keys() :
            liste_citations.extend(citation[key])

print(liste_citations)