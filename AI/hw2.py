# S = [fit, unfit, dead]
# A = [exercise, relax]
#   S        A     | P(fit|s,a)   r |     S        A     | P(unfit|s,a)   r  |
# fit    exercise       0.891    8  |     fit    exercise        0.009    8
# unfit  exercise    	0.18     0  |     unfit  exercise   	 0.72     0
# dead   exercise         0      0  |     dead   exercise          0      0
# fit    relax          0.693   10  |     fit    relax           0.297   10
# unfit  relax            0      5  |     unfit  relax           0.99     5
# dead   relax            0      0  |     dead   relax             0      0
#   S        A     |  P(dead|s,a)  r |
# fit    exercise        0.1      0
# unfit  exercise        0.1      0
# dead   exercise        1        0
# fit    relax           0.01     0
# unfit  relax           0.01     0
# dead   relax           1        0

# Probability reward  matrices
exercisePR = [[[0.891,8],[0.009,8],[0.1,0]],   # s = fit
                [[0.18,0],[0.72,0],[0.1,0]],   # s = unfit
                [[0,0],[0, 0],[1,0]]]          # s = dead

relaxPR = [[[0.693,10], [0.297,10], [0.01,0]], # s = fit
            [[0,5],[0.99,5],[0.01,0]],         # s = unfit
            [[0,0], [0,0],[1,0]]]              # s = dead

n = int(input('\nEnter number of actions to be done: '))
s = input('\nSelect starting state: ')
G = float(input('\nSelect discount factor: '))

states = {'fit': 0,
          'unfit': 1,
          'dead': 2}
actions = {'exercise': 0,
          'relax': 3}

q_0 = []
# getting all values of q0 so they are only calculated once
for i in range(6):
    if i < 3:
        q01 = exercisePR[i%3][0][0]*exercisePR[i%3][0][1]
        #print(q0_1)
        q02 = exercisePR[i%3][1][0]*exercisePR[i%3][1][1]
        #print(q0_2)
    else:
        q01 = relaxPR[i%3][0][0]*relaxPR[i%3][0][1]
        #print(q0_1)
        q02 = relaxPR[i%3][1][0]*relaxPR[i%3][1][1]
    q_0.append(q01+q02)

# return value function formula, returns the path of
# actions with the highest reward
def V_n(s,n):
    return max([q_n(s,'exercise', n),q_n(s,'relax', n)])

# formula for obtaining q_n
def q_n(s,a,n):
    index = states[s] + actions[a]
    q0 = q_0[index]
    if n == 0:
        return q0
    if a == 'exercise':
        # return value function called with n-1 as we only want to see
        # the highest reward in the next n-1 steps
        qn = G*(exercisePR[states[s]][0][0]*V_n('fit',n-1)
        + exercisePR[states[s]][1][0]*V_n('unfit',n-1))
    else:
        qn = G*(relaxPR[states[s]][0][0]*V_n('fit', n-1)
        + relaxPR[states[s]][1][0]*V_n('unfit',n-1))
    qn = q0+qn
    return qn

exerciseQN = q_n(s,'exercise', n)
relaxQN = q_n(s,'relax', n)
print('\nn = {0} exer:{1} relax:{2}'.format(n,exerciseQN,relaxQN))
