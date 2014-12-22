import java.math.BigInteger;
import java.util.*;
import java.util.stream.IntStream;
import java.util.stream.LongStream;

/**
 * Created by ilan on 21/12/14.
 */
public class Problems {

    public static long problem1(long max) {
        int[] multiplesOf = new int[] {3, 5};
        return LongStream.range(1, max).filter(i -> i % 3 == 0 || i % 5 == 0).sum() ;
    }

    public static BigInteger problem2(long max) {
        long beforeLast = 1 ;
        long last = 2 ;
        BigInteger sum = BigInteger.valueOf(2) ;
        long current = 0;
        while (current <=4000000) {
            current = beforeLast + last ;
            if (current % 2 == 0) sum = sum.add(BigInteger.valueOf(current));

            beforeLast = last ;
            last = current ;
        }
        return sum ;
    }

    private static boolean isPrime(long number) {
        for (int i = 2; i < Math.round(Math.sqrt(number)) + 1; i++) {
            if (number % i == 0) {
                return false ;
            }
        }
        return true ;
    }

    public static long problem3(long number) {
        long currentNumber = number;
        for (long i = 2; i < number; i++) {
            if (i > currentNumber) break ;
            if (currentNumber % i == 0 && isPrime(i)) {
                if (currentNumber / i == 1) return currentNumber ;
                currentNumber /= i ;
            }
        }
        //0 means something went wrong
        return currentNumber ;
    }

    private static boolean isPalindrome(long number) {
        String palinString = String.valueOf(number) ;
        for (int i = 0; i < palinString.length() / 2; i++) {
            if (palinString.charAt(i) != palinString.charAt(palinString.length() - i - 1)) {
                return false ;
            }
        }
        return true ;
    }

    public static long problem4() {
        List<Long> theLongList = new LinkedList<>() ;
        for (int i = 999; i > 99; i--) {
            for (int j = 999; j > 99; j--) {
                if (isPalindrome(i*j)) {
                    theLongList.add(Long.valueOf(i*j)) ;
                }
            }
        }
        Collections.sort(theLongList);
        return theLongList.get(theLongList.size() -1);
    }

    private static Map<Integer, Integer> getDivisorsForNumber(int number) {
        Map<Integer, Integer> divisors = new HashMap<>() ;
        long currentNumber = number;
        for (int i = 2; i < number+1; i++) {
            if (i > currentNumber) break ;
            if (isPrime(i)) {
                while (currentNumber % i == 0) {
                    divisors.putIfAbsent(i, 0) ;
                    divisors.compute(i, (k, v) -> v + 1) ;
                    currentNumber = currentNumber / i ;
                }
            }
        }
        return divisors ;
    }


    public static long problem5(int largestDivisor) {
        //To solve this problem i need to run on all numbers up to the largest divisors, find their prime divisors and then pick the numbers that contain the largest primes
        Map<Integer, Map<Integer, Integer>> divisorMap = new HashMap<>() ;
        IntStream.range(2, largestDivisor+1).forEach(i -> divisorMap.put(i, getDivisorsForNumber(i)));

        //The key is the prime, the value is the largest power of this prime found so far
        Map<Integer, Integer> mapOfLargestPrimes = new HashMap<>() ;

        Collection<Map<Integer, Integer>> maps = divisorMap.values() ;

        for (Map<Integer, Integer> map : maps) {
            for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
                mapOfLargestPrimes.putIfAbsent(entry.getKey(), entry.getValue()) ;
                mapOfLargestPrimes.computeIfPresent(entry.getKey(), (k, currentValue) -> {
                    if (entry.getValue() > currentValue) {
                        return entry.getValue() ;
                    }
                    return currentValue ;
                }) ;
            }
        }

        long lowestCommonMultiplier = 1 ;

        for (Map.Entry<Integer, Integer> entry : mapOfLargestPrimes.entrySet()) {
            lowestCommonMultiplier *= Math.pow(entry.getKey(), entry.getValue()) ;
        }

        return lowestCommonMultiplier ;

    }

    public static long problem6(int firstNaturalNumbers) {
        long squareOfSums = 0 ;
        long sumOfSquares = 0 ;
        for (int i = 1; i <= firstNaturalNumbers; i++) {
            squareOfSums += i ;

            sumOfSquares += (long)Math.pow(i, 2) ;
        }
        squareOfSums = (long)Math.pow(squareOfSums, 2) ;
        return squareOfSums - sumOfSquares;
    }

    public static long problem7(int thPrimeNumber) {
        int primesFound = 0 ;
        long currentNumber = 1 ;
        while (primesFound < thPrimeNumber) {
            currentNumber++ ;
            if (isPrime(currentNumber)) {
                primesFound++ ;
            }
        }
        return currentNumber ;
    }

    public static long problem8(int adjacentDigits) {
        String number =
                "73167176531330624919225119674426574742355349194934"+
                "96983520312774506326239578318016984801869478851843"+
                "85861560789112949495459501737958331952853208805511"+
                "12540698747158523863050715693290963295227443043557"+
                "66896648950445244523161731856403098711121722383113"+
                "62229893423380308135336276614282806444486645238749"+
                "30358907296290491560440772390713810515859307960866"+
                "70172427121883998797908792274921901699720888093776"+
                "65727333001053367881220235421809751254540594752243"+
                "52584907711670556013604839586446706324415722155397"+
                "53697817977846174064955149290862569321978468622482"+
                "83972241375657056057490261407972968652414535100474"+
                "82166370484403199890008895243450658541227588666881"+
                "16427171479924442928230863465674813919123162824586"+
                "17866458359124566529476545682848912883142607690042"+
                "24219022671055626321111109370544217506941658960408"+
                "07198403850962455444362981230987879927244284909188"+
                "84580156166097919133875499200524063689912560717606"+
                "05886116467109405077541002256983155200055935729725"+
                "71636269561882670428252483600823257530420752963450" ;

        long largestProductByNow = 0 ;
        for (int i = 0; i < number.length() - adjacentDigits; i++) {
            long currentProduct = 1 ;
            for (int j = i; j < i + adjacentDigits; j++) {
                currentProduct *= Integer.valueOf(String.valueOf(number.charAt(j))) ;
            }
            if (currentProduct > largestProductByNow) largestProductByNow = currentProduct ;
        }
        return largestProductByNow ;
    }


    public static void main(String[] args) {

        //System.out.println(problem3(600851475143L));
        //System.out.println(problem4());
        //System.out.println(problem7(10001));
        System.out.println(problem8(13));
    }


}
