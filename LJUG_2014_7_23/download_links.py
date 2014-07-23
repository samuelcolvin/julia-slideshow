import re, requests, os, json

link_lookup = json.load(open('code_links.json', 'r'))
for link, path in link_lookup.items():
    print 'getting %s' % link
    r  = requests.get(link)
    html = r.text.encode('utf8')
    print 'saving to %s' % path
    open(path, 'w').write(html)