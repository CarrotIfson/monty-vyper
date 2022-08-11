# @version ^0.3.3
b: public(bool)
i: public(int128)  # -2 ** 127 to (2 ** 127 - 1)
u: public(uint256)  # 0 to 2 ** 256 - 1
dec: public(decimal)  # -2 ** 127 to (2 ** 127 - 1), 10 decimal places
addr: public(address)
b32: public(bytes32)
bs: public(Bytes[100])
s: public(String[100])



struct Person:
    name: String[100]
    age: uint256

# fixed sized list
nums: public(uint256[10])  # must be bounded
myMap: public(HashMap[address, uint256])
person: public(Person)



@external
def __init__():
    self.b = False
    self.i = -1
    self.u = 23
    self.dec = 3.14
    self.addr = 0x0000000000000000000000000000000000000000
    self.b32 = 0xdead
    self.bs = b"\x01"
    self.s = "Hello Vyper"

    # This updates self.nums[0]
    self.nums[0] = 123
    self.nums[9] = 456
    # Copies self.nums to array in memory.
    # Does not modify referenced variable (self.nums)
    arr: uint256[10] = self.nums
    arr[0] = 123

    # This updates self.myMap
    self.myMap[msg.sender] = 11

    # This updates self.person
    self.person.age = 11
    self.person.name = "Vyper"
