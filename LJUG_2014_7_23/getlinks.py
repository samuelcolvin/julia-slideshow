import re, requests, os

pres = open('julia_packages.html', 'r').read()
links = re.findall('src="(http://codeshow.*?)"', pres)
for link in links:
    name = link.split('/')[-1] + '.html'
    path = os.path.join('codedisplay', name)
    print 'getting %s' % link
    r  = requests.get(link)
    html = r.text.encode('utf8')
    print 'saving to %s' % path
    open(path, 'w').write(html)