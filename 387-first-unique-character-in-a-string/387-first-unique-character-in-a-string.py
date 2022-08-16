class Solution:
    def firstUniqChar(self, s: str) -> int:
        
        d = {}
        
        for i in s:
            d[i] = d.get(i, 0) + 1
            
        for i in s:
            if d[i] == 1:
                x = s.index(i)
                break
            else:
                x = -1
        return x