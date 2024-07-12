sorted_list=[i for i in range(1,101)]
sl=[1,2,3,4,5,6]


def binary_search(sorted_list, target):
    left = 0
    right = len(sorted_list) - 1
    while left <= right :
        mid = (left + right) // 2
        guess = sorted_list[mid]
        
        if guess == target:
            return mid
        if guess > target:
            right = mid - 1
        else:
            left = mid + 1
    return None
    
print(binary_search(sorted_list, 78))
