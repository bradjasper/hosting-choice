import csv
import pprint

import pagerank

f = csv.writer(open('articles_pr_2.csv', 'wb'))
for item in csv.reader(open('articles.csv')):
    rank = pagerank.get_pagerank(item[1])
    item.append(rank)
    f.writerow(item)

    print item
