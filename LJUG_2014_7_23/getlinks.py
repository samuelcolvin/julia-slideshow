import re, requests, os, json

pres = open('julia_packages.html', 'r').read()
links = re.findall('src="(http://codeshow.*?)"', pres)
link_lookup = {}
for link in links:
    name = link.split('/')[-1] + '.html'
    path = os.path.join('codedisplay', name)
    link_lookup[link] = path
    print 'getting %s' % link
    # r  = requests.get(link)
    # html = r.text.encode('utf8')
    print 'saving to %s' % path
    # open(path, 'w').write(html)
json.dump(link_lookup, open('code_links.json', 'w'), indent = 2)