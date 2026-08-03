import random
# The functions used in the loop

def cal_fitness (y_hat,y):
    '''' This function used to calculate the fitness 
    args : Y_hat , Y
    return: fitness   '''''
    return abs(y - y_hat)

def cal_yhat(weights):
    '''''This function used to calculate Yhat 
    args : weights
    return: Yhat    '''''
    w1,w2,w3,w4,w5,w6 = weights
    x1,x2,x3,x4,x5,x6 = (4, -2, 3.5, 5, -11, -4.7)
    y_hat= w1 * x1 + w2 * x2 + w3 * x3 + w4 * x4 + w5 * x5 + w6 * x6
    return y_hat

def single_point_crossover(chromosome1,chromosome2,point_crossover):
    ''''This function used  In the crossover 
    args : chromosome1,chromosome2,point_crossover
    return : child   '''''
    child = chromosome1[:point_crossover] + chromosome2[point_crossover:]
    return child

 # Initialize the population

population = [ ]
length_of_population = 20

# We will use the uniform distribution in population initialization

for i in range(length_of_population):
    weights = [random.uniform(-20,20) for _ in range(6)]  # Initialize random weights
    population.append(weights)

# The variables that we will use in the while loop

found = False

y = 44

c = 0  # counter for the number of generations

new_generation = population
while not found :
    # Here, We will rank the population ascendingly based on the fitness
    population = sorted(population, key=lambda x: cal_fitness(cal_yhat(x), y))

    if cal_fitness(cal_yhat(population[0]), y) <= 0.1 :
        found = True
        break
    # Here, We will choose the best  individuals to be in the next generation.
    for i in range(0, 7):
        new_generation[i] = population[i]

    # Here, We will choose a group of individuals to do crossover between them.
    for i in range(7,15):
        # Here , I said that We will do crossover between ith indvidual and the upcoming one after position 3
        new_generation[i] = single_point_crossover(population[i],population[i+1],3)


    # Here , We will choose the least individuals to mutate them

    for i in range (15,length_of_population):

        # Here , I said that we will mutate a random position in the weights list with a random number
        population[i][random.randint(0,5)] = random.uniform(-20,20)
        new_generation[i] = population[i]

    population = new_generation

    c+=1
    # Here we print the No. of the generation  and the fitness of the first individual of the population ( as it is the least fitness in the population) and the weights of that individual.
    print("The Generation No. {}  with Lowest fitness {} and weights {} ".format(c,cal_fitness(cal_yhat(population[0]), y),population[0]))

print("Finally we got it")

print("The Best Generation is the generation  No. {}  with Lowest fitness {} and weights {} ".format(c+1,cal_fitness(cal_yhat(population[0]), y),population[0]))





'''''
    Names :
    
    Abdelrhman Mohamed Abd-Elhady Hodib ID: 2022513643
    
    Hashem Ahmed Abdel-Hafiz  ID: 20221445676
    
    Ahmed Morad Abdel-Hamid Mohamed ID: 2203187
    
'''






