class Solution:
    def uniqueMorseRepresentations(self, words: List[str]) -> int:
        
        morse = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]

        concat = []
        
        for i in words:
            transformation = ''
            for j in i:
                transformation += morse[ord(j) - 97]
            concat.append(transformation)
        return len(set(concat))