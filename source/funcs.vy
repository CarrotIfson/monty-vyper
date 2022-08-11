# @version ^0.3.3
 

owner: public(address)
name: public(String[10])
createdAt: public(uint256)
expiresAt: public(uint256)


@external
def __init__(name: String[10], duration: uint256):
    # set owner to caller
    self.owner = msg.sender
    # set name from input
    self.name = name
    self.createdAt = block.timestamp
    self.expiresAt = block.timestamp + duration

# External functions can only be called from outside this contract
@external
@pure
def multiply(x: uint256, y: uint256) -> uint256:
    return x * y


@external
@pure
def divide(x: uint256, y: uint256) -> uint256:
    return x / y


# A function that does nothing
@external
def doNothing():
    pass

 
@external
@pure
def multiOut() -> (uint256, bool):
    return (1, True)


@external
@pure
def addAndSub(x: uint256, y: uint256) -> (uint256, uint256):
    return (x + y, x - y)


# @version ^0.3.3

# Internal functions can only be called inside this contract
@internal
@pure
def _add(x: uint256, y: uint256) -> uint256:
    return x + y


@external
@view
def extFunc() -> bool:
    return True


@external
@view
def avg(x: uint256, y: uint256) -> uint256:
    # cannot call other external function
    # self.extFunc()

    # can call internal functions
    z: uint256 = self._add(x, y)

    return (x + y) / 2


@internal
@pure
def _sqr(x: uint256) -> uint256:
    return x * x


@external
@view
def sumOfSquares(x: uint256, y: uint256) -> uint256:
    return self._sqr(x) + self._sqr(y)
