# @version ^0.3.3

@external
def compareTo(x: uint256, y: uint256) -> int256:
    if x == y:
        return 0
    elif x < y:
        return -1
    else:
        return 1


@external
@pure
def absoluteValue(x: uint256, y: uint256) -> uint256:
    if x >= y:
        return x - y
    return y - x

@external
@pure
def loop():
    s: uint256 = 0
    for i in range(10):
        s += 1
    
    #find min
    nums: uint256[5] = [4,1,5,0,9]
    x: uint256 = MAX_UINT256
    for num in nums:
        if x < num:
            x = num

@external
@pure
def sum(nums: uint256[10]0)) -> uint256:
    x: uint256 = 0
    for n in nums:
        x += n
    return x



@external
def setOwner(owner: address):
    assert msg.sender == self.owner, "!owner"
    assert owner != ZERO_ADDRESS, "owner = zero"
    self.owner = owner