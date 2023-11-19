from timeit import timeit
arr1=[
    [1,2,3,3,4,2],
    [5,6,7,3,6,3],
    [7,8,9,5,5,5],
    [6,4,5,6,4,6],
    [2,3,4,5,4,6],
    [1,2,6,5,3,4]
]
arr2=[
    [7,4,3],
    [3,2,2],
    [6,5,4]
]

def snl(array):
    n = len(array)
    snail_result = []
    top, bottom, left, right = 0, n - 1, 0, n - 1
    while top <= bottom and left <= right:
        for i in range(left, right + 1):
            snail_result.append(array[top][i])
        top += 1
        for i in range(top, bottom + 1):
            snail_result.append(array[i][right])
        right -= 1
        if top <= bottom:
            for i in range(right, left - 1, -1):
                snail_result.append(array[bottom][i])
            bottom -= 1
        if left <= right:
            for i in range(bottom, top - 1, -1):
                snail_result.append(array[i][left])
            left += 1
    return snail_result
snp='''
snl(arr1)
'''
exe=timeit(stmt=snp, globals=globals(), number=100000)
print(exe*1000)
