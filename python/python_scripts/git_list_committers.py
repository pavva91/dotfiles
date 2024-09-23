import subprocess

bashCommand = "git log '--pretty=%aN : %ci : %h' | tails -n 25000 | tac > git-log-out.txt"

authors = {}
dates = []
times = []
commits = []

_ = subprocess.run(bashCommand, shell=True)

file = open("git-log-out.txt", "r")

for line in file:
    author, _, date, time, _, _, hash_commit = line.split(' ')

    if authors.get(author) is None:
        authors[author] = author
        dates.append(date)
        times.append(time)
        commits.append(hash_commit)
        pass
    pass

i = 0
for a in authors:
    print(i+1, ". ", a, dates[i], times[i], commits[i])
    i = i + 1
    pass

print("authors: ", len(authors))
