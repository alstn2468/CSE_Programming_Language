
list = [[7 for _ in range(250)] for _ in range(500)]

w = open("./Data01.txt", "w", encoding='utf8')

for i in range(len(list)) :
    w.write(' '.join(map(str, list[i])))
    w.write('\n')
