
list = [[7 for _ in range(1000)] for _ in range(1000)]

w = open("./Data02.txt", "w", encoding='utf8')

for i in range(len(list)) :
    w.write(' '.join(map(str, list[i])))
    w.write('\n')
